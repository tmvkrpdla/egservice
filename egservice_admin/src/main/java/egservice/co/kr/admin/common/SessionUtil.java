package egservice.co.kr.admin.common;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

public class SessionUtil {

	public static boolean isNull(HttpSession session, String sessionName) {
		boolean check = true;
		
		if(! (session.getAttribute(sessionName)==null)) {
			check = false;
		}
		
		
		return check;
		
	}
	
	public static boolean isNull(HttpSession session, String sessionName, String target) {
		boolean check = true;
		
		HashMap<String, Object> sessionMap = getSessionMap(session, sessionName);
		
		if( ! (sessionMap.get(target) == null) ) {
			
			check = false;
		}
		
		return check;
		
	}
	
	
	public static String getString(HttpSession session, String sessionName, String target) {
		//HashMap<String, Object> sessionMap = (HashMap<String, Object>) session.getAttribute(sessionName);
		HashMap<String, Object> sessionMap = getSessionMap(session, sessionName);
		return String.valueOf(sessionMap.get(target));
	}
	
	
	public static HashMap<String, Object> getSessionMap(HttpSession session, String sessionName){
		return (HashMap<String, Object>) session.getAttribute(sessionName);
	}

	public static void setString(HttpSession session, String sessionName, String key, String data) {
		HashMap<String, Object> sessionMap = getSessionMap(session, sessionName);
		
		sessionMap.put(key, data);		
		
		System.out.println(sessionMap.toString());
		
		session.setAttribute(sessionName, sessionMap);
	}
	
}
