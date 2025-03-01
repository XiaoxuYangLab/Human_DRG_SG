# Understanding human development relationships between dorsal root ganglia and sympathetic ganglia chains

Samples from ID06 (8553), ID07 (8718), and ID08 (8990), three donors without diagnosed proliferative or infectious disorders in the central nerve system, were systematically dissected and collected. DNA extracted from these samples was subjected to 30x and 300x WGS bulk genome sequencing. Clonal mosaic variants were detected from sample-shared and sample-specific data analysis pipelines, and a subset of high-confidence variants were subjected to MPAS and snMPAS design. Genotypes and accurate allelic fractions were obtained through the MPAS and snMPAS analysis from both the original samples sent for sequencing and sorted single nuclei. Matrixes of allelic fractions quantified from different samples were used for the estimation of genomic similarities and inferring developmental relationships. Codes and pipelines for the analysis are described below. WGS panel of normal data is available [here](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=PRJNA660493&o=acc_s%3Aa).

-----------------------------------

### 0. Requirements

Each pipeline and related requirements are detailed individually. In general, a Linux system is required for the raw data analysis pipeline and Linux/PC/MAC with R and python capability is required for the analyses and simulations in this repository.

-----------------------------------

### 1. Pipelines for the process of whole-genome sequencing data

#### 1.1 Pipelines for WGS data process

FASTQ files were aligned to GRCh37 reference genome using [this pipeline](https://github.com/shishenyxx/Human_Inhibitory_Neurons/tree/main/Pipelines/Alignment), recalibrated bams were further merged with samtools merge to acquire the 30x and 300x depth.

Germline heterozygous variants are called with HaplotypeCaller following [this pipeline](https://github.com/shishenyxx/Sperm_control_cohort_mosaicism/tree/master/Pipelines/Preprocessing/Haplocaller).

#### 1.2 Pipelines for mosaic SNV/indel calling and variant annotations

Sample-unique variant calling with Mutect2 and Strelka2 paired mode is carried out following [this pipeline](https://github.com/shishenyxx/Human_DRG_SG/tree/main/Pipelines/MuTect2_Strelka2).

Sample-specific variant calling is first carried with [this pipeline](https://github.com/shishenyxx/Adult_brain_somatic_mosaicism/tree/master/pipelines/WGS_SNV_indel_calling_pipeline/Mutect2_single_mode) using Mutect2 single mode (full panel of normal). Followed with DeepMosaic is carried out following the [official guidelines](https://github.com/shishenyxx/DeepMosaic) and MosaicForecast using [this pipeline](https://github.com/shishenyxx/Adult_brain_somatic_mosaicism/tree/master/pipelines/WGS_SNV_indel_calling_pipeline/MosaicForecast_pipeline).

Sample-unique and sample-specific variants are further called without control using MosaicHunter following [this pipeline](https://github.com/shishenyxx/Adult_brain_somatic_mosaicism/tree/master/pipelines/WGS_SNV_indel_calling_pipeline/MosaicHunter_single_mode_pipeline) with the 30x and 300x properties file, respectively.

Variants were further combined and annotations were performed using [this pipeline](https://github.com/shishenyxx/PASM/tree/master/Snakemake_pipeline).

-----------------------------------

### 2. Pipelines for the process of Massive Parallel Amplicon Sequencing (MPAS) and single-nuclei Massive Parallel Amplicon Sequencing (snMPAS)

#### 2.1 Pipelines for MPAS and snMPAS data alignment and processing

Alignment and processing of MPAS and snMPAS were carried out following [this pipeline](https://github.com/shishenyxx/Adult_brain_somatic_mosaicism/tree/master/pipelines/MPAS_and_snMPAS_processing_pipeline)

#### 2.2 Pipelines for AF quantification and variant annotations

After alignment, candidate variants were further combined and genotyped using [this pipeline](https://github.com/shishenyxx/PASM/tree/master/Snakemake_pipeline) in every sample detected with MPAS and snMPAS. 

Mosaic candidates called by more than two of the above pipelines were selected as candidates to design the MPAS panel. For skin samples, only 100 variants were randomly selected for the design. Positive controls from heterozygous variants from common SNPs and negative controls from alternative homozygous variants from common SNPs were selected in the design of the MPAS panel.

Quality control was carried out for WGS and MPAS MAFs, code and scripts for quality control can be found [here](https://github.com/shishenyxx/Human_DRG_SG/tree/main/Pipelines/QC).

-----------------------------------

### 3. Computational and statistical analyses for human neuronal clonal distribution patterns

#### 3.1 Codes for mosaic variant determination, annotations, and plotting

Variant annotations for samples are provided separately.

#### 3.2 Codes for statistical analysis, and the related plotting

"geoclones" are used to map the AF of each candidate mosaic variant onto the schematic of the body plan, geoclones of the three donors were generated from a code [here](https://github.com/shishenyxx/Human_DRG_SG/tree/main/Analysis/geoclone).

Estimation of AF standard deviation within and between ganglia chains (on the rostral-caudal axis within DRG or SG chain versus dorsal-ventral axis between DRG and SG from same or adjacent spinal levels) can be found [here](https://github.com/shishenyxx/Human_DRG_SG/tree/main/Analysis/Stdev_vertical_horizontal)

Starting cell population when DRG/SG split and Left/Right split are estimated [here](https://github.com/shishenyxx/Human_DRG_SG/tree/main/Analysis/Simulate_starting_population).

For snMPAS and ResolveOME analysis, permutation analysis is described [here](https://github.com/shishenyxx/Human_DRG_SG/tree/main/Analysis/Permutation_single_cell).

10,000 bootstrap analysis was carried out to estimate the robustness of the dendrograms, details are described [here](https://github.com/shishenyxx/Human_DRG_SG/tree/main/Analysis/bootstrap)

-----------------------------------

### 4. Runtime

The pipeline for deep whole-genome sequencing should run for 10-20 hours each step on a Liunx server with 4-8 cores 60-120G memory.

-----------------------------------



### 5. Contact:

:email: Keng Ioi (Harry) Vong: [kivong@health.ucsd.edu](mailto:kivong@health.ucsd.edu)

:email: Xiaoxu Yang: [xiaoxu.yang@genetics.utah.edu](mailto:xiaoxu.yang@genetics.utah.edu), [xiaoxuyanglab@gmail.com](mailto:xiaoxuyanglab@gmail.com), [xiy010@health.ucsd.edu](mailto:xiy010@health.ucsd.edu)

:email: Joseph Gleeson: [jogleeson@health.ucsd.edu](mailto:jogleeson@health.ucsd.edu)

-----------------------------------

### 5. Cite the data and codes:
Keng Ioi Vong*, Yanina D Alvarez, Geoffroy Noel, Scott T Barton, Changuk Chung, Robyn Howarth, Naomi Meave, Qingquan Zhang, Fiza Jiwani, Chelsea Barrows, Arzoo Patel, Stephen F Kingsmore, Melanie D White, Xiaoxu Yang*,#, Joseph G Gleeson#, 2024, [bioRxiv](https://www.biorxiv.org/content/10.1101/2024.09.25.615004v1), DOI: [https://doi.org/10.1101/2024.09.25.615004](https://doi.org/10.1101/2024.09.25.615004).


