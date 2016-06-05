library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Dataset Summary and Observations"),
  
  # Sidebar with controls to provide a caption, select a dataset,
  # and specify the number of observations to view. The 
  # changes made to the caption in the textInput control are
  # updated in the output area upon clicking on 'Update Results' button
  sidebarLayout(
    sidebarPanel(
      textInput("caption", "Caption:", "Dataset Summary"),
      
      selectInput("dataset", "Choose a dataset:", 
                  choices = c("iris", "mtcars")),
      
      numericInput("obs", "Number of observations to view:", 10),
      
      submitButton("Update Results"),
    
    helpText("Note 1: While the data view will show only the specified",
             "number of observations, the summary will still be based",
             "on the full dataset."),
    helpText("Note 2: Please view the results in full screen mode.")
    
    ),
    
    # Show the caption, a summary of the dataset and an HTML 
    # table with the requested number of observations
    mainPanel(
      h3(textOutput("caption", container = span)),
      
      verbatimTextOutput("summary"), 
      
      tableOutput("view")
    )
  )
))