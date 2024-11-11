# Decription:
The data in this assignment is stored in the file named Cognitive.csv.  
Twenty-four subjects were selected at
random and were categorised according to their education level (high school, undergraduate, postgraduate).
The subjects read two types of words (form and colour) under two cue conditions (normal and congruent)
and the order in which the four reading tasks were carried out was randomised. The time in milliseconds for
completing each reading task was recorded, on each subject. The variables of interest are:  

• Subject: This is a factor variable that identifies the subject.  
• E2: This is a factor (categorical) variable that identifies whether or not the highest level of education completed for the subject is an undergraduate degree. It has 2 levels (0 = No, 1 = Yes).  
• E3: This is a factor (categorical) variable that identifies whether or not the highest level of education completed for the subject is a postgraduate degree. It has 2 levels (0 = No, 1 = Yes).  
• Note if the subject has no undergraduate or postgraduate degree then their highest level of education completed is high school.  
• T: Measures the time in milliseconds to complete a reading task.  
• C: This is a fixed factor that identifies the type of cue condition used in the reading task. It has two levels (0 = Normal, 1 = Congruent).  
• W: This is a fixed factor that identifies the type of word used in the reading task. It has two levels (0 = Form, 1 = Colour).  

# Describing the model:
![image](https://github.com/user-attachments/assets/2807ac2f-a89c-4399-93e3-0758c424027d)  
![image](https://github.com/user-attachments/assets/ea35bc6b-7ded-47a4-aeb7-558255f227d3)

# Task 1  
The researchers would like to express model (3) in matrix form, Yi = Xi β + Zi μi + εi, where Yi
represents the response vector for subject i, Xi represents a matrix, for subject i, that contains the
values of the predictors associated with the fixed effects of model (3), β is the fixed effect vector, Zi is
a matrix, for subject i, that contains the values of the predictors associated with the random effects of
model (3), μi is the random effect vector for subject i and εi is the random error vector for subject i.
Answer the following questions.  
## a Write down the response vector, Yi, of model (3), for subject i.  

![image](https://github.com/user-attachments/assets/deaeed14-9d70-4baf-842c-31dfec655c27)
## b Write down the matrix, Xi, of model (3), for subject i.  
![image](https://github.com/user-attachments/assets/83a70282-bd33-4da5-afe8-f170afaaa430)
## c Write down the fixed effect vector, β, of model  
![image](https://github.com/user-attachments/assets/b26761cc-5a94-4e4e-909b-1cc1f78dd382)
## d Write down the matrix, Zi, of model (3), for subject i.  
![image](https://github.com/user-attachments/assets/f2edd448-c1fb-40ab-9307-7d5b2f719134)  
## e Write down the random effect vector, μi, of model (3), for subject i.  
![image](https://github.com/user-attachments/assets/c8b5b585-3442-4f0a-aa25-23af65b93ff7)
## f Write down the random error vector, εi, of model (3), for subject i.  
![image](https://github.com/user-attachments/assets/f76c61d2-1f1a-4d40-812e-0814c3770f41)
## Interpret the fixed effects β0, β2 and β9.  
β0 is the estimate of the average time in milliseconds to complete a reading task for a subject whose highest
education is high school, and Normal cue condition with Form type of word used in the reading task.
β2 is the estimate of the difference of average time in milliseconds to complete a reading task for a subject
whose highest education is postgraduate compared to those whose highest education is high school, and
Normal cue condition with Form type of word used in the reading task.
β9 is the estimate of the change in the difference in average time in milliseconds to complete a reading task
for a subject between cue conditions used when changing from Colour type of word to Form type of word in
a reading task.

# Task 2: Diagnostic of model
## Use R to compute an additional factored (categorical) variable, labelled E, and add it to your data frame in R. The variable E is defined as follows:
• The variable E is equal to H if the highest level of education completed for subject i is High school.  
• The variable E is equal to U if the highest level of education completed for subject i is an Undergraduate
degree.  
• The variable E is equal to P if the highest level of education completed for subject i is a Postgraduate
degree.  
## Use the R computer package to produce a figure that plots both the predicted marginal values of T
(that come from fitting model (3) to the data) and the observed mean values of T, as a function of C, grouped by W, and paneled by E. Present this figure below and make sure the scale of the vertical and horizontal axes of your figure is identical to Figure 1 below.  
![image](https://github.com/user-attachments/assets/103bedd7-6fdc-4a40-a6a3-186b90b9231a)

# Task 3: Fixed effect estimates of model
Use the R computer package to produce a table that lists the estimates of the fixed effects of model
(3), together with their corresponding standard errors, degrees of freedom, observed test statistics and
p-values. Present this table below.  
![image](https://github.com/user-attachments/assets/5fe4c87f-6eec-4b00-a22c-cfcfa7059563)
## Let ν = −β1 +β2 +β3 −β6 +β7 +β8 +β9 +β11. Use the R computer package to calculate the estimate
of ν. Write the estimate of ν below and interpret this estimate. Also, use the R computer package to
calculate the p-value for testing the null hypothesis ν = 0 versus the alternative hypothesis ν ̸= 0. Write
this p-value below. Is there sufficient statistical evidence, at the 5% level of significance, to suggest that
ν ̸= 0. Explain.  

The estimate of v is 11.37. We estimate that the change in the difference in mean T is 11.37 between
someone who’s a postgraduate and undertook a reading task with congruent cue condition and colour type of
word versus someone who’s an undergraduate and undertook a reading task with normal cue condition and
colour type of word. P-value of v is 0.393. The P value is larger than 0.05, therefore, there is insufficient
statistical evidence, at the 5% level of significance, to suggest that ν ̸= 0.  

# Task 4: Testing for fixed effects  
The researchers would like to test whether the fixed three-way interaction effects of E2 × C × W and
E3×C ×W should be included in model (3). They decide to test, at the 5% significance level, the null
hypothesis H0 : β10 = β11 = 0 vs the alternative hypothesis H1 : not H0 using the ML-based likelihood
ratio test p-value.  

## Write down the reference model for this test. 
Tti = β0 + β1 E2i + β2 E3i + β3 Cti + β4Wti + β5 E2i × Cti + β6 E2i ×Wti + β7 E3i × Cti + β8 E3i ×Wti + β9 Cti ×Wti + β10 E2i × Cti ×Wti + β11 E3i × Cti ×Wti + μ0i + μ1i Cti + μ2iWti + εti
## Write down the nested model for this test.
Tti = β0 + β1 E2i + β2 E3i + β3 Cti + β4Wti + β5 E2i × Cti + β6 E2i ×Wti + β7 E3i × Cti + β8 E3i ×Wti + β9 Cti ×Wti + μ0i + μ1i Cti + μ2iWti + εti
## Use the R computer package to perform this test. What is the p-value for this test?
The p-value for this test is 0.6297  
## Which model would you choose (reference or nested) to continue your analysis? Explain  
The nested model since 0.6297 > 0.05  
