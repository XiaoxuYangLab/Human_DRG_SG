## Estimating the starting population based on variants shared by different groups of cells

### Both DRG and SG or Both Left and Right: 0.666667 < correct DRG/SG or corrected Left/Right < 1.5

### DRG/SG enriched or Left/Right enriched: 0.666667 > correct DRG/SG or corrected Left/Right or correct DRG/SG or corrected Left/Right > 1.5 and not 0

### For variants that are in both DRG and SG (both DRG and SG; DRG enriched; SG enriched variants), start from the average DRG_AVG_C	SG_AVG_C	MEAN_DRG_SG_C	DRG_AVG_T	SG_AVG_T	MEAN_DRG_SG_T	
 
### For variants that are in both left and right (both Left and Right, Left enriched, Right enriched), start from average LEFT_AVG_C	RIGHT_AVG_C	MEAN_DRG_SG_C_C	LEFT_AVG_T	RIGHT_AVG_T	MEAN_DRG_SG_C_T

### Hypergeometric distribution simulation is carried out and the codes are [here](https://github.com/shishenyxx/Human_DRG_SG/blob/main/Analysis/Simulate_starting_population/Start_population_simulation.R)
