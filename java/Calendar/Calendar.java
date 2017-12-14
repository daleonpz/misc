/**
 * Class Calendar
 *
 * @author Daniel Paredes
 * @version 12.2017
 */

/* Imports */
import java.util.ArrayList;

public class Calendar{
    
    private static final byte[] daysOfMonths = {
        31, 28, 31, 30, 
        31, 30, 31, 31,
        30, 31, 30, 31
    };

    private static final ArrayList<String> months =
        new ArrayList<String>(){{
            add("January");
            add("February");
            add("March");
            add("April");
            add("May");
            add("June");
            add("July");
            add("August");
            add("September");
            add("October");
            add("November");
            add("Decemebre");
        }};

    private static final ArrayList<String> days = 
        new ArrayList<String>(){{
            add("Mo");
            add("Tu");
            add("We");
            add("Th");
            add("Fr");
            add("Sa");
            add("Su");
        }};
    /**
     * Constructor for objects of class calendar 
     */

    public Calendar(){
    }
    
    /** 
      * isLeapYear checks whether is a Leap Year 
      * static: no use instance variables
    **/
    public static boolean isLeapYear(short year){
        int mod100 = year%100;
        int mod4   = year%4;
        int mod400 = year%400;
        
        if ( mod400 == 0) return true;

        if ( ( mod4==0) && (mod100>0) ) return true;

        return false;
    }

    /** 
    *   dayOfMonth hat returns the number of days of a month 
    **/
    public byte dayOfMonth(byte month, short year){
        if (( month == 1 ) && ( isLeapYear(year)) ) 
            return (byte)29;
        return daysOfMonths[month];
    }


    /**
      * firstDayOfYear
      * Static: do not use any instance variable
    **/
    public static byte firstDayOfYear(short year){
        int yeari = (int)year-1;

        int w = (
                5*(yeari % 4) + 
                4*(yeari % 100) + 
                6*(yeari % 400)
                ) % 7;

        return (byte)w;
    }

    /**
      * firstDayOfMonth returns the first day of a month
    **/
    public byte firstDayOfMonth(byte month, short year){
        int accDays = (int) this.firstDayOfYear(year);
        for (byte i=0; i<month; i++)
            accDays += this.dayOfMonth(i, year);
        return (byte)(accDays%7);
    } 
          
    /**
      * printMonth prints the given month for that
      year on the console in the format 
      provided in the example.
     **/ 
    public void printMonth(byte month, short year){
        byte firstDay = this.firstDayOfMonth(month, year);
        byte numberOfDays = this.dayOfMonth(month, year);

        int i; 

        // Printing the month and year
        System.out.println(months.get(month) + " " +  year);

        // Printing the days of the week
        for( i=0; i<days.size(); i++)
            System.out.print(days.get(i) + " ");
        System.out.print("\n");

        // Printing the numbers
        // format for numbers "XX "
            // empty spaces for the first week
        for( i=0; i<firstDay; i++)
            System.out.print("   ");

            // printing the numbers
        for( i=1 ; i<10 ; i++){
           System.out.print(" "+i + " ");
           if ( ((i+firstDay)%7)==0 ) System.out.print("\n");
        }
    
        for( ; i<=numberOfDays ; i++){
           System.out.print(i + " ");
           if ( ((i+firstDay)%7)==0 ) System.out.print("\n");
        }

        System.out.print("\n");       
    }

    public static void main(String[] args){
        Calendar cal = new Calendar();
        cal.printMonth( (byte)1, (short)1600);
        cal.printMonth( (byte)9, (short)2016);
        cal.printMonth( (byte)8, (short)2017);
   } 
}
