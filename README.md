<div align="center">

# Revisiting Conventional Pretraining vs. Knowledge Distillation Strategies for a Fixed Compute Budget

<a href="https://pytorch.org/get-started/locally/"><img alt="PyTorch" src="https://img.shields.io/badge/PyTorch-ee4c2c?logo=pytorch&logoColor=white"></a>
<a href="https://pytorchlightning.ai/"><img alt="Lightning" src="https://img.shields.io/badge/-Lightning-792ee5?logo=pytorchlightning&logoColor=white"></a>
<a href="https://hydra.cc/"><img alt="Config: Hydra" src="https://img.shields.io/badge/Config-Hydra-89b8cd"></a>
<a href="https://github.com/ashleve/lightning-hydra-template"><img alt="Template" src="https://img.shields.io/badge/-Lightning--Hydra--Template-017F2F?style=flat&logo=github&labelColor=gray"></a><br>

</div>

## 📌&nbsp;&nbsp;Introduction
Our research compares conventional pretraining to knowledge distillation strategies for masked language modelling in a fair setup with regards to compute as well as pretraining data.

## 🚀&nbsp;&nbsp;Quickstart

Configure your environment first.

```bash
# clone project, cd to project folder

# [OPTIONAL] create conda environment
conda create -n revisiting_distillation python=3.9
conda activate revisiting_distillation

# install requirements
pip install -r requirements.txt

# Please make sure to have the right Pytorch Version: Install pytorch according to instructions
# https://pytorch.org/get-started/
```

First, crawl English Wikipedia and download the BookCorpus, see [here](https://github.com/MinhDucBui/revisiting_distillation/tree/main/No_Distillation/dataset).


We provided example scripts for No-KD and KD strategies:

- [NoKD Models](https://github.com/MinhDucBui/revisiting_distillation/tree/main/No_Distillation/slurm/input/pretraining)
- [KD Models](https://github.com/MinhDucBui/revisiting_distillation/tree/main/Distillation_Strategies/slurm/input/pretraining)

