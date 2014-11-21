package com.mycompany.calendar.dao;

import java.util.List;

import com.mycompany.calendar.domain.EventAttendee;

public interface EventAttendeeDao {
    public List<EventAttendee> findEventAttendeeByEventId(int eventId);
    
    public List<EventAttendee> findEventAttendeeByAttendeeId(int attendeeId);

    public int createEventAttendee(EventAttendee eventAttendee);
    
    public List<EventAttendee> findAllEventAttendees();
    
    public void deleteEventAttendee(int id);
    
    public void deleteAll();

}