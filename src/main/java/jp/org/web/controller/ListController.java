package jp.org.web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jp.org.web.form.LessonListForm;
import jp.org.web.repository.LessonListRepository;


/**
 * Handles requests for the application home page.
 */
@Controller
public class ListController {
	
	private static final Logger logger = LoggerFactory.getLogger(ListController.class);
	
	@Autowired
	private LessonListRepository repository;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/01_list/list", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("List screen display");
		
		List<LessonListForm> lessonListForm = repository.getLessonListMap();
		model.addAttribute("lessonList", lessonListForm);
		
		return "/01_list/list";
	}

	@RequestMapping(value = "/01_list/list", params="logout", method = RequestMethod.POST)
	public String doLogout(Model model) {
		logger.info("Do logout and transfer login screen");
		
		return "redirect:/login";
	}

	@RequestMapping(value = "/01_list/list", params="addRow", method = RequestMethod.POST)
	public String doAddRow(Model model) {
		logger.info("Do transfer update screen and add row");
		
		return "redirect:/02_update/update/addRow";
	}

}