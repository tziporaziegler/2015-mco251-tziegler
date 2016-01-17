/*
 * Fraction.java
 *
 * Created on November 11, 2003, 10:25 PM
 */

/**
  * @author  Rabbi Erlbaum
 */
public class Fraction 
{
    
    private int num,
                denom;
    
    // Constructors
    public Fraction() 
    {
        num = 0;
        denom = 1;
    }
    public Fraction(int n) 
    {
        this(n,1);
    }
    public Fraction(int p, int q) 
    {
        num = p;
        denom = q;
        reduce();
    }
    
    public Fraction(Fraction other) 
    {
        num = other.num;
        denom = other.denom;
    }
    
    public void print()
    {
        System.out.print(num + "/" + denom + " ");
    }
    
    // accessor methods
    public int getNum()
    {
        return num;
    }
    
    public int getDenom()
    {
        return denom;
    }
    
    // modifier methods
    public void setNum(int numset)
    {
        num = numset;
    }
    
    public void setDenom(int denomset)
    {
       denom = denomset;
    }
    
    // Will return greatest common factor of two numbers
    // Used in reduce()
    private int gcf(int num1, int num2)
    {
        for(int i=35000; i > 1; i--)
            if ( (num1 % i == 0) && (num2 % i == 0) )
                return i;
        return 1;
    }   
    
        
    // reduces the fraction object
    public void reduce()
    {
        int greatestCF;
        
        greatestCF = gcf(num,denom);
        num /= greatestCF;
        denom /= greatestCF;
        if (num == denom)
            num = denom = 1;
    }
    
    // Inverts the fraction object
    public void invert()
    {
        int temp;
        
        temp = num;
        num = denom;
        denom = temp;
    }
            
 }
