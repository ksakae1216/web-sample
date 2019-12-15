package jp.org.web.controller;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.*;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Optional;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jp.org.web.form.LanguageForm;
import jp.org.web.form.LessonListForm;
import jp.org.web.repository.LanguageRepository;
import jp.org.web.repository.LessonListRepository;
import jp.org.web.util.PrepareLessonList;

public class UpdateControllerTest {

	private static final Logger logger = LoggerFactory.getLogger(UpdateControllerTest.class);

	@InjectMocks
	private UpdateController updateController;

	@Mock
	private LessonListRepository lessonListRepository;

	@Mock
	private LanguageRepository languageRepository;

	private Locale locale;

	@Mock
	private Model model;

	private List<LessonListForm> lessonFormList;

	private List<LanguageForm> languageForm;

	@Before
	public void setUp() {
		// おまじない
		initMocks(this);

		lessonFormList = PrepareLessonList.setupLessonList();

		languageForm = new ArrayList<>();

		LanguageForm lForm1 = new LanguageForm();
		LanguageForm lForm2 = new LanguageForm();

		lForm1.setLanguage("Java");
		lForm1.setInformation("Javaの情報");
		lForm2.setLanguage("Go");
		lForm2.setInformation("Goの情報");

		languageForm.add(lForm1);
		languageForm.add(lForm2);
	}

	@Test
	public void testHome() {
		logger.info("Start testHome");

		String userId = "001";

		Optional<LessonListForm> getLessonListForm = PrepareLessonList.getListFromId(lessonFormList, userId);

		if (!getLessonListForm.isPresent()) {
			fail(userId + " is not found in lesson list.");
		}

		when(lessonListRepository.getLessonListOne(userId)).thenReturn(getLessonListForm.get());
		when(languageRepository.getlanguage()).thenReturn(languageForm);

		assertThat(updateController.home(locale, model, userId), is("/02_update/update"));

		logger.info("End testHome");
	}

	@Test
	public void testInitNewRow() {
		logger.info("Start testInitNewRow");

		assertThat(updateController.initNewRow(locale, model), is("/02_update/update"));

		logger.info("End testInitNewRow");
	}

	@Test
	public void testGetInformation() throws JsonMappingException, JsonProcessingException {
		logger.info("Start testGetInformation");

		when(languageRepository.getlanguageInfo("Java")).thenReturn(languageForm.get(0));

		assertThat(updateController.getInformation("Java"), is("{\"language\":\"Java\",\"information\":\"Javaの情報\"}"));
		
		logger.info("End testGetInformation");
	}

	@Test
	public void testUpdateData_Delete() {
		logger.info("Start testUpdateData Delete");
		
		RedirectAttributes attr = org.mockito.Mockito.mock(RedirectAttributes.class);

		lessonFormList.get(0).setDeleteFlg(true);
		lessonFormList.get(0).setInsertFlg(false);

		assertThat(updateController.updateData("001", model, lessonFormList.get(0), attr), is("redirect:/01_list/list"));
		// assertThat(lessonFormList.size(), is(1));
		
		logger.info("End testUpdateData Delete");
	}

	@Test
	public void testUpdateData_Insert() {
		logger.info("Start testUpdateData Insert");
		
		RedirectAttributes attr = org.mockito.Mockito.mock(RedirectAttributes.class);

		lessonFormList.get(0).setDeleteFlg(false);
		lessonFormList.get(0).setInsertFlg(true);

		assertThat(updateController.updateData("001", model, lessonFormList.get(0), attr), is("redirect:/01_list/list"));
		
		logger.info("End testUpdateData Insert");
	}

	@Test
	public void testUpdateData_Update() {
		logger.info("Start testUpdateData Update");
		
		RedirectAttributes attr = org.mockito.Mockito.mock(RedirectAttributes.class);

		lessonFormList.get(0).setDeleteFlg(false);
		lessonFormList.get(0).setInsertFlg(false);

		assertThat(updateController.updateData("001", model, lessonFormList.get(0), attr), is("redirect:/01_list/list"));
		
		logger.info("End testUpdateData Update");
	}

}
