generate_equation <- function(){
  
  n_equations <- nrow( equations )
  eq_index    <- sample( n_equations, 1 )
  eq_out      <- equations[eq_index,]
  
  return( eq_out )
}
