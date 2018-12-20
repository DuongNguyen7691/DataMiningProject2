library(readr)
install.packages("ggplot2")
library(ggplot2)


theme_update(plot.title = element_text(hjust = 0.5))
student_por <- read_delim("Desktop/UH/Fall2018/4335- Data Mining/Project1/Nguyen_1646288_HW1/student-por.csv", 
                          ";", escape_double = FALSE, trim_ws = TRUE)

rsp = data.frame("Fedu" = student_por$Fedu,
                 "Mjob" = student_por$Mjob,
                 "Reason" = student_por$reason,
                 "Studytime" = student_por$studytime,
                 "Failures" = student_por$failures,
                 "Goout" = student_por$goout,
                 "Absences" = student_por$absences,
                 "G1" = student_por$G1,
                 "G2" = student_por$G2,
                 "G3" = student_por$G3)

grades = data.frame(G1 = student_por$G1, G2 = student_por$G2, G3 = student_por$G3, Absences = student_por$absences)

#drop all rows where G3 has value of 0's and G1 and G2 are not
adj_grades = subset.data.frame(grades, subset = !(G3==0 & G2 != 0 & G1 !=0))

#QUESTION 0:
#Calculate means and sd of G1, G2, G3 
means = apply(adj_grades, 2, mean) #means
sds = apply(adj_grades, 2, sd) #standard deviations

#Display means and sds
means
sds

#QUESTION 1:
#Covariance and correlation mattrices
cov_mat = cov(adj_grades) #covariance mattrix
cor_mat = cor(adj_grades) #correlation mattrix
#display cov_mat and cor_mat
cov_mat
cor_mat

#QUESTION 2:
#Scatter plots of Q1 vs Q2 and Q1 vs Q3
plot(jitter(student_por$G1), jitter(student_por$G2), col = "red", 
     xlab = "Grade 1", ylab = "Grade 2", main = "Scatter Plot for attributes G1 vs G2")
plot(jitter(student_por$G1), jitter(student_por$G3), col = "blue", 
     xlab = "Grade 1", ylab = "Grade 3", main = "Scatter Plot for attributes G1 vs G3")



# QUESTION 3:
#Create a generic function that will take care of 3 same type of 
#creating histogram with different conditions


hist_for_mjob <- function (grades){
  
  #Histogram for Mother's job
  p_mjob = ggplot(data = grades, aes(Mjob))
  hist_mjob = p_mjob + geom_histogram(bins = 5, color = "red", fill = "lightblue") 
  hist_mjob + ggtitle("Histogram for Mother's job") + scale_x_discrete(limits = 1:5, labels = c("At home","Health",
                                                                                                "Other", 
                                                                                                "Services",
                                                                                                "Teacher")) + xlab("Mother's Job")
  
}#end hist_for_mjob


hist_for_fedu <- function (grades){
  
  #Histogram for Father's Education
  f_edu = ggplot(data = grades, aes(Fedu))
  hist_fedu = f_edu + geom_histogram(bins = 5, color = "red", fill = "lightblue")
  hist_fedu + ggtitle("Histogram for Father's Education") + scale_x_discrete(limits = 0:4, labels = c("None",
                                                                                                      "Primary Education",
                                                                                                      "5th to 9th grade",
                                                                                                      "Secondary Education",
                                                                                                      "Higher Education"))
  
}#end hist_for_fedu


hist_for_studytime <- function(grades){
  
  #Histogram for Studytime
  p_studytime = ggplot(data = grades, aes(StudyTime))
  hist_studytime = p_studytime + geom_histogram(bins = 4, color = "red", fill = "lightblue")
  hist_studytime + ggtitle("Histogram for Study Time") + scale_x_discrete(limits = 1:4, labels = c("<2 hours",
                                                                                                   "2-5 hours",
                                                                                                   "5-10 hours",
                                                                                                   ">10 hours")) + xlab("Hours per week")
  
}# end hist_for_studytime



hist_for_failures <- function (grades){
  #Histogram for Failures
  p_failures= ggplot (data = grades, aes(Failures))
  hist_failures = p_failures + geom_histogram(bins = 4, color = "red", fill = "lightblue") 
  hist_failures + ggtitle("Histogram for Failures") + xlab("Number of past class failures")
  
}#end hist_for_failures


hist_for_goout <- function(grades){
  
  #Histogram for Go out
  p_goout = ggplot(data = grades, aes(Goout))
  hist_goout = p_goout + geom_histogram(bins = 5, color = "red", fill = "lightblue")
  hist_goout + ggtitle ("Histogram for Go out") + scale_x_discrete(limits = 1:5, labels = c("Rarely", 
                                                                                            "Sometimes", 
                                                                                            "Often", 
                                                                                            "Usually", 
                                                                                            "Always")) + xlab("Go out (on scale from 1-5 : Rarely to Always)")
  
}#end hist_for_goout


#Histograms for attributes Mjob, Fedu, studytime, failures and goout
grades["Mjob"] = student_por$Mjob
grades["Fedu"] = as.numeric(student_por$Fedu)
grades["StudyTime"] = as.numeric(student_por$studytime)
grades["Failures"]  = as.numeric(student_por$failures)
grades["Goout"]     = as.numeric(student_por$goout)

#Assign numeric values for Mjob: 1 = at_home, 2 = health, 3 = other, 4 = service, 5 = teacher
#vals = c(1,2,3,4,5)
for (i in 1: length(grades$Mjob)){
  if (grades$Mjob[i] == "at_home")
    grades$Mjob[i] = 1
  else if (grades$Mjob[i] == "health")
    grades$Mjob[i] = 2
  else if (grades$Mjob[i] == "other")
    grades$Mjob[i] = 3
  else if (grades$Mjob[i] == "services")
    grades$Mjob[i] = 4
  else 
    grades$Mjob[i] = 5
}# end for

grades$Mjob = (as.numeric(grades$Mjob))


#Histograms for mjob, fedu, failures, goout, studytime with all data
hist_for_mjob(grades)
hist_for_fedu(grades)
hist_for_failures(grades)
hist_for_goout(grades)
hist_for_studytime(grades)

#Histograms for data that G3 > 12
grades_above_12 = subset.data.frame(grades, subset = G3>12)
hist_for_mjob(grades_above_12)
hist_for_fedu(grades_above_12)
hist_for_failures(grades_above_12)
hist_for_goout(grades_above_12)
hist_for_studytime(grades_above_12)


#Histograms for data that G3 <= 12
grades_below_12 = subset.data.frame(grades, subset = G3 <= 12)
hist_for_mjob(grades_below_12)
hist_for_fedu(grades_below_12)
hist_for_failures(grades_below_12)
hist_for_goout(grades_below_12)
hist_for_studytime(grades_below_12)


#QUESTION 4: Box plots for absences, G1, G2 and G3
boxplot(jitter(adj_grades$G1), jitter(adj_grades$G2), jitter(adj_grades$G3), jitter(adj_grades$Absences), 
        main = "Box plots of Grade 1, Grade 2, Grade 3, Absences", 
        names = c("Grade 1", "Grade 2", "Grade 3", "Absences"), 
        col = c("red", "black", "yellow", "orange"), border = "brown", horizontal = FALSE)



#QUESTION 5: Scatter plots between G3 and studytime, failures, goout absenses
#jitter () to make overlapping points visible
#par(mfrow = c(2,2))
plot(jitter(student_por$studytime), jitter(student_por$G3), col = "red",  
     xlab = "Study time", ylab = "Grade 3", main = "Scatter Plot for attributes Study time and Grade 3")
plot(jitter(student_por$failures), jitter(student_por$G3), col = "blue", 
     xlab = "Failures", ylab = "Grade 3", main = "Scatter Plot for attributes Failures and Grade 3")
plot(jitter(student_por$goout), jitter(student_por$G3), col = "green", 
     xlab = "Go out", ylab = "Grade 3", main = "Scatter Plot for attributes Go out and Grade 3")
plot(jitter(student_por$absences), jitter(student_por$G3), col = "black", 
     xlab = "Absences", ylab = "Grade 3", main = "Scatter Plot for attributes Absences and Grade 3")

#QUESTION 6: 2D Histograms
#Fedu vs. Mjob
theme_update(plot.title = element_text(hjust = 0.5))

