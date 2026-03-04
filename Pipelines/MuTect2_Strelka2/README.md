# MuTect2 Strelka2 Paired mode

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
