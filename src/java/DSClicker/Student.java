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
    
    @Override
    public java.lang.String toString()
    {
        return this.name;
    }
    
}
