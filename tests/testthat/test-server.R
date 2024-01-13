test_that("server works", {
  
  shiny::testServer( server, {
    
    session$setInputs( equation = "4")
    print(output$equation)
  })
  
})
