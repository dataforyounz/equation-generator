
run_app <- function(){

  shiny::shinyApp(
    
    ui = bslib::page_navbar(
      
      title = "Equation Generator",
      theme = bslib::bs_theme("cosmo", version = "5"),
      
      bslib::nav_panel(
        title = "Home",
        
          bslib::layout_column_wrap(
            width = 1/2,
            
            bslib::card(
              
              htmltools::div(
                
                htmltools::h3("Welcome to the Equation Generator."),
                htmltools::h5("The application you didn't know you needed."),
                htmltools::hr(),
                htmltools::h6("Have you ever needed to prodcue a random equation? Well, this is the app for you!"),
                
                htmltools::p("Need to impress a friend? Looking for that intellectual gap filler?")
              )
              
            ),
            
            bslib::card(
            
              htmltools::div( class = "container",
                   style = "margin-top: 4rem;",
                
                   htmltools::div( class = "container text-center",
                                   htmltools::h4("Click the button to generate a random equation!"),
                  
                  shiny::actionButton( inputId = "go", label = "Go!", width = "50%", class = "mt-4 mb-4 btn-primary"),
                    
                  htmltools::div( class = "container d-flex align-items-center justify-content-center", 
                         style = "height: 100px; margin-top: 3rem; border: solid black 1px;",
                      
                         shiny::uiOutput("equation")
                    ),
                  
                  htmltools::h5( shiny::textOutput("description"), class="mt-3")
                )
              )
          )
        )
      )
    ), # <-- End UI
    
    server = function( input, output, session ){
      
      shiny::observeEvent( input$go, {
        
        shiny::req( input$go )
        
        equation <- generate_equation()
        
        output$equation <- shiny::renderUI( withMathJax( equation$formula ) )
        
        output$description <- shiny::renderText( equation$description )
        
      }) # <-- End observeEvent
      
    } # <-- End Server
  ) # <-- End ShinyApp
} # <-- End function

