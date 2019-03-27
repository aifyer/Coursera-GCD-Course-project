
# Input data

The input data, provided as part of the assignment package and included in this repo. The technical details of this 
are best described in *features_info.txt*. 

# Output data

The tidied data (grouped by subject/activity and averaged across all measures) shares the same column names as
the primary input data. For the purposes of this assignment, only columns referring to *mean* or *standard deviation*
have been retained.

The final, combined and aggregated dataset, has been saved to *aggregated_output_data.txt*. This contains the 
*-mean()* and *-std()* columns included (as averages, all numeric) in the dataset(s), along with additional columns:

* *subject_id* - Integer, unique identifier of subject involved in the experiment. These are in the range [1:30]
* *activity_name* - Factor, naming the activity relevant to that row:
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING





