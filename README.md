
Learning Objectives:
1.	Learn how to manage and preprocess datasets  and how to compute basic statistics and to create basic data visualizations (using R)
2.	Learn how to interpret popular displays, such as histograms, scatter plots, box plots, density plots,…
3.	Get some practical experience in exploratory data analysis
4.	Learn how to create background knowledge for a dataset 
5.	Learn how to deal with nominal attributes in conjuction with methods that learn numerical models
6.	Learn to distinguish expected from unexpected results in data analysis and data mining—in general, this task is quite challenging, as it requires background knowledge with respect to the employed data mining technique, domain knowledge, and also practical experience.



Assignment Tasks:

Apply the following exploratory data analysis techniques using R to the dataset:
0.	Compute the mean value and standard deviation for attributes G1, G2, G3.   Remove 0’s that do not make sense prior to computing these statistics.  1 point
1.	Compute the covariance matrix for attributes G1, G2, and G3 next, compute the correlations for each of the 3 pairs of the 4attributes. Interpret the statistical findings! Remove 0’s that do not make sense prior to computing the covariance matrix and correlations.   6  points
2.	Create a scatter plot for attributes G1 and G3 of your dataset and a second scatter plot for attributes G1 and G2. Interpret the two scatter plots! 6 points
3.	Create histograms for attributes Mjob. Fedu, studytime, failures, and goout. Then create the same histograms for the 5 attributes for students with G3>12 and for students with G312; interpret the obtained 15 histograms. 9 points 
4.	Create box plots for the attributes absences. G1, G2, G3. Remove null values that do not make sense prior to computing the box plots.  Interpret and compare the obtained 4 boxplots!  6 points 
5.	Create scatter plots with the dependent variable G3 and the attributes studytime, failures, gooout, and absences. Interpret the obtained 4 plots for the 4 pairs of attributes—G3 and each of the four attributes . 4 points
6.	Create 2-D Histograms for Fedu and Mjob, for gout and failures and for studytime and G3 and study time. Interpret the obtained displays  6 points
7.	Fit a linear model that predicts the dependent variable G3 using the 7 numerical attributes as independent variables, and transform the two nominal attribute Mjob and reason into 9 binary attributes  which are also considered to be independent variables. That is you have 16 independent variables total to prediction G3. Next, z-score the obtained dataset, and fit a linear model to the z-scored dataset.  Report the R2 of the obtained linear model and the coefficients of each attribute in the obtained regression function.  Next, drop G2 and 5 more attributes, whose coefficients are the closest to 0, and obtain a linear model using the ten remaining attributes as independent variables. Next, interpret the results! What do the coefficients tell you about the importance of the attribute for final grade prediction? What about negative and positive coefficients? Also compare the two regression functions and their degree of fit they accomplished. 15 points 
8.	Add a column Grade to the RSP dataset (A; G3>15, B: G3=14or15, C: G3=12or13, D: G3=10or11, F: G3<10). Next. create 3 different decision tree models that predicts the Grade attribute and has 20 or less nodes  using the modified RSV dataset with attributes G2 and G3 excluded from training sets (total number of nodes should be less than 21 do not submit models with more than 20 nodes!); Explain how the 3 decision tree models were obtained. Report the training accuracy and the testing accuracy for each decision tree; interpret the learnt decision tree—what do they tell you about the importance of the 8 attributes in the used dataset for the classification problem? 14 points
9.	Write a conclusion (at most 18 sentences!) summarizing the most important findings of the assignment—what did we learn about the dataset? In particular, address the findings obtained related to predicting the variable G3.  6 points  (and up to 4 extra points) 
