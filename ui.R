#Shiny Application created for Data Product course project
#Rely on the "ChickWeight" dataset in the preloaded datasets package
library(shiny)

#Define UI for data analysis 
#Use a fluid Bootstrap layout
shinyUI( fluidPage(
  #Give the page a title
  titlePanel("Shiny Application (Regression Analysis)"),
  br(),
  
  #Generate a row with a sidebar
  sidebarLayout(
     #Define the sidebar with one input
     sidebarPanel( tabsetPanel(
        tabPanel(  h4("Model Input"),
                   hr(),
                   h4("Dependent variable"),
                   "Fertility",
                   hr(),
                   #created indepdent variables input
                   checkboxGroupInput("independent", h4("Independent Variables"),
                           choices = list("Agriculture" = "Agriculture", "Examination" = "Examination", 
                                         "Education" = "Education", "Catholic" = "Catholic",
                                          "Infant.Mortality" = "Infant.Mortality"), 
                           selected = NULL),
                    helpText("Check to choose independent variables")
         ),
        tabPanel(h4("Help"), hr(),
                 p("This shiny application is created for the course project of Developin Data Project on coursera.
                  This project displays exploratory data analysis and multiple linear regression analysis with 
                  user selected variables. Dataset swiss from preloaded R datasets package swiss is used."),
                 p("On the left side of the Application panel, user can choose independent variables used for exloratory 
                  data analysis and linear regression model; on the right side, there are four panels Data, Summary Statistics,
                  Scatterplot and Regression Results. Data panel shows the dataset and user can choose the number of rows to print.
                  Summary Statistics panel displays the summary statistics of Fertility and user chosen variables.
                  Scatterplot panel displays the scatterplot of Fertitlity variable and user chosen variables.
                  Regression Resulst panels displays the coefficent tables of multiple linear regression model of regressing
                  Fertility on user chosen independent variables"),
                  hr(),
                  textOutput("date"))
     )#tabesetPanel
     ),#sidebarPanel
     #Show the data analysis outputs
     mainPanel(
             #create tabset panels showing data analysis results
             #including data summary, scatter plots of variabes and regression analysis results
             tabsetPanel(
                     tabPanel(strong(h4("Data")),
                              hr(),
                              helpText("Display swiss dataset used for regression analysis"),
                              hr(),
                              numericInput("nrow", label="Select number of rows to view", 10, min=5, max=nrow(swiss)),
                              hr(),
                              tableOutput("data")),
                     tabPanel(strong(h4("Summary Statistics")), 
                              hr(),
                              helpText("Summary statistics of dependent variable and selected independent variables"),
                              hr(),
                              verbatimTextOutput("summary_text"),
                              hr(),
                              verbatimTextOutput("summary_table")
                              ), 
                     tabPanel(strong(h4("Scatter Plot")),  
                              hr(),
                              helpText("Scatter plot of dependent variable and selected independent variables"),
                              hr(),
                              verbatimTextOutput("plotText"),
                              hr(),
                              plotOutput("plot")
                              ),
                     tabPanel(strong(h4("Regression Results")),  
                              hr(),
                              helpText("Multiple linear regression of Fertility w.r.t. selected independent variables"),
                              hr(),
                              verbatimTextOutput("regText"),
                              hr(),
                              verbatimTextOutput("regModel"),
                              hr(),
                              helpText("Regression Model Coefficients Table"),
                              tableOutput("regCoef")
                     )
             )
       )#mainPanel
  ) #sidebarLayout
))