test_that("generate_equation() returns only a single row", {
  
  eq <- generate_equation()
  
  expect_equal( nrow(eq), 1 )
  expect_equal( names(eq[,1]), "formula" )
  expect_equal( names(eq[,2]), "description" )
  
})
