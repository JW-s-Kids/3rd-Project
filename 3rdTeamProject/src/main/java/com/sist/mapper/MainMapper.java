package com.sist.mapper;

import org.apache.ibatis.annotations.Select;
import com.sist.dao.*;
import java.util.*;

public interface MainMapper {
	
	// 메인페이지 (여행지) ===============================================================================================
	@Select("SELECT * FROM tour WHERE tno IN (3, 5, 6, 13, 18)")
	public List<TourVO> getTourList();
	
	
	
	// 메인페이지 (반려동물 산책코스) ============================================================================================
	@Select("SELECT * FROM park WHERE no IN (1, 2, 5, 6, 7)")
	public List<DogVO> getParkList();
	
	
	// 메인페이지 (여행기) ============================================================================================
	@Select("SELECT * FROM diary WHERE no <= 4")
	public List<DiaryVO> getDiaryList();
	
	
	// 메인페이지 (맛집순례) ====================================================================================================
	@Select("SELECT * FROM kfood WHERE kf_no <= 4")
	public List<KFoodVO> getKFoodList();
	
	
}
