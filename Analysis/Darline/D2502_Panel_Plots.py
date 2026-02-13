# %%
# -------------------------
# Paths & parameters
# -------------------------
root_path = "/uufs/chpc.utah.edu/common/HIPAA/u6069192/scratch_link/ucgd/lustre-labs/yang/User/u6069192_Sai/Snakmake_pipe_lines/Darlin_Nov_11/Round_4_Analysis"
paper_figure_path = f"{root_path}/DARLIN_Figs/figure_RA"
os.makedirs(paper_figure_path, exist_ok=True)

frequency_cutoff = 0.1
BC_complexity = 4
min_clone_size = 2
save_data_des = "_freqCutoff0.1"


df_list = []
for locus in ["CA", "TA", "RA"]:
    path = f"{root_path}/{locus}/DARLIN/results_cutoff_override_3/merge_all/df_allele_all_{locus}_{save_data_des}_HQ_BCcomplex{BC_complexity}_freq{frequency_cutoff}.csv"
    print(f" Loading HQ alleles from: {path}")
    df = pd.read_csv(path)
    df["locus"] = locus
    df_list.append(df)

df_all = pd.concat(df_list, ignore_index=True)


def clean_sample(s):
    if pd.isna(s):
        return np.nan
    s = re.sub(r"_S\d+_L\d+", "", str(s))
    s = re.sub(r"[-_](CA|TA|RA)[-_]*$", "", s, flags=re.IGNORECASE)
    return s.strip()

df_all["sample_norm"] = df_all["sample"].apply(clean_sample)
print(" Unique normalized tissues:", sorted(df_all["sample_norm"].unique()))


exclude_tissues = ["Heart", "Liver"]
df_all = df_all[~df_all["sample_norm"].isin(exclude_tissues)]
print(f" Excluded tissues: {exclude_tissues}")
print(f" Remaining tissues: {sorted(df_all['sample_norm'].unique())}")


adata_orig = hf.generate_adata_cell_by_allele(
    df_all, min_clone_size=min_clone_size, clone_id_key="allele"
)

# Populate state_info (needed for plotting)
if "state_info" not in adata_orig.obs.columns or adata_orig.obs["state_info"].isna().all():
    adata_orig.obs["state_info"] = df_all["sample"].astype(str).values[:adata_orig.n_obs]

valid_states = list(pd.Series(adata_orig.obs["state_info"]).dropna().unique())
print("↪ Example valid states:", valid_states[:8], "...")


def match_prefix(prefix):
    """Match prefix regardless of suffixes like -CA, -TA, -RA."""
    return [s for s in valid_states if re.match(rf"^{prefix}(\b|-|_)", s)]

groups_raw = [
    match_prefix("DRG"),  # all DRG-L1/L2/R1/R2 across loci
    match_prefix("SG"),   # all SG-L1/L2/R1/R2 across loci
]

names_raw = ["DRG", "SG"]

SampleList_RAW_2, short_names = [], []
for g, n in zip(groups_raw, names_raw):
    if len(g) > 0:
        SampleList_RAW_2.append(g)
        short_names.append(n)

print(f" Using {len(SampleList_RAW_2)} non-empty groups:")
for n, g in zip(short_names, SampleList_RAW_2):
    print(f"   - {n}: {len(g)} sublabels")

cs.settings.set_figure_params(figsize=(4, 4))
mosaic_pl.analyze_cell_coupling_core(
    adata_orig,
    selected_fates=SampleList_RAW_2,
    short_names=short_names,
    remove_single_lineage_clone=False,
    plot_sample_number=False,
    plot_barcodes_binary=False,
    plot_barcodes_normalize=False,
    plot_restricted=True,
    plot_cell_count=False,
    plot_hierarchy=False,
    plot_Jaccard=False,
    plot_pie=False,
    plot_correlation=False,
    order_map=False,
    included_fates_N=[0],
    included_fates_mode="only",
    time_info=None,
    print_matrix=False,
    figure_path=paper_figure_path,
    data_des="Combined_CA_TA_RA_noHeartLiver",
    vmax=0.25,
)


# -------------------------
plt.title("Restricted Barcode Heatmap — DRG / SG (Excluding Heart & Liver)")
plt.tight_layout()
out = f"{paper_figure_path}/restricted_barcode_heatmap_CA_TA_RA_excludingHeartLiver.pdf"
plt.savefig(out, dpi=300)
plt.show()

print(f" Saved heatmap (no Heart/Liver): {out}")
print(f" Included normalized tissues: {short_names}")


# %%
################### FULL FINAL CODE ###################

# --------------------------------------------------
# Combined Fate Coupling Across CA + TA + RA (Excluding Heart & Liver)
# --------------------------------------------------

