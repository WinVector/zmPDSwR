# example:1_9.2.5 
# example:1 : Exploring advanced methods : Using generalized additive models (GAMs) to learn non-monotone
            relationships : Using GAM for logistic regression 
# Title: GLM logistic regression 

form <- as.formula("DBWT < 2000 ~ PWGT + WTGAIN + MAGER + UPREVIS")
logmod <- glm(form, data=train, family=binomial(link="logit"))

