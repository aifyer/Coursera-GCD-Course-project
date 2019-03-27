
# Transformation steps

## Tidying of Test/Training data

The 'Test' and 'Train' datasets are individually transformed/tidied as follows:
NB this is an outline - Detailed instructions can be found in the main script **run_analysis.R** 

* Loaded from the original data, eg x_.txt, y_.txt, subject_.txt 
* Join (x) data (the measurements), with (y) data (the activity #'s). This takes the activity # in the (y) data file and looks up from the activity names/labels file *activity_labels.txt*, creating a new column *activity_name*.
* Combine with the *subject* data to create new column *subject_id*

## Concatenation of Test/Training data

Once the Test/Train datasets have been transformed as described above, they are concatenated together to 
produce **combinedDataSet**. At this point it is reduced down to only include the required columns, which are
determined to be those including *-mean()* or *-std()* in their names. ie Those that are mean, or standard deviation,
as described by the input data overview.

## Aggregation of combined data to produce averages

Once the *combinedDataSet* has been produced, a new data set **averagedDataSet** is built by grouping the
*subject_id* and *activity_name* columns, and calculating the mean across all remaining columns.

# Additional information

## Columns in output data set

Columns in the output datasets *combinedDataSet* and *averagedDataSet* share the same name as is provided
in the input dataset. These data are described in *features_info.txt*. Additionally, the output datasets include:

* **subject_id** Identifier of the subject involved in the expriment
* **activity_name** Identifier of the activity being undertaken. This is looked-up from the input file *activity_labels.txt*

## Dependencies

This script uses the **dplyr** package for some aspects of the transformation.

