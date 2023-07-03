package com.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {

	public CookieManager() {

	}
	// 이름, 값, 유지시간을 매개변수로 받아서 쿠키 생성 후 응답 객체에 담기
	// void -> return 없기 때문에 응답객체에 담기
	public static void makeCookie(HttpServletResponse response,
			String cname, String cValue, int cTime) {
		// 쿠키 생성
		Cookie cookie = new Cookie(cname, cValue);
		// 경로 설정
		cookie.setPath("/");
		// 유지 기간 설정
		cookie.setMaxAge(cTime);
		// 응답객체 추가
		response.addCookie(cookie);
	}
	
	
	// 쿠키 이름을 받아서 쿠키 값을 반환
	public static String readCookie(HttpServletRequest request,
				String cName) {
		
		System.out.println("test");
		String cookieValue = "";
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			// 쿠키 배열을 돌면서 일치하는 이름을 찾아 값을 반환
			for(Cookie cookie : cookies) {
				String cookieName = cookie.getName();
				if(cName.equals(cookieName)) {
					cookieValue = cookie.getValue();
					break;
				}
			}
		}
		
		return cookieValue;
	}

	
	// 쿠키이름을 매개변수로 받아서 쿠키 삭제
	public static void deleteCookie(HttpServletResponse response, String cName) {
		// 시간을 0으로 설정
		makeCookie(response, cName, "", 0);
	}
}
