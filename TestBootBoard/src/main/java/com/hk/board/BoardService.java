package com.hk.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	@Autowired
	   BoardDAO boardDAO;

	   public List<ArticleVO> listArticles() {
	      // TODO Auto-generated method stub
	      
	      return boardDAO.selectAllArticleList();
	   }
}
