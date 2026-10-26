# Ensure numeric
data <- read.csv("~/Desktop/BUSINESS ANALYTICS/Demand Attributes Survey (With Experiment)_November 25, 2025_19.23 (1).csv", header=FALSE, comment.char="#")
data<-data[-c(1),]
View(data)
data$age <- as.numeric(data$Q13)
nrow(data)#176
data <- na.omit(data)
data$age <- as.numeric(data$Q13)
data <- data[data$Q27_3 == 6, ]
nrow(data) #170
mean(data$age)
data$age_bin<- ifelse(data$age == 2, 1,0)
mean(data$age_bin) #90% of individuals are from 18 to 24 years old 

mean(as.numeric(data$treat))
data$country<-as.numeric(data$country)
data$country_bin <-ifelse(data$country == 1, 1,0)
mean(data$country_bin) #80% of respondents are italians
data$Q14<-as.numeric(data$Q14)
#q11 monthly budget for leiusre activities (1-4)
data$Q11<-as.numeric(data$Q11)
hist(as.numeric((Q11)), main =) #la maggior parte per leisure activities ha budget compreso tra 50-150 euro

#q16 How often do you book in-person activities or 
#restaurant tables online (through an app or website, not by calling)? (1-5)
table(as.numeric(Q16)) #majority of people make book in person activity more than once in a month



#q20 I prefer making reservations online rather tan by my phone (1-7)
table(Q20) #majority strongly agree
hist(as.numeric(Q20), main = "Reservations online (1-7)")

#q23 I usually allow notifications from booking or 
#deal apps if they seem useful. (1-7) 
table(Q23) #majority disagree
hist(as.numeric(Q23), main = " Notifications on  (1-7)")





#LAST MINUTE FLEXIBILITY ANALYSIS
data$Q27_1 <- as.numeric(data$Q27_1)
data$Q27_2 <- as.numeric(data$Q27_2)
data$Q27_4 <- as.numeric(data$Q27_4)

# Create Last-Minute Flexibility score (mean of 3 items)
data$LFM_score <- rowMeans(data[, c("Q27_1", "Q27_2", "Q27_4")], na.rm = TRUE)

threshold <- 5

data$LFM_high <- ifelse(data$LFM_score >= threshold, 1, 0)

table(data$LFM_high)
mean(data$LFM_high) #0.68

#ATE ANALYSIS
data <- data[(data$treat == 1 & data$Q41 == 1) |(data$treat == 0 & data$Q41 == 2), ]
nrow(data)
data$treat <- factor(data$treat)
data$Q35_new <- (as.numeric(data$Q35) + as.numeric(data$Q34)) / 2

#1sls
summary(model_1)

data$Q_35fit = model_1$fitted.values #“Se SwapSlot riesce a rendere 
#un’opportunità un po’ più attraente, come fa lo sconto, 
#quanto aumenta la sua user acquisition?”

#2sls
model_2 = lm(Q37  ~ Q_35fit + LFM_score+ age+country, data = data)
summary(model_2)

data$Q39 <- ifelse(as.numeric(data$Q39) == 1 ,1,0) #Q39 = "I would sign up to the app if it were free'
model_3 = lm(Q39~ Q_35fit + LFM_score+ age+country, data = data )
summary(model_3)


#glm #guarda altra variabile che dice "I would sign up to the app if it were free' che dovrebbe essere già binaria 
data$Q37_high <- ifelse(data$Q37 >= 5, 1, 0)
length(data$Q37_high)

logit_mod <- glm(Q37_high ~ Q35_fit + LFM_score+age+country, data = data, family = binomial(link="logit"))
summary(logit_mod)
pred <-predict(logit_mod)
pred

#Q34 #non credo abbia senso

model_2 <- lm(Q34 ~ treat, data = data) #this feels like a good opportunity
summary(model_2)



#BALANCE TEST
t.test(data$age ~ data$treat, data = data)
t.test(data$country ~ data$treat, data = data)
t.test(data$LFM_score ~ data$treat, data = data)
t.test(data$Q11 ~ data$treat, data = data)
t.test(data$Q14 ~ data$treat, data = data)
