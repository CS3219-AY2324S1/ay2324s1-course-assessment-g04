#!/bin/bash

# Parse CLI Arguments
is_minikube=0
if [[ $1 == minikube ]]; then
    is_minikube=1
fi

# Install Helm packages
kubectl create namespace ingress-nginx
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets

helm repo update

helm install ingress-nginx -n ingress-nginx ingress-nginx/ingress-nginx
helm install metrics-server -n kube-system metrics-server/metrics-server
helm install sealed-secrets -n kube-system --set-string fullnameOverride=sealed-secrets-controller sealed-secrets/sealed-secrets

# Setup sealed secrets key
# Refer to https://github.com/bitnami-labs/sealed-secrets/blob/main/docs/bring-your-own-certificates.md#generate-a-new-rsa-key-pair-certificates
PRIVATEKEY="peerprep_sealed_secret_tls.key"
PUBLICKEY="peerprep_sealed_secret_tls.crt"
NAMESPACE="kube-system"
SECRETNAME="peerprep-sealed-secret-tls"

kubectl -n "$NAMESPACE" create secret tls "$SECRETNAME" --cert="$PUBLICKEY" --key="$PRIVATEKEY"
kubectl -n "$NAMESPACE" label secret "$SECRETNAME" sealedsecrets.bitnami.com/sealed-secrets-key=active

kubectl -n "$NAMESPACE" scale deployment sealed-secrets-controller --replicas=0
kubectl -n "$NAMESPACE" scale deployment sealed-secrets-controller --replicas=1

# Enable Ingress snippet annotations
kubectl patch configmap ingress-nginx-controller -n ingress-nginx --type merge -p '{"data":{"allow-snippet-annotations":"true"}}'

if [[ $is_minikube == 1 ]]; then
    kubectl patch service ingress-nginx-controller -n ingress-nginx --type merge -p '{"spec":{"externalIPs":["'$(minikube ip | tr -d '\n')'"]}}'
fi

# Fix v1beta1.metrics.k8s.io MissingEndpoints
# This fix is not necessarily needed. To check if this fix is needed run "kubectl get apiservice". If the row for "v1beta1.metrics.k8s.io" has "False (MissingEndpoints)" as it's AVAILABLE value, apply this fix.
kubectl patch deployment metrics-server -n kube-system --type 'json' -p '[{"op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--kubelet-insecure-tls"}]'
