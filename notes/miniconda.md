
# Miniconda3

[Miniconda](https://conda.io/miniconda.html)
[User-Guide](https://conda.io/docs/user-guide/getting-started.html)


## Verify Install

- `conda --version`
- `conda update conda`


## Managing Environments

Create Environments: `conda create --name NAME PACKAGES`
List Environments: `conda info --envs`
Switch to Environments: `source activate NAME`
Switch to Root/Base: `source deactivate`
Delete Environments: `conda remove --name NAME --all`
Clone Environment: `conda create --name NAME --clone NAME_TO_CLONE`
Install Packages: `conda install --name NAME PACKAGES`
