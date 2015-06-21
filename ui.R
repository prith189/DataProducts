shinyUI(
  pageWithSidebar(
    #Application Title
    headerPanel("Predicting Iris Species"),
    #headerPanel("Since this is a very simple app, I will provide the documentation here.\n The app predicts the Species of Iris based on this Sepal length/Width an Petal length/Width\n. Once you enter the values, the predictor will return one of the three species: Iris setosa, versicolor, and virginica"),
    
    sidebarPanel(
      numericInput('SepalLength','SepalLength in cm(between 4cm and 8cm)',6,min=4,max=8,step=0.1),
      numericInput('SepalWidth','SepalWidth in cm(between 1.9cm and 4.5cm)',3,min=1.9,max=4.5,step=0.1),
      numericInput('PetalLength','PetalLength in cm(between 0.9cm and 7cm',4,min=0.9,max=7,step=0.1),
      numericInput('PetalWidth','PetalWidth in cm(between 0cm and 2.6cm',1.2,min=0,max=2.6,step=0.1),
      submitButton("Submit")
      
    ),
    mainPanel(
      
      h3("Since this is a very simple app, I will provide the documentation here.\n The app predicts the Species of Iris based on this Sepal length/Width an Petal length/Width\n. Once you enter the values, the predictor will return one of the three species: Iris setosa, versicolor, and virginica"),
      h3("Results of prediction"),
      
      h4("You entered Sepal Length as"),
      verbatimTextOutput("inputSepalLength"),
      h4("You entered Sepal Width as"),
      verbatimTextOutput("inputSepalWidth"),
      h4("You entered Petal Length as"),
      verbatimTextOutput("inputPetalLength"),
      h4("You entered Petal Width as"),
      verbatimTextOutput("inputPetalWidth"),
      h4("Which resulted in a prediction of"),
      verbatimTextOutput("prediction")
      
      
    )
    
    
  )
  
  
)