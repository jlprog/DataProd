#define server for data analysis
library(shiny)
library(datasets)
require(stats)
require(graphics)

data(swiss)
shinyServer(function(input,output){   
  #sidebar date
  dd = reactive({ date() })
  output$date = renderText({ dd()  })

  #independent variables
  idp =  reactive({ input$independent })
  
  #dataset for regression
  dataSet = reactive({ swiss[, c("Fertility",idp())] })
 
  #display dataset
  output$data = renderTable({
          head( swiss, n=input$nrow)
  })
  
  #summary statistics
  output$summary_text  = renderText({ 
                         if( !length(idp()) ) 
                                 print("Selected independent variables: NONE")
                         else
                                 print( c("Selected independent variables:", idp()))
  })
  
  output$summary_table = renderPrint({summary(dataSet())})

 
  #multiple linear regression model
  formula  = reactive({ paste("Fertility~",paste(idp(),collapse="+")) })
  model    = reactive({ lm(formula(), data=dataSet()) })
  
  #Scatter plot with independent variables selected
  output$plotText = renderText({
                  if( !length(idp()) )
                  print("Selected independent variables: NONE")
          else
                  print( c("Selected independent variables:", idp()) )
  })
  
  output$plot = renderPlot({   
                   if( length(idp()) )
                       pairs(dataSet(), panel = panel.smooth, main = "swiss data", col = 3 + (swiss$Catholic > 50)) 
                })
  

  #Regression analysis results
  output$regText = renderText({
                if( !length(idp()) )
                        print("Selected independent variables: NONE")
                else
                        print( c("Selected independent variables:", idp()) )

  })
  
  output$regModel = renderText({
                 if( !length(idp()))
                         print("Regression Model: NA")
                 else
                         print( c("Regression Model: ",formula()) )
  })
  
  output$regCoef = renderTable({
                       if( length(idp()) )
                           summary( model() )$coef
                      })

})