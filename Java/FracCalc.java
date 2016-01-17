/*
 * Caclculator
 *
   by Rabbi Erlbaum
 */
public class FracCalc 
{
    
    EasyReader console = new EasyReader();
        
    private Fraction frac1,frac2;
    private char operator;
    
    private Fraction readFrac() 
    {
        Fraction frac;
        int num=0;
        int denom=1;
        char c;
        
        c = console.readChar();
        while (Character.isWhitespace(c))
            c = console.readChar();
        if (Character.isDigit(c))
        {
            while (Character.isDigit(c))
            {
                num = num*10 + Character.digit(c,10);
                c = console.readChar();
            }
            if (c == '/')
            {
                denom = 0;
                c = console.readChar();
                while (Character.isDigit(c))
                {
                    denom = denom*10 + Character.digit(c,10);
                    c = console.readChar();
                }
             
             } 
        }
        frac = new Fraction(num,denom);
        return frac;
    }
    
    private char readOp()
    {
        char op = console.readChar();
        
        while (Character.isWhitespace(op))
            op = console.readChar();
        return op;
    }
    
    public boolean readEquation(boolean newOne, Fraction frac)
    {
        if (newOne)
            frac1 = readFrac();
        else
            frac1 = frac;
        operator = readOp();
        while  (operator == 'C')
        {
            frac1 = readFrac();
            operator = readOp();
        }
        if (operator == 'Q')
            return false;
        frac2 = readFrac();
        return true;
       
            
    }
       
    private  Fraction add(Fraction f1, Fraction f2)
    {
        Fraction result = new Fraction();
        
        if (f1.getDenom() == f2.getDenom())
        {
            result.setNum(f1.getNum() + f2.getNum());
            result.setDenom(f1.getDenom());
        } else
        {
            result.setDenom(f1.getDenom() * f2.getDenom());
            result.setNum( ( (f1.getNum() * f2.getDenom()) + (f2.getNum() * f1.getDenom())));
        }
        result.reduce();  
        return result;
    }     
    
    private Fraction subtract(Fraction f1, Fraction f2)
    {
        Fraction result = new Fraction();
        
        if (f1.getDenom() == f2.getDenom())
        {
            result.setNum(f1.getNum() - f2.getNum());
            result.setDenom(f1.getDenom());
        } else
        {
            result.setDenom(f1.getDenom() * f2.getDenom());
            result.setNum( ( (f1.getNum() * f2.getDenom()) - (f2.getNum() * f1.getDenom())));
        }
        result.reduce();  
        return result;
    }
    
    private Fraction multiply(Fraction f1, Fraction f2)
    {
        Fraction result = new Fraction();
              
        result.setNum(f1.getNum() * f2.getNum());
        result.setDenom(f1.getDenom() * f2.getDenom());
        result.reduce();  
        return result;
    }
    
    private Fraction divide(Fraction f1, Fraction f2)
    {
        Fraction result = new Fraction();
        Fraction temp = new Fraction(f2);
              
        temp.invert();
        result.setNum(f1.getNum() * temp.getNum());
        result.setDenom(f1.getDenom() * temp.getDenom() );
        result.reduce();  
        return result;
    }
    
    public Fraction computeEquation()
    {
        Fraction answer = new Fraction();
        
        if (operator == '+')
           answer = add(frac1,frac2);
        else if (operator == '-')
            answer = subtract(frac1,frac2);
        else if (operator == '*')
            answer = multiply(frac1,frac2);
        else if (operator == '/')
            answer = divide(frac1,frac2);
         
        return answer;
    }
}                  
        
        
        
        
        
        
        
        
        
        
    
        
    

