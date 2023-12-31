[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/6BOvYMwN)
# G04 Projects & Assignments

This repository is designed as a collection of Git submodules.

## Guide
### Cloning the Repository

By default, `git clone` will not clone submodule repositories, leaving you with empty directories where the submodule repository files should be. To clone all files including those of the submodule repositories, use the `--recurse-submodules` option.

```bash
git clone --recurse-submodules git@github.com:CS3219-AY2324S1/ay2324s1-course-assessment-g04.git
```

Should you forget to add the `--recurse-submodules` option when cloning the repository, you can run the following command to clone the submodules:

```bash
git submodule update --init
```

### Updating Specific Submodule

Git submodule points to a specific commit in the submodule repository. When a submodule repository is updated, the parent repository has to be updated manually.

```bash
cd <submodule_repo_dir>
git pull origin master
cd <parent_repo_dir>
git add .
git commit
```

## Project

Refer to [project](project/project.md).

## Assignment 1

Refer to the "README.md" in the "assignment_1" directory.

If the "assignment_1" directory is empty, please run:

```bash
git submodule update --init
```

## Assigmnent 2

Refer to [assignment_2](assignment_2/assignment_2.md).

## Assigmnent 3 & 4

Refer to [assignment_3_and_4](assignment_3_and_4/assignment_3_and_4.md).

## Assigmnent 5

Refer to [assignment_5](assignment_5/assignment_5.md).
