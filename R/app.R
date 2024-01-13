
library( shiny )
library( bslib )
library( htmltools )


run_app <- function(){

  shinyApp(
    
    ui = page_navbar(
      
      title = "Equation Generator",
      theme = bs_theme("cosmo", version = "5"),
      header = NULL,
      
      sidebar = NULL,
      
      nav_panel(
        title = "Home",
        
          layout_column_wrap(
            width = 1/2,
            
            card(
              
              div(
                
                h3("Welcome to the Equation Generator."),
                h5("The application you didn't know you needed."),
                hr(),
                h6("Have you ever needed to prodcue a random equation? Well, this is the app for you!"),
                
                p("Need to impress a friend? Looking for that intellectual gap filler?")
              )
              
            ),
            
            card(
            
              div( class = "container",
                   style = "margin-top: 4rem;",
                
                div( class = "container text-center",
                  h4("Click the button to generate a random equation!"),
                  
                  actionButton( inputId = "go", label = "Go!", width = "50%", class = "mt-4 mb-4 btn-primary"),
                    
                    div( class = "container d-flex align-items-center justify-content-center", 
                         style = "height: 100px; margin-top: 3rem; border: solid black 1px;",
                      
                         uiOutput("equation")
                    ),
                  
                   h5( textOutput("description"), class="mt-3")
                )
              )
          )
        )
      )
    ),
    
    server = function( input, output, session ){
      
      observeEvent( input$go, {
        
        req( input$go )
        
        equation <- generate_equation()
        
        output$equation <- renderUI({
          
          withMathJax( equation$formula )
          
        })
        
        output$description <- renderText( equation$description )
        
      })
      
    }
    
  )

}

