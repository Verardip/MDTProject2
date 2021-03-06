package DSClicker;

/*
 * @author Paul Verardi
 * 
 * This file is the Model component of the MVC, and it models the business
 * logic for the web application.  In this case, the business logic involves
 * making a updating, retrieving, and deleting the results of clicker responses
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;


public class DSClickerModel {
    public static Map<String, Student> students = new HashMap<String, Student>();
    public static boolean initAlready = false;
    
    public void populateStudentMap(){
        System.out.println("populateStudentMap() called");
        
        Student s1 = new Student("Paul Verardi Data_Structures Calculus Chemistry Physics Accounting Distributed_Systems Managing_Disruptive_Technology Java French");
        Student s2 = new Student("Andrew Lawson Computer_Science Calculus Chemistry Physics Economics NoSQL_Database Linux Marketing Management");
        Student s3 = new Student("Christopher Heywood History Calculus French Physics Finance Database_Management Data_Mining Java Python");
        Student s4 = new Student("Theresa Froehlich Statistics Biology Spanish Physics Economics Calculus Data_Structures Astronomy Ethics");
        
        ArrayList<String> times = new ArrayList<>();
        String time = "Wednesday, April 25 2017. 1:00 PM - 2:00 PM";
        times.add(time);
        System.out.println(times.get(0));
//        s1.tutorAvailability.put("Calculus", times);
        s1.tutorAvailability.put("Chemistry", times);
        
        ArrayList<String> scheduledtimes = new ArrayList<>();
        String scheduledTime = "Wednesday, April 25 2017. 1:00 PM - 2:00 PM";
        scheduledtimes.add(scheduledTime);
        System.out.println(times.get(0));
        s1.tutorScheduledAppointments.put("Calculus", scheduledtimes);
        
        
        students.put(s1.name, s1);
        students.put(s2.name, s2);
        students.put(s3.name, s3);
        students.put(s4.name, s4);
        
        initAlready = true;
        

            
    }

    public Map<String, ArrayList<Student>> getAvailableStudents(String className)
    {
        Map<String, ArrayList<Student>> availableStudentsForClass = new HashMap<String, ArrayList<Student>>();
        ArrayList<Student> availableStudents = new ArrayList<Student>();
        
        // All Studeutsn
        for (Entry student : students.entrySet())
        {
            Student tempStudent = (Student)student.getValue();
            tempStudent.name = initCaps(tempStudent.name);
            
            // tutorAvailability is a map of <ClassName, ArrayList>.
            for (Entry availability : tempStudent.tutorAvailability.entrySet())
            {
                if (availability.getKey().equals(className))
                {  
                    availableStudents.add(tempStudent);
                }  
            }
        }
        
        availableStudentsForClass.put(className, availableStudents);
        
        return availableStudentsForClass;
    }

    private static String initCaps(String notInitCaps)
    {
        String[] tokens = notInitCaps.split("\\s");
        notInitCaps = "";

        for (int i = 0; i < tokens.length; i++)
        {
            char capLetter = Character.toUpperCase(tokens[i].charAt(0));
            notInitCaps += "" + capLetter + tokens[i].substring(1);
            notInitCaps += " ";
        }
        
        return notInitCaps.substring(0, notInitCaps.length()-1);
        
        // return notInitCaps;
    }
}
