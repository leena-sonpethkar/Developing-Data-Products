library(shiny)

shinyServer(function(input, output) {

  fit1 <- lm(Fertility ~ Agriculture, data=swiss)
  
  fit2 <- lm(Fertility ~ Education, data=swiss)
  
  fit1pred <- reactive({
    valAgri <- input$sliderAgri
    predict(fit1, newdata = data.frame(Agriculture = valAgri))
  })

  fit2pred <- reactive({
    valEdu <- input$sliderEdu
    predict(fit2, newdata = data.frame(Education = valEdu))
  })
  
  output$FertPlot <- renderPlot({
    valAgri <- input$sliderAgri
    valEdu <- input$sliderEdu
    
    if((input$showEdu) && (input$showAgri)){
      par(mfrow = c(1, 2), mar = c(5, 4, 2, 1))
    }
    
    if(input$showAgri){
        plot(swiss$Agriculture, swiss$Fertility, xlab = "Agriculture", 
         ylab = "Fertility", pch = 20, col="blue", main = "Fertility & Agriculture", xlim = c(0,100))
    
      abline(fit1, col = "dark blue", lwd = 2)
      points(valAgri, fit1pred(), col = "red", pch = 16, cex = 2)
    }
    
    if(input$showEdu){
        plot(swiss$Education, swiss$Fertility, xlab = "Education", 
         ylab = "Fertility", pch = 20, col = "blue", main = "Fertility & Education", xlim = c(0,100))
    
      abline(fit2, col = "dark blue", lwd = 2)
      points(valEdu, fit2pred(), col = "red", pch = 16, cex = 2)
    }
    
#    legend(25, 250, c("Model 1 Prediction", "Model 2 Prediction"), pch = 16, 
#           col = c("red", "blue"), bty = "n", cex = 1.2)
    
  })
  
  output$predAgri<- renderText({
    if(input$showAgri){
     paste("Predicted Fertility based on % of Agriculture population: ", round(fit1pred(), digits = 3))
    }
  })
  
  output$predEdu <- renderText({
    if(input$showEdu){
      paste("Predicted Fertility based on % of Education population: ", round(fit2pred(), digits = 3))
    }
  })
  
  
  ################
#  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
#    x    <- faithful[, 2] 
#    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
 #   hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
#  })
  
})
