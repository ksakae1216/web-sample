package jp.org.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jp.org.web.form.LoginForm;
import jp.org.web.repository.LoginRepository;


/**
 * Handles requests for the application home page.
 */
@Controller
public class ListController {
	
	private static final Logger logger = LoggerFactory.getLogger(ListController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/01_list/list", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("List screen display");
		
		List<LoginForm> listList = new ArrayList<>();
		LoginForm loginForm = new LoginForm();
		LoginForm loginForm2 = new LoginForm();
		loginForm.setLoginId("sakae");
		loginForm.setPassword("pass");
		loginForm2.setLoginId("hogehoge");
		loginForm2.setPassword("fumufumu");

		listList.add(loginForm);
		listList.add(loginForm2);
		
		model.addAttribute("listForms", listList);
		
		return "01_list/list";
	}

}