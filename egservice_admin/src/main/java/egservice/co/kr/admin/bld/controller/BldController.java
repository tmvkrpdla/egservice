package egservice.co.kr.admin.bld.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egservice.co.kr.admin.common.SessionUtil;

@Controller
@RequestMapping("/bld")
public class BldController {

	private static final Logger logger = LoggerFactory.getLogger(BldController.class);

	// 대쉬보드 홈
	@RequestMapping("/home")
	public String home(HttpSession session, @RequestParam(value = "mainMenu", defaultValue = "home") String mainMenu,
			Model model) throws Exception {
		String moveUrl = "redirect:../";

		if (!SessionUtil.isNull(session, "ADMIN")) {

			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if ("4".equals(team_type)) { // 건물
				moveUrl = "bld/main/home";

				model.addAttribute("mainMenu", mainMenu);

			}

		}

		return moveUrl;
	}

}