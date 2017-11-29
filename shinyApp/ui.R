library(shiny)

shinyUI(fluidPage(
    fluidRow(
      tags$h2("Building a Shiny App"),
          column(4,
             h3("Subsetting the iris data"), 
             p("Slide to select range of values. Default position of sliders cover the entire range of these variables"),
            
              sliderInput("Sepal.Length", label = "Sepal.Length", min = min(iris$Sepal.Length), 
                         max = max(iris$Sepal.Length),value=c(min(iris$Sepal.Length),max(iris$Sepal.Length))),
             
              sliderInput("Sepal.Width", label = "Sepal.Width", min = min(iris$Sepal.Width), 
                         max = max(iris$Sepal.Width), value = c(min(iris$Sepal.Width),max(iris$Sepal.Width)))),
             
            column(3,
                   
             sliderInput("Petal.Length", label = "Petal.Length", min = min(iris$Petal.Length), 
                         max = max(iris$Petal.Length), value = c(min(iris$Petal.Length),max(iris$Petal.Length))),
             
             
             sliderInput("Petal.Width", label = "Petal.Width", min = min(iris$Petal.Width), 
                         max = max(iris$Petal.Width), value = c(min(iris$Petal.Width),max(iris$Petal.Width)))),
      column(5,
            fluidRow(
              
              column(6, 
                     h3("Inputs for scatter plot"),
                     selectInput("xvar", "x-variable:", choices=names(iris[,-5])),
                     selectInput("yvar", "y-variable:", choices=names(iris[,-5]),selected = names(iris[2]))
                     ),
              
              column(6, 
                     h3("Input for box plot"),
                     selectInput("dvar", "Distribution of which variable for box plot?", choices=names(iris[,-5]),selected = names(iris[3]))#,
                     # submitButton("Update View", icon("refresh")))
            )
              
            
              
             
      ))),
      
      fluidRow(
        column(3,
               
               HTML("<h5>Summary of Subsetted Data</h5>"),
               verbatimTextOutput("summary")
        ),
        column(4,
               HTML("<br><br><h5>Data</h5>"),
               dataTableOutput(outputId="subsetdata")),
        
        column(5, 
               fluidRow(
               column(6,plotOutput("scatterplot") ),
               column(6,plotOutput("boxplot"))  )
               )
                
        
      )
      
  ))