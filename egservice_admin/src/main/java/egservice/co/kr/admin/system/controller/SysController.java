package egservice.co.kr.admin.system.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sys")
public class SysController {
	
	public static final Logger logger = LoggerFactory.getLogger(SysController.class);
	
	
	@RequestMapping("/home")
	public void sysHome() throws Exception{
		System.out.println("!");
	}

}
