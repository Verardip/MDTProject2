/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DSClicker;

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.year;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.year;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author pvera
 */
public class Student {
    public ArrayList<String> classesEarnedA = new ArrayList<>();
    public ArrayList<String> currentClasses = new ArrayList<>();
    public Map<String, ArrayList<String>> tutorAvailability = new HashMap<>();
    public Map<String, ArrayList<String>> tutorScheduledAppointments = new HashMap<>();
    public Map<String, ArrayList<String>> studentScheduledAppointments = new HashMap<>();
    
    public String name;
    public double rating;
    
    public Student(String info){
        String[] infoRecords = info.split(" ");
        
        name = infoRecords[0]+" " +infoRecords[1];
        name = name.toLowerCase();
        for (int i = 2; i < 7; i++){
            classesEarnedA.add(infoRecords[i]);
        }
        
        for (int i = 7; i < 11; i++){
            currentClasses.add(infoRecords[i]);
        }
    }    
    public void populateClassesEarnedA(String earned){
        String[] earnedClasses = earned.split(" ");
        for (int i = 2; i < 7; i++){
            classesEarnedA.add(earnedClasses[i]);
        }
        
    }
    
//    public static void main(String[] args){
//        Student s1 = new Student("Paul Verardi Data_Structures Calculus Chemistry Physics Accounting Distributed_Systems Managing_Disrupted_Techonology Java French");
//        Student s2 = new Student("Andrew Lawson Computer_Science Calculus Chemistry Physics Economics NoSQL_Database Linux Marketing Management");
//        Student s3 = new Student("Christopher Heywood History Calculus French Physics Finance Database_Management Data_Mining Java Python");
//        Student s4 = new Student("Theresa Froehlich Statistics Biology Spanish Physics Economics Government Data_Structures Astronomy Ethics");
//        System.out.println(s1.name);
//        ArrayList<String> times = new ArrayList<>();
//        String time = "Wednesday, April 25 2017. 1:00 PM - 2:00 PM";
//        times.add(time);
//        System.out.println(times.get(0));
//        s1.tutorAvailability.put("Calculus", times);
//        s1.tutorAvailability.put("Chemistry", times);
//        
//    }
    
            
    public void updateAvailability(String className, String timeSlot){
        if (tutorAvailability.containsKey(className)){
            ArrayList<String> currentTimes = tutorAvailability.get(className);
            currentTimes.add(timeSlot);
            tutorAvailability.put(className, currentTimes);
        } else {
            ArrayList<String> currentTimes = new ArrayList<>();
            currentTimes.add(timeSlot);
            tutorAvailability.put(className, currentTimes);
        }
    }   
    
}
