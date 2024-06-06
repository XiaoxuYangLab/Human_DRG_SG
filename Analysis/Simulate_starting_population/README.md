## Estimating the starting population based on variants shared by different groups of cells



### Simulate the potential progenitor cell population based on variants shared between different sample groups

Both DRG and SG or Both Left and Right: 0.666667 < correct DRG/SG or corrected Left/Right < 1.5

DRG/SG enriched or Left/Right enriched: 0.666667 > correct DRG/SG or corrected Left/Right or correct DRG/SG or corrected Left/Right > 1.5 and not 0

For variants that are in both DRG and SG (both DRG and SG; DRG enriched; SG enriched variants), start from the average DRG_AVG_C	SG_AVG_C	MEAN_DRG_SG_C	DRG_AVG_T	SG_AVG_T	MEAN_DRG_SG_T	
 
For variants that are in both left and right (both Left and Right, Left enriched, Right enriched), start from average LEFT_AVG_C	RIGHT_AVG_C	MEAN_DRG_SG_C_C	LEFT_AVG_T	RIGHT_AVG_T	MEAN_DRG_SG_C_T

Hypergeometric distribution simulation is carried out and the codes are [here](https://github.com/shishenyxx/Human_DRG_SG/blob/main/Analysis/Simulate_starting_population/Start_population_simulation.R)



### Simulate the potential progenitor cell population based on variants that are specific to sample groups

We assume variants specific to sample groups are 0 positive in the comparing group, when the split occurred, only one cell was carrying the variant. Clustered variants that reflected clustering events from passenger mutations. Performance with and without those clusters is compared. 

### Plotting for the simulation results

Codes for plotting the summarized result of the simulations are provided [here](https://github.com/shishenyxx/Human_DRG_SG/blob/main/Analysis/Simulate_starting_population/Plotting_for_simulations.R)
