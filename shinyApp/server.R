library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

  dataset=reactive(iris[(iris$Sepal.Length>=input$Sepal.Length[1] & iris$Sepal.Length<=input$Sepal.Length[2]&
                            iris$Sepal.Width>=input$Sepal.Width[1] & iris$Sepal.Width<=input$Sepal.Width[2]&
                               iris$Petal.Length>=input$Petal.Length[1] & iris$Petal.Length<=input$Petal.Length[2]&
                                  iris$Petal.Width>=input$Petal.Width[1] & iris$Petal.Width<=input$Petal.Width[2]),])
                            
  
    output$subsetdata <- renderDataTable(
    dataset(),options=list(pageLength=10))
  
  
  output$summary <- renderPrint(
    summary(dataset())
  )
  
  output$scatterplot=renderPlot(ggplot(dataset(),aes_string(x=input$xvar, y=input$yvar,color="Species"))+ geom_point()+
    ggtitle("Scatter Plot")
    )
  
  output$boxplot=renderPlot(ggplot(dataset(),aes_string(x="Species",y=input$dvar))+ geom_boxplot()+
      ggtitle("Box Plot")
  )
  
})
  