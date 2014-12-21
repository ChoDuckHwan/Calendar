package com.mycompany.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.mycompany.myapp.dao.CalendarUserDao;
import com.mycompany.myapp.dao.EventAttendeeDao;
import com.mycompany.myapp.dao.EventDao;
import com.mycompany.myapp.domain.CalendarUser;
import com.mycompany.myapp.domain.Event;
import com.mycompany.myapp.domain.EventAttendee;
import com.mycompany.myapp.domain.EventLevel;
import com.mycompany.myapp.domain.UserRole;
import com.mycompany.myapp.dao.UserRoleDao;


@Service("calendarService")
@Transactional
public class DefaultCalendarService implements CalendarService {
	public static final int MIN_NUMLIKES_FOR_HOT = 10;

	@Autowired
	private EventDao eventDao;

	@Autowired
	private CalendarUserDao userDao;

	@Autowired
	private EventAttendeeDao eventAttendeeDao;
	
	@Autowired
	private UserRoleDao userRoleDao;

	public void setEventDao(EventDao eventDao) {
		this.eventDao = eventDao;
	}
	
	/* CalendarUser */
	@Override
	public CalendarUser getUser(int id) {
		return this.userDao.findUser(id);
	}

	@Override
	public CalendarUser getUserByEmail(String email) {
		return userDao.findUserByEmail(email);
	}
	
	@Override
	public List<CalendarUser> getAllUsers()
	{
		return userDao.findAllusers();
	}

	@Override
	public List<CalendarUser> getUsersByEmail(String partialEmail) {
		return userDao.findUsersByEmail(partialEmail);
	}

	@Override
	public int createUser(CalendarUser user) {	
		userDao.createUser(user);
		UserRole userRole = new UserRole(user.getId(),user.getEmail(), "ROLE_USER");
		return this.userRoleDao.add(userRole);
	}

	@Override
	public void deleteAllUsers() {
		userDao.deleteAll();
	}

	@Override
	public void updateUser(CalendarUser user){
		userDao.updateUser(user);
	}
	/* Event */
	@Override
	public Event getEvent(int eventId) {
		return eventDao.findEvent(eventId);
	}

	@Override
	public List<Event> getEventForOwner(int ownerUserId) {
		return eventDao.findForOwner(ownerUserId);
	}

	@Override
	public List<Event> getAllEvents() {
		return eventDao.findAllEvents();
	}

	@Override
	public int createEvent(Event event) {
		if (event.getEventLevel() == null) {
			event.setEventLevel(EventLevel.NORMAL);
		}

		return eventDao.createEvent(event);
	}

	public void udpateEvent(Event event)
	{
		eventDao.udpateEvent(event);
	}
	
	@Override
	public void deleteAllEvents() {
		eventDao.deleteAll();
	}

	/* EventAttendee */
	@Override
	public List<EventAttendee> getEventAttendeeByEventId(int eventId) {
		return null;
	}

	@Override
	public List<EventAttendee> getEventAttendeeByAttendeeId(int attendeeId) {
		return eventAttendeeDao.findEventAttendeeByAttendeeId(attendeeId);
	}

	@Override
	public int createEventAttendee(EventAttendee eventAttendee) {
		return eventAttendeeDao.createEventAttendee(eventAttendee);
	}

	@Override
	public void deleteEventAttendee(int id) {
		eventAttendeeDao.deleteEventAttendee(id);
	}

	@Override
	public void deleteAllEventAttendees() {
		eventAttendeeDao.deleteAll();
	}
	
	@Override
	public List<EventAttendee> getAllEventAttendees()
	{
		return eventAttendeeDao.findAllEventAttendees();
	}



	/* upgradeEventLevels */
	@Override
	public void upgradeEventLevels() throws Exception{
		List<Event> events = eventDao.findAllEvents();
		for(Event event : events) {
			if( canUpgradeEventLevel(event)) {
				upgradeEventLevel(event);
			}
		}
	}

	@Override
	public boolean canUpgradeEventLevel(Event event) {
		EventLevel currentLevel = event.getEventLevel();
		switch( currentLevel ) {
		case NORMAL: return ( event.getNumLikes() >= MIN_NUMLIKES_FOR_HOT);
		case HOT: return false;
		default: throw new IllegalArgumentException("Unknown Level: " + currentLevel);
		}
	}

	@Override
	public void upgradeEventLevel(Event event) {
		event.upgradeLevel();
		eventDao.udpateEvent(event);
	}
	@Override
	public CalendarUser get(Integer id) {
		return this.userDao.findUser(id);
	}

	@Override
	public List<CalendarUser> getAll() {
		return this.userDao.findAllusers();
	}

	@Override
	public void upDateEvent(Event event) {
		eventDao.udpateEvent(event);
		
	}

	@Override
	public void deleteEvent(Event event) {
		eventDao.deleteEvent(event);
		
	}
	
}