# MuTect2 Strelka2 Paired mode

## Requirements before start

#### SOFTWARE

annovar : "~/annovar/annotate_variation.pl"

annovar_db : "~/annovar/humandb/"

#### SCRIPTS

homopolymer_script : "helper_scripts/compute_homopolymer_dinucleotide_nearindel_rpmsk.py"

ci_script : "helper_scripts/run_samtools_and_compute_ci.py"

summerize_script : "helper_scripts/summerize_results.py"

#### REFERENCE FILES

bed_file : "~/files_for_pipelines/wgs_nochr.bed"

ref_fasta : "~/reference_fasta/human_g1k_v37_decoy.fasta"

gnomad_af : "~/files_for_pipelines/af-only-gnomad.raw.sites.b37.vcf.gz"

ucsc_rpmsk : "~/ref_files/rpmsk.txt"

repeat_masker : "~/ref_files/all_repeats.b37.bed"

segdup : "~/ref_files/segdup.hg19.bed"

#### SINGULARITY CONTAINERS

strelka2_singularity : "singularity/strelka_2.9.10--0/"

gatk4_singularity : "singularity/gatk4_4.0.4.0--0/"

bedtools_singularity : "singularity/bedtools_2.27.0--0/"

samtools_singularity : "singularity/samtools_1.13--h8c37831_0/"

## Input

#sample: name of sample

tumor: name of tumor sample (should match @SM tag in bam)	

normal: name of normal control sample (should match @SM tag in bam)	

tumor_path: path to tumor bam file	

normal_path: path to normal	control sample

vcf_path: path to haplotypecaller vcf of the tumor file (for annotation purpose)

## Output

vcf for MuTect2

vcf for Strelka2

combined vcf for MuTect2 and Strelka2

scratch folder for individual calls
