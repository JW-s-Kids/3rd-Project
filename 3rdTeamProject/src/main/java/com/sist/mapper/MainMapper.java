package com.sist.mapper;

import org.apache.ibatis.annotations.Select;
import com.sist.dao.*;
import java.util.*;

public interface MainMapper {
	
	// 메인페이지 (여행지) ===============================================================================================
	@Select("SELECT * FROM tour WHERE tno IN (3, 5, 6, 13, 18)")
	public List<TourVO> getTourList();
}
