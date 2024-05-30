### permutation analysis for the observation of genetic similarity

## for the 75 nuclei with resolved cell type
# permutate 10,000 times 
for i in {1..10000};do shuf 75_input.txt > cell/${i}.txt;done

# select the number of observed branches
for i in {1..10000};do paste <(cat cell/${i}.txt|awk 'NR % 2 == 1') <(cat cell/${i}.txt|awk 'NR % 2 == 0')|head -n 28|awk '{print $1"_"$3" "$2"_"$4}'|sed 's/T3_T2/T2_T3/g'|sed 's/SG_DRG/DRG_SG/g'|sort|uniq -c>branch/${i}.calc.txt;done

# summarize the permutation results
for i in {1..10000};do paste <(awk -v pat="T2_T2 DRG_DRG" 'BEGIN {found=0} $0 ~ pat {print $1; found=1} END {if (found ==0) print "0"}' branch/${i}.calc.txt) <(awk -v pat="T2_T2 DRG_SG" 'BEGIN {found=0} $0 ~ pat {print $1; found=1} END {if (found ==0) print "0"}' branch/${i}.calc.txt) <(awk -v pat="T2_T2 SG_SG" 'BEGIN {found=0} $0 ~ pat {print $1; found=1} END {if (found ==0) print "0"}' branch/${i}.calc.txt) <(awk -v pat="T2_T3 DRG_DRG" 'BEGIN {found=0} $0 ~ pat {print $1; found=1} END {if (found ==0) print "0"}' branch/${i}.calc.txt) <(awk -v pat="T2_T3 DRG_SG" 'BEGIN {found=0} $0 ~ pat {print $1; found=1} END {if (found ==0) print "0"}' branch/${i}.calc.txt) <(awk -v pat="T2_T3 SG_SG" 'BEGIN {found=0} $0 ~ pat {print $1; found=1} END {if (found ==0) print "0"}' branch/${i}.calc.txt) <(awk -v pat="T3_T3 DRG_DRG" 'BEGIN {found=0} $0 ~ pat {print $1; found=1} END {if (found ==0) print "0"}' branch/${i}.calc.txt) <(awk -v pat="T3_T3 DRG_SG" 'BEGIN {found=0} $0 ~ pat {print $1; found=1} END {if (found ==0) print "0"}' branch/${i}.calc.txt) <(awk -v pat="T3_T3 SG_SG" 'BEGIN {found=0} $0 ~ pat {print $1; found=1} END {if (found ==0) print "0"}' branch/${i}.calc.txt)>>8718_ResolveOME_75_Cells_10000_permutation_summary.txt;done

## for the 224 nuclei with resolved cell type
#permutate 10,000 times 
for i in {1..10000};do shuf 224_input.txt > cell/${i}.txt;done

#select the number of observed branches
for i in {1..10000};do paste <(cat cell/${i}.txt|awk 'NR % 2 == 1') <(cat cell/${i}.txt|awk 'NR % 2 == 0')|tail -n 76|awk '{print $1"_"$3" "$2"_"$4}'|sed 's/T3_T2/T2_T3/g'|sed 's/SG_DRG/DRG_SG/g'|sort|uniq -c>branch/${i}.calc.txt;done

# summarize the permutation results
for i in {1..10000};do paste <(awk -v pat="T2_T2 DRG_DRG" 'BEGIN {found=0} $0 ~ pat {print $1; found=1} END {if (found ==0) print "0"}' branch/${i}.calc.txt) <(awk -v pat="T2_T2 DRG_SG" 'BEGIN {found=0} $0 ~ pat {print $1; found=1} END {if (found ==0) print "0"}' branch/${i}.calc.txt) <(awk -v pat="T2_T2 SG_SG" 'BEGIN {found=0} $0 ~ pat {print $1; found=1} END {if (found ==0) print "0"}' branch/${i}.calc.txt) <(awk -v pat="T2_T3 DRG_DRG" 'BEGIN {found=0} $0 ~ pat {print $1; found=1} END {if (found ==0) print "0"}' branch/${i}.calc.txt) <(awk -v pat="T2_T3 DRG_SG" 'BEGIN {found=0} $0 ~ pat {print $1; found=1} END {if (found ==0) print "0"}' branch/${i}.calc.txt) <(awk -v pat="T2_T3 SG_SG" 'BEGIN {found=0} $0 ~ pat {print $1; found=1} END {if (found ==0) print "0"}' branch/${i}.calc.txt) <(awk -v pat="T3_T3 DRG_DRG" 'BEGIN {found=0} $0 ~ pat {print $1; found=1} END {if (found ==0) print "0"}' branch/${i}.calc.txt) <(awk -v pat="T3_T3 DRG_SG" 'BEGIN {found=0} $0 ~ pat {print $1; found=1} END {if (found ==0) print "0"}' branch/${i}.calc.txt) <(awk -v pat="T3_T3 SG_SG" 'BEGIN {found=0} $0 ~ pat {print $1; found=1} END {if (found ==0) print "0"}' branch/${i}.calc.txt)>>8718_ResolveOME_75_Cells_10000_permutation_summary.txt;done
