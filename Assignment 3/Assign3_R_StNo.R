### Add packages you use in Assignment 3

library("plyr")
library("tidyverse")
library("nlme")
library("car")
library("hexbin")
library("xtable")
library("knitr")
library("lmerTest")
library("multcomp")

##############################################################################################################################################################

#### 2. Diagnostics of model 1 

## Importing the Cognitive data file from my computer.

Cognitive <- read.csv(file = 'Cognitive.csv', header = TRUE)

#Create E variable

Cognitive <- Cognitive %>% mutate(E = if_else(E2==0&E3==0, E <- "H", 
                                              if_else(E2==1&E3==0,E<-"U",E<-"P")))

Cognitive <- mutate(Cognitive, E2.f = factor(E2), E3.f = factor(E3), C.f = factor(C), W.f = factor(W), Subject.f=factor(Subject), E.f = factor(E))
view(Cognitive)

#Fit Model 1 using REML

Model1 <- lme(T~E2.f+E3.f+C.f+W.f+ E2.f:C.f + E2.f:W.f + E3.f:C.f + E3.f:W.f + C.f:W.f + E2.f:C.f:W.f + E3.f:C.f:W.f, random = ~ 1+ C.f + W.f | Subject.f, weights = varIdent(form= ~1|C.f),
              method = "REML", data = Cognitive)

#Generate predicted marginal values of T
Cognitive <- mutate(Cognitive, Marg_T_hat = fitted(Model1,level = 0)[-97])
view(Cognitive)

# Figure 1: Plot of the predicted marginal values of T and the observed mean values of T 
# as a function of C grouped by W, paneled by E

Table_A <- ddply(Cognitive, c("C", "W.f","E.f"), summarise, T_Mean = mean(T))
Table_A <- mutate(Table_A, C.f = factor(C))

ggplot(data = Cognitive, aes(x = C.f, y = Marg_T_hat)) +
  geom_point(aes(colour = W.f), size=8, shape = 22) +
  geom_point(data = Table_A, aes(C.f, T_Mean, colour = W.f), size = 4, shape = 15) +
  scale_colour_manual(values=c("red","blue")) +
  scale_y_continuous (name="T Mean", limits = c(140,240)) +
  facet_grid(E.f ~.)  +
  labs(x="C")


######################################################################################################################################################

#### 3. Fixed effect estimates of model 1

sum_model1<-round(coef(summary(Model1)),2)

Table_1 <- xtable(sum_model1, align = "cccccc", digits = c(2,2,2,2,2,2), label = 'Table 1', caption = 'Estimate of fixed effects in model 1')
print(Table_1, include.rownames = TRUE, caption.placement = "top", file = "Table1.tex", append = TRUE)

###################################################################################################################################################################################

#### 4. Testing for fixed effects

C <- matrix(c(0, -1, 1, 1, 0, 0, -1, 1, 1, 1, 0, 1), 1)
v <- glht(Model1, linfct = C)
summary(v)

#Fit Model 1 using ML based likelihood

ctrl <- lmeControl(opt = 'optim')

Model1 <- lme(T~E2.f+E3.f+C.f+W.f+ E2.f:C.f + E2.f:W.f + E3.f:C.f + E3.f:W.f + C.f:W.f + E2.f:C.f:W.f + E3.f:C.f:W.f, random = ~ 1+ C.f + W.f | Subject.f, weights = varIdent(form= ~1|C.f),
              method = "ML", control = ctrl, data = Cognitive)

Model2 <- lme(T~E2.f+E3.f+C.f+W.f+ E2.f:C.f + E2.f:W.f + E3.f:C.f + E3.f:W.f + C.f:W.f, random = ~ 1+ C.f + W.f | Subject.f, weights = varIdent(form= ~1|C.f),
              method = "ML", control = ctrl, data = Cognitive)

anova(Model1, Model2)
