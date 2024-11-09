### Add packages you use in Assignment 1
library("plyr")
library("tidyverse")
library("nlme")
library("car")
library("hexbin")
library("xtable")
library("knitr")
library("lmerTest")
############################################################################################################################################################################
postNatal <- read.csv(file = 'Postnatal.csv', header = TRUE)
postNatal <- mutate(postNatal, T.f = factor(T), Patient.f = factor(Patient))
# Table1: Summary for E grouped by M and T
Table_1 <- ddply(postNatal, c("T.f", "M"), summarise, n = length(E), E_mean = mean(E), E_stdev = sd(E))
Table_1
### 1. Graphical analysis 
# Figure 1: mean E vs M for each level of T.

ggplot(data = postNatal, aes(x = M, y = E)) +
  geom_point(aes(colour = T.f)) +
  scale_colour_manual(values=c("red", "blue")) +
  geom_line(data = Table_1, aes(M, E_mean, colour = T.f)) +
  geom_point(data = Table_1, aes(M, E_mean, colour = T.f), size = 4, shape = 15) +
  labs(x = "M") + scale_y_continuous(name="E_Mean", breaks = seq(from = 0, to = 30, by = 5), limits = c(0,30)
  ) + ggtitle("Figure 1: Plot of mean E vs M grouped by T") + theme(plot.title = element_text(hjust = 0.5))
# There is not much difference between the mean difference between T 0 and T 1 as we move from M 0 to M 5

colours = rainbow(61, s=.6, v=.9)[sample(1:61,61)]

fig = ggplot(data = postNatal, aes(x = M, y = E)) +
  geom_point(aes(colour = Patient.f), size = 4) +
  geom_line(aes(colour = Patient.f)) +
  labs(x = "M") + scale_y_continuous (name="E", breaks = seq(from = 0, to = 30, by = 5), limits = c(0,30)) +
  facet_grid(.~ T.f)  + ggtitle("Figure 2: Plot of E vs M for each Patient grouped by T") + theme(plot.title = element_text(hjust = 0.5), legend.position="none") + scale_fill_manual(values=colours)

fig


####################################################################################################################################################################

#### 3. Testing for random effects
#Question 3 c
### The researcher has chosen an unstructured structure for the variance-coviariance matrix of the random effect vector. The variance of u0 and u1 can be difference but the covariance is the same. Hence, a symmetry structure for the correlation (same correlation for all random effect) is chosen for the linear mixed model. 

# Fitting model 1 using REML

Model1 <- lme(E ~ P + T.f + M + P : T.f + P : M + T.f : M, random = ~ M | Patient.f, method = "REML",  correlation = corCompSymm(), weights = varIdent(form = ~ 1 | M), data = postNatal)

Model2 <- lme(E ~ P + T.f + M + P : T.f + P : M + T.f : M, random = ~ 1 | Patient.f, method = "REML", data = postNatal)

likelihood <- anova(Model1, Model2) # Obtain ln(LRR) and ln(LNR)
likelihood
likelihood <- subset(likelihood, select = -c(call, Test))


LRT <- anova(Model1, Model2)$L.Ratio[-1] # Obtain LRT = 2ln(LRR) - 2ln(LNR)
LRT

Table_1 <- xtable(likelihood, align = "cccccccc", label = 'Table 1', caption = 'Likelihood ratio observed test statistic, LRT = 2ln(LRR) - 2ln(LNR)')
print(Table_1, include.rownames = FALSE, caption.placement = "top", file = "Table1.tex", append = TRUE)
Table_1
# Calculating the p-value for the REML based likelihood ratio test

p_value <- (0.5 * pchisq(LRT, df = 1, lower.tail = FALSE)) + (0.5 * pchisq(LRT, df = 2, lower.tail = FALSE))
p_value


##########################################################################################################################################################

#### 4. Fixed effect estimates for your final linear mixed model

sum_model1<-coef(summary(Model1))

Table_2 <- xtable(sum_model1, align = "cccccc", digits = c(0,3,3,0,3,3), label = 'Table 2', caption = 'Estimate of fixed effects in model 1')
print(Table_2, include.rownames = TRUE, caption.placement = "top", file = "Table1.tex", append = TRUE)


