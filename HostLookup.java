import java.util.Scanner;
import java.net.*;

public class HostLookup {
    // Input Scanner object
    static Scanner scnr = new Scanner(System.in);
    
    // MAIN
    public static void main(String[] args) {
        // Container for hostname input
        String host = "";
        
        // Welcome message
        System.out.println("Welcome to the IP Lookup Application.");
        
        // Main program loop
        do {
            System.out.print("\nEnter a valid host name: ");
            host = scnr.nextLine();
            try {
                // Executes DNS lookup for hostname
                InetAddress[] addresses = InetAddress.getAllByName(host); 
                
                // Prints out all discovered IP addresses
                for (InetAddress ip : addresses) {
                    System.out.println(ip.toString());
                }
            }
            catch (UnknownHostException e) {    // Invalid host exception handler
                System.out.println("Unknown host");
            }
            
        } while (input());
    }
    
    // Gets new hostname input
    private static boolean input() {
        System.out.print('\n');
        char inputChar;
        
        // Asks for new input until valid input is read
        while (true) {
            // Gets new input
            System.out.print("Look up another hostname? (Y or N)");
            inputChar = scnr.nextLine().toLowerCase().charAt(0);
            
            // Exits method if valid y or n input is read
            if (inputChar == 'y') {
                return true;
            }
            else if (inputChar == 'n') {
                return false;
            }
        }
    }
}
