package com.ABCJobsPortal.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ABCJobsPortal.model.UserDetails;
import com.ABCJobsPortal.model.Users;
import com.ABCJobsPortal.service.UserDetailsService;
import com.ABCJobsPortal.service.UsersService;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Controller
public class AuthController {
	@Autowired
	private UsersService us;

	@Autowired
	private UserDetailsService ud;

	@RequestMapping(value="/registration")
	public ModelAndView registration(HttpSession session) throws Exception {
		return new ModelAndView("registration/registration"); 
	}

	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) throws Exception {
		session.invalidate();
		return new ModelAndView("login/login");
	}
	
	@RequestMapping(value="/registration", method = RequestMethod.POST)
	public String registration(
	        @RequestParam("email") String email,
	        @RequestParam("password") String password,
	        @RequestParam("firstName") String firstName,
	        @RequestParam("lastName") String lastName,
	        Users user, UserDetails userDetails, Model model) throws Exception {
	    try {
	        // Hash the password using bcrypt
	        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	        String hashedPassword = passwordEncoder.encode(password);

	        user.setEmail(email);
	        user.setPassword(hashedPassword); // Store the hashed password
	        user.setRoleId("2");
	        user.setEmailVerifiedAt(java.time.LocalDate.now().toString());
	        user.setCreatedAt(java.time.LocalDate.now().toString());
	        us.register(user);

	        userDetails.setUserId(us.getLastUser().split(",")[0]);
	        userDetails.setFirstName(firstName);
	        userDetails.setLastName(lastName);
	        ud.register(userDetails);

	        model.addAttribute("email", user.getEmail());
	        return "registration/thankyou";
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    model.addAttribute("errMsg", "Email has already taken");
	    return "registration/registration";
	}
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public ModelAndView login(HttpSession session) throws Exception {
		return new ModelAndView("login/login"); 
	}
	
	
	@RequestMapping(value="/login", method = RequestMethod.POST) // login process
	public ModelAndView login(
	        @ModelAttribute("login") Users user, Model model,
	        HttpServletRequest req, HttpServletResponse res) {

	    String rememberMe = req.getParameter("rememberMe");
	    HttpSession session = req.getSession();

	    Users storedUser = us.getByEmail(user.getEmail()); // Retrieve the user by email from the database

	    if (storedUser != null) {
	        // Use BCryptPasswordEncoder to verify the provided password against the stored hashed password
	        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	        if (passwordEncoder.matches(user.getPassword(), storedUser.getPassword())) {
	            // Password matches, user is authenticated
	            if (rememberMe != null) { // remember me checked
	                Cookie eCookie = new Cookie("email", storedUser.getEmail());
	                eCookie.setMaxAge(10 * 60); // 10 minutes
	                res.addCookie(eCookie);

	                Cookie iCookie = new Cookie("userId", String.valueOf(storedUser.getUserId()));
	                iCookie.setMaxAge(10 * 60);
	                res.addCookie(iCookie);
	            }

	            session.setAttribute("email", storedUser.getEmail());
	            session.setAttribute("userId", storedUser.getUserId());
	            session.setAttribute("roleId", storedUser.getRoleId());
	            session.setAttribute("isLogin", true);
	            
	            if (storedUser.getUserId() == 1) {
	                return new ModelAndView("redirect:/admin"); // Redirect to admin page
	            } else {
	                return new ModelAndView("redirect:/dashboard"); // Redirect to dashboard page
	            }
	        }
	    }

	    String msg = "Credentials are incorrect!";
	    model.addAttribute("message", msg);
	    return new ModelAndView("login/login");
	}


	
	
	@RequestMapping(value="/forgot-password")
	public ModelAndView forgotPassword(HttpServletResponse res) throws Exception {
		return new ModelAndView("login/forgot-password");  
	}
	
	@RequestMapping(value="/forgot-password", method = RequestMethod.POST) // forgot password logic
	public String forgotPassword(@RequestParam("emailAddress") String email, Model model, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		String checkEmail = us.checkEmail(email);
		
		if(checkEmail != null) {
			session.setAttribute("isReset", true);
			session.setAttribute("email", email);
			return "login/reset-password";
		}
				
		String msg = "Email not found, Please try again.";
		model.addAttribute("message", msg);
		return "login/forgot-password";
	}

	@RequestMapping(value="/reset")
	public ModelAndView reset(Model model, HttpSession session) throws Exception {
		if((Boolean) session.getAttribute("isReset")) {
			return new ModelAndView("login/reset-password");  
		}
	
		String msg = "Email required";
		model.addAttribute("message", msg);
		return new ModelAndView("login/forgot-password"); 
	}
	
	@RequestMapping(value = "/password-confirmation")
	public ModelAndView reset(HttpSession session) throws Exception {
		return new ModelAndView("login/password-confirmation");
	}
	
    @RequestMapping(value="/reset", method = RequestMethod.POST) // reset password
    public String reset(@RequestParam("password") String password, Model model, HttpSession session) throws Exception {
        try {
            // Hash the new password using bcrypt
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            String hashedPassword = passwordEncoder.encode(password);

            // Update the hashed password in the database
            us.updatePassword(hashedPassword, (String) session.getAttribute("email"));

            String msg = "Password has been changed";
            model.addAttribute("scMessage", msg);
            session.invalidate();
        } catch (Exception e) {
            System.out.println(e);
            return "login/password-confirmation";
        }

        return "login/password-confirmation";
    }

}
