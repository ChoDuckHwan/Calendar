package com.mycompany.myapp.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.myapp.domain.EventAttendee;
import com.mycompany.myapp.domain.CalendarUser;
import com.mycompany.myapp.domain.Event;
import com.mycompany.myapp.domain.EventLevel;
import com.mycompany.myapp.service.CalendarService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/events")
public class EventController {
	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@Autowired
	@Qualifier("calendarService")
	private CalendarService calendarService;

	@RequestMapping(value = "/createEvents", method = RequestMethod.GET)
	public String viewRegistration(Model model) {
		Event eventForm = new Event();
		model.addAttribute("eventForm", eventForm);
		return "createEvent/createEvents";
	}

	@RequestMapping(value = "/showAllevents", method = RequestMethod.GET)
	public String showAllevents(Locale locale, Model model) {
		List<Event> events = this.calendarService.getAllEvents();
		EventAttendee attendeeEvent = new EventAttendee();
		model.addAttribute("events", events);
		model.addAttribute("attendeeEvent", attendeeEvent);

		return "showAllevents";
	}

	@RequestMapping(value = "/showCalendar", method = RequestMethod.GET)
	public String showCalendar(Locale locale, Model model) {
		List<Event> events = this.calendarService.getAllEvents();
		model.addAttribute("events", events);

		return "showCalendar";
	}

	@RequestMapping(value = "/showAttendeeUser", method = RequestMethod.GET)
	public String showAttendeeUser(Locale locale, Model model) {

		List<EventAttendee> eventAttendees = this.calendarService
				.getAllEventAttendees();
		model.addAttribute("eventAttendees", eventAttendees);

		return "showAttendeeUser";
	}

	@RequestMapping(value = "/myAttendeeEvent", method = RequestMethod.GET)
	public String showMyAttendeeEvent(Locale locale, Model model) {

		List<EventAttendee> eventAttendees = this.calendarService
				.getAllEventAttendees();
		
		List<Event> attendeeList = new ArrayList<Event>();

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			CalendarUser user = this.calendarService.getUserByEmail(userDetail
					.getUsername());

			for (int i = 0; i < eventAttendees.size(); i++) {
				if (user.getId() == eventAttendees.get(i).getAttendee().getId()) {
					try {
						attendeeList.add(this.calendarService
								.getEvent(eventAttendees.get(i).getId()));
					} catch (Exception e) {
					}
				}
			}

		}
		model.addAttribute("attendeeList", attendeeList);
		return "myAttendeeEvent";
	}

	@RequestMapping(value = "/myOwnerEvent", method = RequestMethod.GET)
	public String showMyOwnerEvent(Locale locale, Model model) {

		List<Event> events = this.calendarService.getAllEvents();
		List<Event> ownerList = new ArrayList<Event>();

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			CalendarUser user = this.calendarService.getUserByEmail(userDetail
					.getUsername());

			for (int i = 0; i < events.size(); i++) {
				if (user.getId() == events.get(i).getOwner().getId())
					ownerList.add(events.get(i));
			}

		}
		model.addAttribute("ownerList", ownerList);

		return "myOwnerEvent";
	}

	@RequestMapping(value = "/createEventSuccess", method = RequestMethod.POST)
	public String processRegistration(
			@ModelAttribute("eventForm") Event events, Model model) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			CalendarUser user = this.calendarService.getUserByEmail(userDetail
					.getUsername());

			events.setOwner(user);
			events.setNumLikes(0);
			events.setEventLevel(EventLevel.NORMAL);

		}

		this.calendarService.createEvent(events);

		// for testing purpose:
		System.out.println("id: " + events.getId());
		System.out.println("when: " + events.getWhen());
		System.out.println("summary: " + events.getSummary());
		System.out.println("description: " + events.getDescription());
		System.out.println("owner: " + events.getOwner());
		System.out.println("numlikes: " + events.getNumLikes());
		System.out.println("eventlevel: " + events.getEventLevel());

		return "createEvent/createEventSuccess";
	}

	@RequestMapping(value = "/eventLikeSuccess")
	public String processEventLike(Model model, HttpServletRequest request) {

		int event_id = Integer.parseInt(request.getParameter("event_id"));
		Event tempEv = this.calendarService.getEvent(event_id);
		tempEv.setNumLikes(tempEv.getNumLikes() + 1);
		this.calendarService.upDateEvent(tempEv);
		try {
			this.calendarService.upgradeEventLevels();
		} catch (Exception e) {

			e.printStackTrace();
		}

		List<Event> temp_events = this.calendarService.getAllEvents();
		List<Event> events = new ArrayList<Event>();

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			CalendarUser user = this.calendarService.getUserByEmail(userDetail
					.getUsername());

			for (int i = 0; i < temp_events.size(); i++) {
				if (user.getId() != temp_events.get(i).getOwner().getId()) {
					events.add(temp_events.get(i));
				}
			}

		}

		model.addAttribute("events", events);
		return "showAllevents";
	}

	@RequestMapping(value = "/eventJoinSuccess")
	public String processEventJoin(Model model, HttpServletRequest request) {

		int event_id = Integer.parseInt(request.getParameter("event_id"));

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		EventAttendee eventAttendee = new EventAttendee();
		List<Event> temp_events = this.calendarService.getAllEvents();
		List<Event> events = new ArrayList<Event>();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			CalendarUser user = this.calendarService.getUserByEmail(userDetail
					.getUsername());
			eventAttendee.setEvent(this.calendarService.getEvent(event_id));

			// System.out.println(eventAttendee.getEvent().getId());

			eventAttendee.setAttendee(user);
			this.calendarService.createEventAttendee(eventAttendee);

			for (int i = 0; i < temp_events.size(); i++) {
				if (user.getId() != temp_events.get(i).getOwner().getId()) {
					events.add(temp_events.get(i));
				}
			}

		}
		model.addAttribute("events", events);
		return "showAllevents";
	}

	@RequestMapping(value = "/eventDeleteSuccess")
	public String processEventDelete(Model model, HttpServletRequest request) {

		int event_id = Integer.parseInt(request.getParameter("event_id"));
		Event tempEv = this.calendarService.getEvent(event_id);
		this.calendarService.deleteEvent(tempEv);

		List<Event> temp_events = this.calendarService.getAllEvents();
		List<Event> events = new ArrayList<Event>();

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			CalendarUser user = this.calendarService.getUserByEmail(userDetail
					.getUsername());

			for (int i = 0; i < temp_events.size(); i++) {
				if (user.getId() != temp_events.get(i).getOwner().getId()) {
					events.add(temp_events.get(i));
				}
			}

		}

		model.addAttribute("events", events);
		return "showAllevents";
	}

}
