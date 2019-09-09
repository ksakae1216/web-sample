package jp.org.web.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jp.org.web.form.LessonListForm;
import jp.org.web.form.LoginForm;
import jp.org.web.repository.LoginRepository;


/**
 * Handles requests for the application home page.
 */
@Controller
public class UpdateController {
	
	private static final Logger logger = LoggerFactory.getLogger(UpdateController.class);
	
	@Autowired
	private LoginRepository loginRepository;
	
	@ModelAttribute
	public LoginForm setLoginForm() {
		LoginForm loginForm = new LoginForm();
		return loginForm;
	}
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/02_update/update/{id}", method = RequestMethod.GET)
	public String home(Locale locale, Model model, @PathVariable String id) {
		logger.info("Update screen display");
		logger.info("userId -> " + id);
		
		LessonListForm listForm = new LessonListForm(); 
		listForm.setUserId(id);
		model.addAttribute("lessonListForm", listForm);
		
		return "/02_update/update";
	}


}