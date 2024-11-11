# Description:
The data presented is stored in the file named Veneer.csv. A study was conducted on the teeth of 25 adults to examine gingival (gum) health. The variables of interest for Assignment 2 are:
• Adult: This is a factor variable that identifies the adult in the study.  
• A: This is a continuous variable that measures the age of the adult less the mean age (where the mean age is equal to the mean age of the adults in the sample).  
• W: This is a continuous variable that measures the weight of the adult less the mean weight (where the mean weight is equal to the mean weight of the adults in the sample).  
• G: This is a factor variable that identifies the gender of the adult (0 = female, 1 = male).  
• C: This is the response variable. It’s a continuous variable that measures the gingival crevicular fluidof a tooth.  

# Describing the model
 The researchers in the study set up the following linear mixed model to analyze their research questions.  
Cij = β0 + β1 Aj + β2Wj + β3 Gj + β4 Aj ×Wj + β5 Aj × Gj + β6Wj × Gj + β7 Aj ×Wj × Gj  
+ μ0j + εij , (1)  
• where Cij is the gingival crevicular fluid of tooth i (i = 1, 2, 3, 4) belonging to adult j (j = 1, 2, . . . , 25),  
• Aj is the age of adult j less the mean age,  
• Wj is the weight of adult j less the mean weight,  
• Gj = 1 if the gender of adult j is male, and Gj = 0 if the gender of adult j is female,  
• β0 is the fixed intercept,  
• β1, β2 and β3 are the fixed simple effects of A, W and G respectively,  
• β4, β5 and β6 are the fixed two-way interaction effects of A ×W, A × G and W × G respectively,  
• β7 is the fixed three-way interaction effect of A ×W × G,  
• μ0j is the random intercept specific to adult j,  
• εij is the random error associated with measuring C for tooth i, belonging to adult j.  
• For model (1), the researchers choose an unstructured structure for the variance-covariance matrix of the random effect vector, μj . That is, the variance-covariance matrix of the random effect vector, μj , is
![image](https://github.com/user-attachments/assets/f3062f3a-1b09-4971-bf71-551f515a3b06)

# Task 1:
The researchers would like to express model (1) in matrix form, Yj = Xj β + Zj μj + εj , where Yj represents the response vector for adult j, Xj represents a matrix, for adult j, that contains the values of the predictors associated with the fixed effects of model (1), β is the fixed effect vector, Zj is a matrix,
for adult j, that contains the values of the predictors associated with the random effects of model (1), μj is the random effect vector for adult j and εj is the random error vector for adult j.
## a Write down the observed response vector, Yj , of model (1), for adult j = 5 (the 5th adult in the data set).
![image](https://github.com/user-attachments/assets/216a4eb9-bce9-4ce3-a031-ef83e4a14645)
## b Write down the observed matrix, Xj , of model (1), for adult j = 15 (the 15th adult in the data set).  
![image](https://github.com/user-attachments/assets/f7342d3b-cf3f-4345-9f69-9b04b8994df5)
## c Write down the fixed effect vector, β, of model (1).  
![image](https://github.com/user-attachments/assets/e232ea3e-0531-4348-a41c-0249bd86fb76)
## d Write down the matrix, Zj ,of model (1), for adult j.
![image](https://github.com/user-attachments/assets/718d3b47-22d3-45d0-ad4b-f5ed4775bbef)
## e Write down the random effect vector, μj , of model (1), for adult j.  
![image](https://github.com/user-attachments/assets/4302233a-b6a7-4a0c-9fee-c03ce927c98a)
Write down the random error vector, εj , of model (1), for adult j.  
![image](https://github.com/user-attachments/assets/c7fd784d-6fe2-48ea-b581-2da129a3f35e)
## g For model (1), derive the variance-covariance matrix of the response vector, Yj , for a male adult in this study.  
var(Yj) = Z * D * Z⊺ + R

![image](https://github.com/user-attachments/assets/80a80496-d78e-4eac-b734-59c70ee3d97b)
## f Interpret the fixed effects β0, β1 and β6.
β0 is the estimate of the mean gingival crevicular fluid of a tooth for a female of average age and average weight.  
β1 is the estimate of changes in the mean gingival crevicular fluid of a tooth for a female of average weight as the age increases.  
When the age of an adult is held fixed, β6 is the estimate of the difference in the change in mean gingival crevicular fluid of a tooth between a male and female as the weight increases.  

# Task 2: Variance-covariance estimates of the final linear mixed model  
As their final linear mixed model the researchers choose model (1) which has variance-covariance matrices, D and Rj , defined in section 1.

## Use the R computer package to calculate the estimate of the D matrix of the final linear mixed model.
The estimate of the D matrix is 170.37  
## b Use the R computer package to calculate the estimate of the variance-covariance matrix of the response vector of the final linear mixed model, for a male adult.  
Table 1: The estimate of the variance-covariance matrix of the response vector of the final linear mixed model, for a male adult  
![image](https://github.com/user-attachments/assets/463b3c58-816d-4c39-9ae6-7fcc2fa09ae1)  
## c Use your solutions for questions 1(g), 3 and 4 to calculate the estimates of τ and ρ, respectively.  
![image](https://github.com/user-attachments/assets/0a1aec49-bd92-4ce6-b32c-2e4055d583de)

# Task 3: Estimates and residuals of the final linear mixed model  
## Use the R computer package to produce a table that lists the estimates of the fixed effects in the final linear mixed model, together with their corresponding standard errors, degrees of freedom, observed test statistics and p-values.  
![image](https://github.com/user-attachments/assets/08def1d5-7f92-41d6-a06f-46c0daa565bb)

## Figure 1 presents the random effect predictions of the final linear mixed model, for the first 5 adults in the study. These predictions were obtained by using the ranef() command in R.
![image](https://github.com/user-attachments/assets/2cc71bfc-404d-45cd-8e2a-ae3ec76f1672)  
## Calculate by hand the conditional residual for tooth i = 3 belonging to adult j = 4.
ϵ3,4 = C3,4 - E(C3,4|μ0,4)  
We can use the estimate of fixed effects in table 2 and the values of adult 4 and tooth 3 in the veneer data to substitute them in model 1 (without random error) to obtain the predicted conditional value of C3,4.  
ϵ3,4 = C3,4 - (β0 + β1 A4 + β2W4 + β3 G4 + β4 A4 ×W4 + β5 A4 × G4 + β6W4 × G4 + β7 A4 ×W4 × G4)  
ϵ3,4 = 17 - (26.27 + 0.69 * -11.48 + 0.35 * -2.56 + 0.02 * -11.48 * -2.56) = 17 - 18.04 = -1.04  
