package com.hk.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	
	@Autowired
	 BoardService boardService;
	
	//RequestMapping --> GetMapping , PostMapping
	@GetMapping("/")
	@ResponseBody
	public String home() {
		return "home"; //home.jsp를 WEB-INF에서 찾아서 실행
	}
	
	@GetMapping("/list")
	   public String boardList(Model model) { 
	      List<ArticleVO> articlesList = boardService.listArticles();
	      model.addAttribute("articlesList",articlesList);
	      return "boardList";
	   }
}
