<div align="center">

# Revisiting Conventional Pretraining vs. Knowledge Distillation Strategies for a Fixed Compute Budget

<a href="https://pytorch.org/get-started/locally/"><img alt="PyTorch" src="https://img.shields.io/badge/PyTorch-ee4c2c?logo=pytorch&logoColor=white"></a>
<a href="https://pytorchlightning.ai/"><img alt="Lightning" src="https://img.shields.io/badge/-Lightning-792ee5?logo=pytorchlightning&logoColor=white"></a>
<a href="https://hydra.cc/"><img alt="Config: Hydra" src="https://img.shields.io/badge/Config-Hydra-89b8cd"></a>
<a href="https://github.com/ashleve/lightning-hydra-template"><img alt="Template" src="https://img.shields.io/badge/-Lightning--Hydra--Template-017F2F?style=flat&logo=github&labelColor=gray"></a><br>

</div>

## 📌&nbsp;&nbsp;Introduction
Our research compares conventional pretraining to knowledge distillation strategies for masked language modelling in a fair setup with regards to compute as well as pretraining data.

Our repository consists of [How-to-distill-your-BERT](https://github.com/mainlp/How-to-distill-your-BERT/tree/main) and [academic-budget-bert](https://github.com/IntelLabs/academic-budget-bert).

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

First, crawl English Wikipedia and download the BookCorpus, see [here](./No_Distillation/dataset).


We provided example scripts for No-KD and KD strategies:

- [NoKD Models](./No_Distillation/slurm/input/pretraining)
- [KD Models](./Distillation_Strategies/slurm/input/pretraining)

E.g. pretraining NoKD 6-Layer & finetuning+evaluation on GLUE
```bash
# [OPTIONAL] activate conda environment
conda activate revisiting_distillation

# Change to NoKD Folder
cd No_Distillation

# Pretraining: NoKD 6-Layer
sh slurm/input/pretraining/6layer_1epoch.sh

# Finetuning on GLUE
sh slurm/input/glue/finetuning.sh
```

E.g. pretraining DistillBERT 6-Layer & finetuning+evaluation on GLUE

```bash
# [OPTIONAL] activate conda environment
conda activate revisiting_distillation

# Change to NoKD Folder
cd Distillation_Strategies

# Pretraining: NoKD 6-Layer
sh slurm/input/pretraining/distillbert_6layer_1epoch.sh

# Finetuning on GLUE
sh slurm/input/glue/finetuning.sh
```
