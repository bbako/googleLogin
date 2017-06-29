package org.cg.controller;

import org.apache.log4j.Logger;
import org.cg.domain.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/gglog")
public class GglogController {
	
	private static final Logger logger = Logger.getLogger(GglogController.class);

	@GetMapping()
	public void gglog() {

	}

	@RequestMapping(value="/check", method=RequestMethod.POST) 
	@ResponseBody
	public UserVO test2(UserVO vo) { 
		
		logger.info("포스트 들옴");
		logger.info(vo); 
		

	return vo;
	}
	

}
