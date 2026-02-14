###DARLIN Analysis


Protocall Reference.

Refer to [Nature Protocols Paper](https://www.nature.com/articles/s41596-025-01141-z) — see page 22 for `config.yaml` inputs (CA, TA, and RA).


Notebooks for correlation, data analysis, and upset plots(Uploaed in Github):  
`CA.ipynb`, `TA.ipynb`, `RA.ipynb`, and `Bulk_tutorial.ipynb`
 Refer to [Python Scripts for plots]    ( https://github.com/XiaoxuYangLab/Human_DRG_SG/tree/main/Analysis/Darline) https://github.com/XiaoxuYangLab/Human_DRG_SG/tree/main/Analysis/Darline



Snakemake pipeline path (CHPC node) for all CA, TA and RA:  
`/scratch/ucgd/lustre-labs/yang/User/u6069192_Sai/Snakmake_pipe_lines/Darlin_org/Main_Darl`

##Plotting clustered heatmaps and barcode heatmaps (DARLIN)

After running the DARLIN Snakemake pipeline, the results are saved under:

DARLIN/results_cutoff_override_3/

Panel Figures generated:
Clustered heatmap with dendrograms.
Barcode count heatmap 

Requirements
Install the required Python packages using the provided Conda environment file:
environment.yml

Key dependencies include:
numpy
seaborn
scipy
cospar

Plotting script:
Run the plotting script:
D2502_Panel_Plots.py





##Reference:  
Snakemake_DARLIN package — [GitHub Repo](https://github.com/ShouWenWang-Lab/snakemake_DARLIN)  
DARLIN tutorial notebooks — [GitHub Tutorial](https://github.com/ShouWenWang-Lab/DARLIN_tutorial)  
Nature Protocols — [Article Link](https://www.nature.com/articles/s41596-025-01141-z#Sec1)

