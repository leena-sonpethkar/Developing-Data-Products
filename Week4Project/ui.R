library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Impact on Fertility based on Agriculture and Educated population."),
  
  # Sidebar with a slider input for Agriculture 
  sidebarLayout(
    sidebarPanel(
      checkboxInput("showAgri", "Show Fertility~Agriculture Plot", value = TRUE),

      sliderInput("sliderAgri",
                  "Select Agriculture value (in %):",
                  min = 1,
                  max = 100,
                  value = 45),
      
      checkboxInput("showEdu", "Show Fertility~Education Plot", value = TRUE),
  
      sliderInput("sliderEdu",
                "Select Education value (in %):",
                min = 1,
                max = 100,
                value = 30),
       
       submitButton("Calculate & Refresh")
  ),
  
    # Show a plot of the generated Fertility
    mainPanel(
       plotOutput("FertPlot"),
       
       #h3("Predicted Fertility based on Agriculture :"), 
       h3(textOutput("predAgri")),
       #h3("Predicted Fertility based on Education :"), 
       h3(textOutput("predEdu"))
       
    )
  )
))
