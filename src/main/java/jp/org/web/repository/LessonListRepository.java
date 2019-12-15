package jp.org.web.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import jp.org.web.form.LessonListForm;

@Component
public interface LessonListRepository {
	@Select("select * from samurai_lessonlist")
	List<LessonListForm> getLessonListMap();
	
	@Select("select * from samurai_lessonlist where userId=#{id}")
	LessonListForm getLessonListOne(@Param("id") String userId);

	@Insert("insert into samurai_lessonlist values(#{userId}, #{userFirstName}, #{userLastName}, #{lesson1st}, #{lesson2nd})")
	void insert(@Param("userId") String userId
			,@Param("userFirstName") String userFirstName
			,@Param("userLastName") String userLastName
			,@Param("lesson1st") String lesson1st
			,@Param("lesson2nd") String lesson2nd);
	
	@Update("update samurai_lessonlist set userFirstName = #{userFirstName}"
										+ ", userLastName = #{userLastName}"
										+ ", lesson1st = #{lesson1st}"
										+ ", lesson2nd = #{lesson2nd}"
										+ " where userId = #{userId}")
	void update(@Param("userFirstName") String userFirstName
					,@Param("userLastName") String userLastName
					,@Param("lesson1st") String lesson1st
					,@Param("lesson2nd") String lesson2nd
					,@Param("userId") String userId);

	@Delete("delete from samurai_lessonlist where userId=#{id}")
	void delete(@Param("id") String userId);

}
