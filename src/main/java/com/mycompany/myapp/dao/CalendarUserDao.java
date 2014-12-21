package com.mycompany.myapp.dao;

import java.util.List;

import com.mycompany.myapp.domain.CalendarUser;
import com.mycompany.myapp.domain.Event;

public interface CalendarUserDao {
    public CalendarUser findUser(int id);

    public void updateUser(CalendarUser user);
    
    public CalendarUser findUserByEmail(String email);

    public List<CalendarUser> findUsersByEmail(String partialEmail);
    
    public List<CalendarUser> findUsersByAttendeeId(int attendeeid);

    public int createUser(CalendarUser user);
    
    public List<CalendarUser> findAllusers();
    
    public void deleteAll();
}
