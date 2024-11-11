# Description

Description: The data and information presented is adapted from a clinical trial presented in Gregoire et al. (1996)1 and is stored in the le named Postnatal.csv located in the Assignment 1 folder in the Topic 4 section of LMS. Women with major depression which began within 3 months of child-birth were randomly assigned to the treatment group or to the placebo group. The treatment group consisted of patients using the Estrogen patch and the placebo group was made up of patients using the Placebo patch. The women were assessed pre-treatment (directly before administration of the treatment) and at post-treatment (1 month, 2 months, 3 months, 4 months, 5 months and 6 months after the administration of the treatment), using the Edinburgh postnatal depression scale (EPDS). This scale ranges from 0 to 30 and a score of at least 10 is regarded as possible depression. The variables of interest are:

- Patient: This is a factor variable that identies the patient (woman).
- P: This is the pre-treatment postnatal depression score less the mean pre-treatment postnatal depression score. This variable is treated as a continuous variable.  
- T: This is a factor (categorical) variable that identies the treatment administered to the patient. It has 2 levels (0 = Placebo patch, 1 = Estrogen patch).  
- M: This is the number of months after treatment less one month. It is treated as a continuous variable.  
- E: The postnatal depression score which is treated as a continuous variable.

# Task 1: Use the R computer package to produce a plot of the mean E vs M grouped by T.

![image](https://github.com/user-attachments/assets/c9dba54d-7728-4dbb-94ee-314b24572320)

According to the figure, the observed mean difference in mean E between T0 and T1 as we move from M0 to M5 does not change a lot. In order words, for each time period, the E Mean are the same distance apart. Therefore, interaction effect between T and M should not be included in the linear mixed model.  
