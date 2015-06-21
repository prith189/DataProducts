chdRisk<-function(Sepal.Length,Sepal.Width,Petal.Length,Petal.Width,modfit) {
  
  inp<-data.frame(Sepal.Length,Sepal.Width,Petal.Length,Petal.Width)
  
  pred<-predict(modfit, newdata=inp)
  return(as.character(pred))
}
shinyServer(
  function(input,output){
    require (randomForest)
    require(caret)
    require(datasets)
    require(e1071)
    data(iris)
    iris$Species<-as.factor(iris$Species)
    set.seed(8484)
    modfit<-train(Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,model="glm",family="binomial",data=iris)
    
    output$inputSepalLength <- renderPrint({input$SepalLength})
    output$inputSepalWidth <- renderPrint({input$SepalWidth})
    output$inputPetalLength <- renderPrint({input$PetalLength})
    output$inputPetalWidth <- renderPrint({input$PetalWidth})
    
    output$prediction <- renderPrint({chdRisk(input$SepalLength,input$SepalWidth,input$PetalLength,input$PetalWidth,modfit)})
     
  }
  
  )

