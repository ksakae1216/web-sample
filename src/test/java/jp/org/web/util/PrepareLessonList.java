package jp.org.web.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import jp.org.web.form.LessonListForm;

public class PrepareLessonList {

	public static List<LessonListForm> setupLessonList() {
        //lessonListテーブルの準備
        LessonListForm listForm1 = new LessonListForm();
        listForm1.setUserId("001");
        listForm1.setUserFirstName("taro");
        listForm1.setUserLastName("Yamada");
        listForm1.setLesson1st("Java");
        listForm1.setInformation1st("Javaの情報");
        listForm1.setLesson2nd("Go");
        listForm1.setInformation2nd("Goの情報");

        LessonListForm listForm2 = new LessonListForm();
        listForm2.setUserId("002");
        listForm2.setUserFirstName("jiro");
        listForm2.setUserLastName("Yamada");
        listForm2.setLesson1st("PHP");
        listForm2.setInformation1st("PHPの情報");
        listForm2.setLesson2nd("Angular");
        listForm2.setInformation2nd("Angularの情報");

        List<LessonListForm> lessonListFormList = new ArrayList<>();
        lessonListFormList.add(listForm1);
        lessonListFormList.add(listForm2);
        
        return lessonListFormList;
	}
	
	public static Optional<LessonListForm> getListFromId(List<LessonListForm> lessonListFormList, String userId) {
		return lessonListFormList.stream().filter(x -> x.getUserId().equals(userId)).findFirst();
	}

}