import os, re
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from scipy.cluster.hierarchy import dendrogram, linkage
import mosaiclineage.help_functions as hf
import cospar as cs

cs.settings.autosave = False
cs.settings.figure_path = "./"

# --- Paths & parameters ---
root_path = "/uufs/chpc.utah.edu/common/HIPAA/u6069192/scratch_link/ucgd/lustre-labs/yang/User/u6069192_Sai/Snakmake_pipe_lines/Darlin_Nov_11/Round_4_Analysis"
paper_figure_path = f"{root_path}/DARLIN_Figs/figure_RA"
os.makedirs(paper_figure_path, exist_ok=True)

frequency_cutoff = 0.1
BC_complexity = 4
min_clone_size = 2
save_data_des = "_freqCutoff0.1"


df_list = []
for locus in ["CA", "TA", "RA"]:
    path = f"{root_path}/{locus}/DARLIN/results_cutoff_override_3/merge_all/df_allele_all_{locus}_{save_data_des}_HQ_BCcomplex{BC_complexity}_freq{frequency_cutoff}.csv"
    print(f"Loading HQ alleles from: {path}")
    df = pd.read_csv(path)
    df["locus"] = locus
    df_list.append(df)

df_sc_CARLIN_HQ = pd.concat(df_list, ignore_index=True)

def clean_sample(s):
    if pd.isna(s):
        return np.nan
    s = re.sub(r"_S\d+_L\d+", "", str(s))
    s = re.sub(r"[-_](CA|TA|RA)[-_]*$", "", s, flags=re.IGNORECASE)
    return s.strip()

df_sc_CARLIN_HQ["sample_norm"] = df_sc_CARLIN_HQ["sample"].apply(clean_sample)


exclude_tissues = ["Heart", "Liver"]
df_sc_CARLIN_HQ = df_sc_CARLIN_HQ[~df_sc_CARLIN_HQ["sample_norm"].isin(exclude_tissues)]

print(f" Excluded tissues: {exclude_tissues}")
print(f" Remaining tissues: {sorted(df_sc_CARLIN_HQ['sample_norm'].unique())}")


adata_orig = hf.generate_adata_cell_by_allele(
    df_sc_CARLIN_HQ,
    min_clone_size=min_clone_size,
    clone_id_key="allele"
)


if "state_info" not in adata_orig.obs.columns or adata_orig.obs["state_info"].isna().all():
    adata_orig.obs["state_info"] = df_sc_CARLIN_HQ["sample_norm"].astype(str).values
else:
    adata_orig.obs["state_info"] = adata_orig.obs["state_info"].astype(str).apply(clean_sample)

unique_samples = sorted(df_sc_CARLIN_HQ["sample_norm"].unique())
short_names = [x[6:] if len(x) > 6 else x for x in unique_samples]
mapping_dict = dict(zip(unique_samples, short_names))
adata_orig.obs["state_info"] = adata_orig.obs["state_info"].map(mapping_dict)


adata_orig.obs["time_info"] = adata_orig.obs["state_info"].str.contains("HSC", na=False)


cs.settings.set_figure_params(figsize=(6, 5.5))
cs.tl.fate_coupling(
    adata_orig,
    selected_fates=short_names,
    source="X_clone",
    normalize=True
)


cs.pl.fate_coupling(
    adata_orig,
    source="X_clone",
    title="Combined CA + TA + RA (Excluding Heart & Liver)"
)

plt.tight_layout()
output_file = f"{paper_figure_path}/fate_coupling_CA_TA_RA_excludingHeartLiver.pdf"
plt.savefig(output_file, dpi=300)
plt.show()
print(f"Saved fate coupling plot: {output_file}")


fc_dict = adata_orig.uns["fate_coupling_X_clone"]

FC = fc_dict["X_coupling"]           # numeric matrix
names = fc_dict["fate_names"]        # tissue labels

FC = pd.DataFrame(FC, index=names, columns=names)

print("Fate coupling matrix shape:", FC.shape)
print(FC)

sns.set(context="notebook", font_scale=1.1)

cg = sns.clustermap(
    FC,
    method="ward",
    metric="euclidean",
    cmap="Reds",
    linewidths=0.4,
    figsize=(12, 12),
    dendrogram_ratio=(0.2, 0.2),
    cbar_pos=(0.02, 0.8, 0.03, 0.18)
)

plt.suptitle("Fate Coupling Heatmap + Dendrogram\n(Excluding Heart & Liver)", y=1.02)

heatmap_output = f"{paper_figure_path}/fate_coupling_heatmap_dendrogram.pdf"
cg.savefig(heatmap_output, dpi=300)

print(f"Saved heatmap + dendrogram: {heatmap_output}")
print(f" Included tissues ({len(names)}): {list(names)}")

################### END OF FINAL CODE ###################



