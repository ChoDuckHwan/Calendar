package com.mycompany.myapp.web.controller;


import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.domain.CalendarUser;
import com.mycompany.myapp.service.CalendarService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/users")
public class UserController {
	@Autowired
	@Qualifier("calendarService")
	private CalendarService calendarService;	

	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error, 
								@RequestParam(value = "logout", required = false) String logout,
								ModelAndView model) {
	  
	  if (error != null) {
		  model.addObject("error", "Invalid username and password!");
	  }
 
	  if (logout != null) {
		  model.addObject("msg", "You've been logged out successfully.");
	  }
	  model.setViewName("signin");
 
	  return model;
 
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String viewRegistration(Model model) {
		CalendarUser userForm = new CalendarUser();    
        model.addAttribute("userForm", userForm);
         
        List<String> professionList = new ArrayList<String>();
        professionList.add("Developer");
        professionList.add("Designer");
        professionList.add("IT Manager");
        model.addAttribute("professionList", professionList);
        
        return "register/signup";
    }
     
	
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute("userForm") CalendarUser user, Model model) {
         
        this.calendarService.createUser(user);
       
        // for testing purpose:
        System.out.println("email: " + user.getEmail());
        System.out.println("password: " + user.getPassword());
        System.out.println("name: " + user.getName());
        System.out.println("profession: " + user.getProfession());
        
        return "register/signupSuccess";
    }
    @RequestMapping(value = "/updateUser", method = RequestMethod.GET)
    public String updateUser(Model model) {
		CalendarUser updateuserForm = new CalendarUser();    
		model.addAttribute("updateuserForm", updateuserForm);
        
		 List<String> professionList = new ArrayList<String>();
	        professionList.add("Developer");
	        professionList.add("Designer");
	        professionList.add("IT Manager");
	        model.addAttribute("professionList", professionList);
		
        return "updateUser";
    }
    @RequestMapping(value = "/updateUserSuccess", method = RequestMethod.POST)
    public String updateUserSuccess(@ModelAttribute("updateuserForm") CalendarUser user, Model model) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        
        if (!(auth instanceof AnonymousAuthenticationToken)) {
         UserDetails userDetail = (UserDetails) auth.getPrincipal();
         	user.setId(this.calendarService.getUserByEmail(userDetail.getUsername()).getId());
         	//System.out.println(user.getId());
        }
         this.calendarService.updateUser(user);       
              
        return "updateUserSuccess";
    }
	
}
