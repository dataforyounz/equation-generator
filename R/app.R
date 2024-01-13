
library( shiny )
library( bslib )
library( htmltools )


equation_list <- list(

  c( formula = "$$ E = mc^2 $$", description = "Einstein's Mass-Energy Equivalence"),
  c( formula = "$$ F = ma $$", description = "Newton's Second Law of Motion"),
  c( formula = "$$ F = G\\frac{M_1 M_2}{r^2} $$", description = "Newton's Law of Gravitation"),
  c( formula = "$$ a^2 + b^2 = c^2 $$", description = "Pythagorean Theorem" ),
  c( formula = "$$ \\hat{H}\\Psi = i\\hbar\\frac{\\partial\\Psi}{\\partial t} $$", description = "The Schrödinger Equation"),
  c( formula = "$$ dS \\geq 0 $$", description = "Second Law of Thermodynamics" ),
  c( formula = "$$ \\frac{\\partial^2 u}{\\partial t^2} = v^2 \\nabla^2 u $$", descrption = "The Wave Equation"),
  c( formula = "$$ G_{\\mu\\nu} + \\Lambda g_{\\mu\\nu} = \\frac{8\\pi G}{c^4}T_{\\mu\\nu} $$", descrption = "The Einstein Field Equations"),
  c( formula = "$$ \\Delta P \\Delta x \\geq \\frac{\\hbar}{2} $$", descrption = "Heisenberg's Uncertainty Principle"),
  c( formula = "$$ S = k_B \\ln W $$", descrption = "Boltzmann Entropy"),
  c( formula = "$$ E = hv $$", descrption = "Planck's Equation"),
  c( formula = "$$ e ^{i\\pi} + 1 = 0 $$", descrption = "Euler's Identity"),
  c( formula = "$$ J = -D\\frac{d\\varphi}{dx} $$", descrption = "Fick's First Law of Diffusion"),
  c( formula = "$$ x^2 \\frac{d^2y}{dx^2} + x \\frac{dy}{dx} + (x^2 - \\alpha^2)y = 0 $$", descrption = "Bessel's Differential Equation") 
)

# generate_equation <- function(){
#   
#   n_equations <- 
#   
#   ind <- 
# }

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
        
        ind <- sample(length(equation_list), 1)
        
        output$equation <- renderUI({
          
          withMathJax( equation_list[[ind]][1] )
          
        })
        
        output$description <- renderText( equation_list[[ind]][2] )
        
      })
      
    }
    
  )

}

