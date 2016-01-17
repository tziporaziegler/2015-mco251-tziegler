/*
 * Frac_Main.java
 *
 *
*/
/**
 *
 * @author  Administrator
 */
public class Frac_Main 
{
    
    public static void main(String[] args) 
    {
           
           boolean newOne = true;
           Fraction frac = new Fraction();
           FracCalc fcalc = new FracCalc();
           
           while (fcalc.readEquation(newOne,frac))
           {
               frac = fcalc.computeEquation();
               frac.print();
               newOne = false;       
           }
           return;
    }
    
}
