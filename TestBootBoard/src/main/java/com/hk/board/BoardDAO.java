package com.hk.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {
	List<ArticleVO> selectAllArticleList();
}
