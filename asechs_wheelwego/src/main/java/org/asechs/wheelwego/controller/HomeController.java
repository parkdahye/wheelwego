package org.asechs.wheelwego.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class HomeController {
	/*
	 * @PathVariable  어노테이션 
	 * : 요청 url 정보를 변수로 할당받기 위한 어노테이션 
	 * 요청 url과 일치하는 url 매핑 메서드가 존재하면 그 메서드가 
	 * 우선적으로 실행되고 
	 * 존재하지 않으면 @PathVariable 메서드가 실행된다 
	 */
	@RequestMapping("{viewName}.do")
	public String showView(@PathVariable String viewName){
		//System.out.println("@PathVariable:"+viewName);
		return viewName+".tiles";
	}
	@RequestMapping("{dirName}/{viewName}.do")
	public String showView(@PathVariable String dirName,
			@PathVariable String viewName){
		//System.out.println("@PathVariable:"+dirName+"/"+viewName);
		return dirName+"/"+viewName+".tiles";
	}
}
