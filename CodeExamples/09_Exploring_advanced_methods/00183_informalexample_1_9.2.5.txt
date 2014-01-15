# informalexample:1_9.2.5 
# informalexample:1 : Exploring advanced methods : Using generalized additive models (GAMs) to learn non-monotone
            relationships : Using GAM for logistic regression 
form <- as.formula("DBWT < 2000 ~ PWGT + WTGAIN + MAGER + UPREVIS")
logmod <- glm(form, data=train, family=binomial(link="logit"))
