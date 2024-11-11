### Add packages you use in Assignment 2

library("plyr")
library("tidyverse")
library("nlme")
library("car")
library("hexbin")
library("xtable")
library("knitr")
library("lmerTest")
############################################################################################################################################################

## Importing the Veneer data file from my computer.

Veneer <- read.csv(file = 'Veneer.csv', header = TRUE)
View(Veneer)

Veneer <- mutate(Veneer, Adult.f = factor(Adult), G.f = factor(G))
View(Veneer)



#### 2. Variance-covariance estimates of the final linear mixed model

Model1 <- lme(C ~ A + W + G.f + A : W + A : G.f + W : G.f + A : W : G, random = ~ 1 | Adult.f, method = "REML",  correlation = corCompSymm(), weights = varIdent(form = ~ 1 | G.f), data = Veneer)

D_hat <- getVarCov(Model1)[-3,] # Gives the D matrix
round(D_hat,2)

VarY_hat12 <- getVarCov(Model1, individual = 12, type = "marginal")[[1]] #Variance Covariance of the response vector
round(VarY_hat12,2)

######################################################################################################################################################

#### 3. Estimates and residuals of the final linear mixed model

sum_model1<-round(coef(summary(Model1)),2)

Table_2 <- xtable(sum_model1, align = "cccccc", digits = c(2,2,2,2,2,2), label = 'Table 2', caption = 'Estimate of fixed effects in model 1')
print(Table_2, include.rownames = TRUE, caption.placement = "top", file = "Table1.tex", append = TRUE)
