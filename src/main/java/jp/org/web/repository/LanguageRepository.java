package jp.org.web.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import jp.org.web.form.LanguageForm;
import jp.org.web.form.LessonListForm;

@Component
public interface LanguageRepository {
	@Select("select * from samurai_language")
	List<LanguageForm> getLanguageList();
}

