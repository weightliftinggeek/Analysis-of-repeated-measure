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

# Task 2: Use the R computer package to produce a plot of the values of E vs M for each Patient grouped by T

![image](https://github.com/user-attachments/assets/9e7aa1f4-aded-4f50-b594-15f8c449d809)

According to the figure, the slope of each line (represents each patient) are clearly not parallel which suggests that the impact of M on E for each patient could be significant. Therefore, the random effect of M on E should be included in the linear mixed model. The figure also shows that the starting point of E when M is 0 varies between patients. This suggests that
a random intercept for each patient should be included in the linear mixed model.

# Task 3: Describing the model

The researchers in the study set up the following linear mixed model to analyze their research questions.  
Eti = β0 + β1 Pi + β2 Ti + β3Mti + β4 Pi × Ti + β5 Pi ×Mti + β6 Ti ×Mti  
+ μ0i + μ1iMti + εti, (1)  
• where Eti is the postnatal depression score for patient i (i = 1, . . . , 61) at occasion t (t = 1, 2, ..., 6),  
• Pi is the pre-treatment postnatal depression score for patient i less the mean pre-treatment postnatal  
depression score (averaged over patients),  
• Ti = 1 if patient i is administered the Estrogen patch, and 0 otherwise,  
• Mti is the number of months after treatment less one month, for patient i at occasion t,  
• β0 is the fixed intercept,  
• β1, β2 and β3 are the the fixed simple effects of P, T and M, respectively,  
• β4, β5 and β6 is the fixed interaction effects of P × T, P ×M and T ×M respectively,  
• μ0i is the random intercept specific to patient i,  
• μ1i is the random effect of M on E specific to patient i,  
• εti is the random error associated with measuring E at occasion t, for patient i.  
![image](https://github.com/user-attachments/assets/936debdf-026a-4507-a776-07d0ad24f71a)  
![image](https://github.com/user-attachments/assets/c7c7fec0-6704-4abf-adae-779dffbb88b9) 
![image](https://github.com/user-attachments/assets/6b44a017-a405-47a8-ac98-7f158c78929b)  

# Task 4: Testing for random effects
The researchers would like to test whether the random effect of M should be included in model (3).  
They decide to test, at the 5% significance level, the null hypothesis H0 : ψ1 = 0 vs the alternative  
hypothesis H1 : ψ1 > 0 using the REML-based likelihood ratio test p-value.  
## (a) Write down the reference model for this test.
Eti = β0 + β1 Pi + β2 Ti + β3Mti + β4 Pi × Ti + β5 Pi ×Mti + β6 Ti ×Mti  
+ μ0i + μ1iMti + εti, (2)  
## (b) Write down the nested model for this test.  
Eti = β0 + β1 Pi + β2 Ti + β3Mti + β4 Pi × Ti + β5 Pi ×Mti + β6 Ti ×Mti  
+ μ0i + εti, (3)  
## (c) Use the R computer package to perform this test. What is the p-value for this test?  
R codes:  
### Fitting referrence model, model 1 using REML  
Model1 <- lme(E ~ P + T.f + M + P : T.f + P : M + T.f : M, random = ~ M | Patient.f,  
method = "REML", correlation = corCompSymm(), weights = varIdent(form = ~ 1 | M),  
data = postNatal)  
Nested model, model 2  
Model2 <- lme(E ~ P + T.f + M + P : T.f + P : M + T.f : M, random = ~ 1 | Patient.f,  
method = "REML", data = postNatal)  
### Obtaining the likelihood ratio observed test statistic, LRT = 2ln(LRR) - 2ln(LNR).  
likelihood <- anova(Model1, Model2) # Obtain ln(LRR) and ln(LNR)  
likelihood <- subset(likelihood, select = -c(call, Test))  
LRT <- anova(Model1, Model2)$L.Ratio[-1] # Obtain LRT = 2ln(LRR) - 2ln(LNR)  
Table_1 <- xtable(likelihood, align = "cccccccc", label = ’Table 1’, caption =  
’Likelihood ratio observed test statistic, LRT = 2ln(LRR) - 2ln(LNR)’)  
print(Table_1, include.rownames = FALSE, caption.placement = "top", file =  
"Table1.tex", append = TRUE)  
![image](https://github.com/user-attachments/assets/d37e59ef-4f9f-4230-9c69-5a1bc4089d4c)
R codes:  
### Calculating the p-value for the REML based likelihood ratio test  
p_value <- (0.5 * pchisq(LRT, df = 1, lower.tail = FALSE)) + (0.5 * pchisq(LRT,  
df = 2, lower.tail = FALSE))  
p_value  
The result is: 5.565676e-12 3.428111e-06  
## (d) Which model would you choose (reference or nested) to continue your analysis? Explain.  
I would choose the reference model to continue my analysis. The small P value suggests the the models are significantly different. However, this does not mean that the nested model will fit best. The lower AIC and BIC values for model 1, the reference model, suggest that the reference model will be a better fit for this data set.  

# Task 5: Fixed effect estimates for your final linear mixed model
## A Use the R computer package to produce a table that lists the estimates of the fixed effects in model (3), together with their corresponding standard errors, degrees of freedom, observed test statistics and p-values. Present this table below.  
R codes:  
sum_model1<-coef(summary(Model1))  
Table_2 <- xtable(sum_model1, align = "cccccc", digits = c(0,3,3,0,3,3), label =  
’Table 2’, caption = ’Estimate of fixed effects in model 1’)  
print(Table_2, include.rownames = TRUE, caption.placement = "top", file = "Table1.tex",  
append = TRUE)  
![image](https://github.com/user-attachments/assets/70b3e9e4-9dac-4d9e-a1ca-bb6b65f2a69f)

## B Interpret the estimates of β0, β2 and β6.  
The estimate of β0 is 16.836. We estimate that the mean E for patients who are administered the placebo patch with average pre-treatment postnatal depression score 1 month after the treatment is 16.836 and is significantly different from 0 (95%CI, p-value = 0).  
The estimate of β2 is -4.379. Patients with average pre-treatment postnatal When measured 1 month after the treatment, we estimate that the difference in mean E between patients administered the Estrogen patch and patients administered the placebo patch is -4.379.The difference is significant (95%CI,
p-value < 0.05).

The estimate of β6 is 0.029. We estimate that the change in the difference in E between treatments at 2 months after treatment compared to 1 month after treatment is 0.029. We estimate that the change in the difference in E between treatments at 3 months after treatment compared to 2 month after
treatment is 0.029. We estimate that the change in the difference in E between treatments at 4 months after treatment compared to 3 month after treatment is 0.029. We estimate that the change in the difference in E between treatments at 5 months after treatment compared to 4 month after treatment
is 0.029. We estimate that the change in the difference in E between treatments at 6 months after treatment compared to 5 month after treatment is 0.029. In order words, the difference in the rate of change over time M between treatments is 0.029. This change is insignificant (95%CI, p-value > 0.05
and p-value is very large at 0.924).  

