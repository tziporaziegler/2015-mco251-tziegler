;simple power function
double power(double a, int b, int total) {
  if(b == 0){
     return total;
  }
  else {
     return power(a, b--, a*total);
  }
}