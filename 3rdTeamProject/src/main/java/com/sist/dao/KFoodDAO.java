package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.KFoodMapper;
@Repository
public class KFoodDAO {
     @Autowired
     private KFoodMapper mapper;
    public List<KFoodVO> kfoodAllData()
    {
   	 return mapper.kfoodAllData();
    }
    
 //    public List<KFoodVO> kfoodCategoryListData(int kf_no)
//     {
//    	 return mapper.kfoodCategoryListData(kf_no);
//     }
//     public KFoodVO kfoodCategoryInfoData(int kf_no)
//    {
//    	 return mapper.kfoodCategoryInfoData(kf_no);
//     }
     public KFoodVO kfoodListData(int kf_no)
     {
    	 return mapper.kfoodListData(kf_no);
     }
//     public List<RecipeVO> foodLikeRecipeData(String finddata)
//     {
//    	 return mapper.foodLikeRecipeData(finddata);
//     }
//     public List<FoodVO> foodLocationFindData(String gu)
//     {
 //   	 return mapper.foodLocationFindData(gu);
 //    }
     public List<KFoodVO> kfoodTop10()
     {
    	 return mapper.kfoodTop10();
     }
 //    public List<RecipeVO> recipeTop10()
 //    {
 //   	 return mapper.recipeTop10();
 //    }
}