p1 = ggplot(grades, aes(Mjob, Fedu))
fedu_mjob = p1 + stat_bin2d()  
fedu_mjob = fedu_mjob + scale_fill_gradientn(breaks = seq(0,150,10),colours = rainbow(7)) + ggtitle ("2D Diagram of Mother's Job and Father's Education"  ) + xlab("Mother's Job") + ylab("Father's Education")
fedu_mjob = fedu_mjob + theme_dark() 
fedu_mjob = fedu_mjob + scale_x_continuous(labels =  c("At home", "Health", "Other", "Services", "Teacher")) + scale_y_continuous(labels = c("None", "Primary School", "5th to 9th Grade", "Secondary Education", "Higher Education"))
fedu_mjob 

#goout vs. failures
p2 = ggplot(data = grades, aes(Goout, Failures))
goout_failures = p2 + stat_bin2d()
goout_failures = goout_failures + scale_fill_gradientn(breaks = seq(0,200,15), colours = rainbow(7))
goout_failures = goout_failures + ggtitle ("2D Diagram for GoOut and Failures") + theme_dark()
goout_failures= goout_failures + scale_x_continuous(labels = c("Rarely", "Sometimes", "Often", "Usually", "Always"))

goout_failures #display the plot

#studytime and g3
p3 = ggplot(data = grades, aes(StudyTime, G3))
studytime_g3 = p3 + stat_bin2d() 
studytime_g3 = studytime_g3 + scale_fill_gradientn(breaks = seq(0,60,5), colours = rainbow(7)) + xlab("Study time per week") + ylab("Grade 3")
studytime_g3 = studytime_g3 + ggtitle("2D Diagram for Study Time and Grade 3") + theme_dark()
studytime_g3 = studytime_g3 + scale_x_continuous(labels = c("<2 hours", "2-5 hours", "5-10 hours", ">10 hours"))
studytime_g3


#QUESTION 7: FIT LINEAR MODEL
#Create dataframe with 10 attributes
grades = data.frame("Fedu" = student_por$Fedu,
                    "Mjob" = student_por$Mjob,
                    "Reason" = student_por$reason,
                    "Studytime" = student_por$studytime,
                    "Failures" = student_por$failures,
                    "Goout" = student_por$goout,
                    "Absences" = student_por$absences,
                    "G1" = student_por$G1,
                    "G2" = student_por$G2,
                    "G3" = student_por$G3)
#create new columns for Mother's jobs
grades$Mjob_at_home = rep(0)
grades$Mjob_health = rep(0)
grades$Mjob_other = rep(0)
grades$Mjob_services = rep(0)
grades$Mjob_teacher = rep(0)

#Assign binary values to the columns
for (i in 1:649){
  if(grades$Mjob[i] == "at_home")
    grades$Mjob_at_home[i] = 1
  else if(grades$Mjob[i] == "health")
    grades$Mjob_health[i] = 1
  else if(grades$Mjob[i] == "other")
    grades$Mjob_other[i] = 1
  else if(grades$Mjob[i] == "services")
    grades$Mjob_services[i] = 1
  else
    grades$Mjob_teacher[i] = 1
}

grades$Reason_course = rep(0)
grades$Reason_home = rep(0)
grades$Reason_other = rep(0)
grades$Reason_reputation = rep(0)

for(i in 1:649){
  if(grades$Reason[i] == "course")
    grades$Reason_course[i] = 1
  else if(grades$Reason[i] == "home")
    grades$Reason_home[i] = 1
  else if(grades$Reason[i] == "other")
    grades$Reason_other[i] = 1
  else
    grades$Reason_reputation[i] = 1
}


#the linear model
#drop columns Mjob and Reason
grades = grades[,-c(2,3)]

linear_model = lm(grades$G3~., grades)
linear_model

#check for collinearity
#drop Mjob_teacher and Reason_reputation
grades_test = grades[, -c(12,16)]
lm(grades$G3~., grades_test)

#scale/normalize the dataset grades

normalized_grades = data.frame(scale(grades))
normalized_linear_model = lm(normalized_grades$G3 ~ ., normalized_grades)
normalized_linear_model

