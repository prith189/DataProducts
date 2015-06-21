---
title       : Predicting Iris Species
subtitle    : 
author      : Prithvi N.
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---


## Synopsis

As part of the DataProducts course on Coursera, a Shiny App was built by me. The app is very simple and it predicts the Iris Species(whether it belongs to Iris setosa, versicolor, virginica) based on inputs which can be measured (like Sepal Length/Width and Petal Length/Width)

We used the Iris dataset to train our prediction algorithm. In order to measure the accuracy of predictions, we used cross validation to split the data set into Training and Testing Sets as seen below.


```r
require (randomForest)
require(caret)
require(datasets)
require(e1071)
data(iris)
iris$Species<-as.factor(iris$Species)
inTrain<-createDataPartition(y=iris$Species,p=0.9,list=FALSE)
training<-iris[inTrain,]
testing<-iris[-inTrain,]
```

---

## Model Fitting

Once the data is split, we will fit a model using the Testing set. Here we will implement a model based on the Generalized Linear Models algorithm.


```r
modfit<-train(Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,model="glm",family="binomial",data=iris)

modfit$finalModel
```

```
## 
## Call:
##  randomForest(x = x, y = y, mtry = param$mtry, model = "glm",      family = "binomial") 
##                Type of random forest: classification
##                      Number of trees: 500
## No. of variables tried at each split: 3
## 
##         OOB estimate of  error rate: 5.33%
## Confusion matrix:
##            setosa versicolor virginica class.error
## setosa         50          0         0        0.00
## versicolor      0         47         3        0.06
## virginica       0          5        45        0.10
```

---

## Verification of Model
We will now check the Accuracy of this modelby applying it on the test set


```r
pred<-predict(modfit,newdata=testing)

confusionMatrix(pred,testing$Species)
```

```
## Confusion Matrix and Statistics
## 
##             Reference
## Prediction   setosa versicolor virginica
##   setosa          5          0         0
##   versicolor      0          5         0
##   virginica       0          0         5
## 
## Overall Statistics
##                                     
##                Accuracy : 1         
##                  95% CI : (0.782, 1)
##     No Information Rate : 0.3333    
##     P-Value [Acc > NIR] : 6.969e-08 
##                                     
##                   Kappa : 1         
##  Mcnemar's Test P-Value : NA        
## 
## Statistics by Class:
## 
##                      Class: setosa Class: versicolor Class: virginica
## Sensitivity                 1.0000            1.0000           1.0000
## Specificity                 1.0000            1.0000           1.0000
## Pos Pred Value              1.0000            1.0000           1.0000
## Neg Pred Value              1.0000            1.0000           1.0000
## Prevalence                  0.3333            0.3333           0.3333
## Detection Rate              0.3333            0.3333           0.3333
## Detection Prevalence        0.3333            0.3333           0.3333
## Balanced Accuracy           1.0000            1.0000           1.0000
```

---
## Conclusion
We can see that the accuracy is very high when the model is tested on the 15 samples of the testing data set, and hence I believe this is a very robust app to predict the species of Iris given their measurements
