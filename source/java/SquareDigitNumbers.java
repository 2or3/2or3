import java.util.*;
import java.io.*;

public class SquareDigitNumbers
{
    public static void main(String args[])
    {
        int x;
        BufferedReader a = new BufferedReader(new InputStreamReader(System.in));
        try{
            System.out.println("input num");
            x = Integer.valueOf(a.readLine()).intValue();
            int num = getNumber(x);
            System.out.println(num);
        }
        catch(IOException e)
        {
            System.out.println("IO Error");
            System.exit(1);
        }   
    }
    public static int getNumber(int n)
    {
        int m;
        m = n * n;
        return m;
    }
}