#obtain r square
summary(normalized_linear_model)$r.square

#drop G2
normalized_grades = normalized_grades[,-7]
#drop 5 more attributes that have coefficients closest to 0

#> sort(abs (normalized_linear_model$coefficients))
#(Intercept)  Mjob_at_home Mjob_services          Fedu   Reason_home   Mjob_health         Goout 
#2.623166e-17  2.010168e-03  5.874092e-03  7.555229e-03  9.444842e-03  1.043489e-02  1.510608e-02 
#Mjob_other     Studytime Reason_course  Reason_other      Absences      Failures            G1 
#2.068736e-02  2.344172e-02  2.471678e-02  3.296376e-02  3.447525e-02  4.560549e-02  1.181666e-01 
#G2 
#7.957597e-01 
#So we're dropping Mjob_at_home, Mjob_services, Fedu, Reason_home, Mjob_health

normalized_grades[, c("Mjob_at_home", "Mjob_services", "Fedu", "Reason_home", "Mjob_health")] = NULL
#another linear model after dropping insignificant attributes
lm(normalized_grades$G3 ~ ., normalized_grades)
summary(lm(normalized_grades$G3 ~ ., normalized_grades))$r.square


#QUESTION 8
#Create a new column Grade to rsp
rsp$Grade = rep("")

#Assigning letter grades
for(i in 1:649){
  if(rsp$G3[i] > 15)
    rsp$Grade[i] = "A"
  else if (rsp$G3[i] >= 14)
    rsp$Grade[i] = "B"
  else if(rsp$G3[i] >= 12)
    rsp$Grade[i] = "C"
  else if(rsp$G3[i] >= 10)
    rsp$Grade[i] = "D"
  else 
    rsp$Grade[i] = "F"
  
}



#First model using party library
install.packages("party")
library(party)

#Not supporting character, change those columns into factor
rsp$Mjob = as.factor(rsp$Mjob)
rsp$Reason = as.factor(rsp$Reason)
rsp$Grade = as.factor(rsp$Grade)

#drop G2 and G3
rsp[, c(9,10)] = NULL

#Split test data and train data
set.seed(101)# to have preducible results
trainIndex = sample(1:nrow(rsp), size = 0.75*nrow(rsp))
train_data = rsp[trainIndex,]
test_data = rsp[-trainIndex,]

g3_ctree = ctree(Grade ~. , data = train_data)
plot(g3_tree)

predict_ctree = predict(g3_ctree, newdata = train_data)
accuracy_train_1 = mean(train_data$Grade == predict_ctree)
accuracy_train_1 # accuracy rate when apply on train data


predict_ctree_test_data = predict(g3_ctree, newdata = test_data)
accuracy_test_1 = mean(predict_ctree_test_data == test_data$Grade)
accuracy_test_1


#Model 2 using rpart library
install.packages("rpart")
library(rpart)
install.packages("rpart.plot")
library(rpart.plot)

rtree = rpart(Grade ~., data = train_data, method = "class")
rpart.plot(rtree) #display the tree

#For train_data
predict_rpart_train_data = predict(rtree, newdata = train_data, type = "class")
accuracy_train_2 = mean(train_data$Grade == predict_rpart_train_data)
cat("Accuracy rate for rpart for train data = ", accuracy_train_2)

#For test_data
predict_rpart_test_data = predict(rtree, newdata = test_data, type = "class")
accuracy_test_2 = mean(test_data$Grade == predict_rpart_test_data)
cat("Accuracy rate for rpart for test data = ", accuracy_test_2)

#3rd model Using tree library
install.packages("tree")
library(tree)
tree_tree = tree(Grade~., data = train_data)
plot(tree_tree)
text(tree_tree, pretty = 3)
title("Decision tree using tree library")
predict_train_3 = predict(tree_tree, newdata = train_data, type = "class")
cat("Accuracy rate for train data using tree library = ", mean(predict_train_3 == train_data$Grade))
predict_test_3 = predict(tree_tree, newdata = test_data, type = "class")
cat("Accuracy rate for test data using tree library = ", mean(predict_test_3 == test_data$Grade))
    
    