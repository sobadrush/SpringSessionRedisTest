package com.ctbc.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private RedisTemplate<String, Object> redisTemplate;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,
				config.getServletContext());
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		request.setCharacterEncoding("UTF-8");

		System.out.println("redisTemplate >>> " + redisTemplate);
		
//		System.out.println(redisTemplate.getClientList());
		
		Set<byte[]> keys = redisTemplate.getConnectionFactory().getConnection().keys("*".getBytes());
		Iterator<byte[]> it = keys.iterator();
		while(it.hasNext()){
		    byte[] data = (byte[])it.next();
		    System.out.println(new String(data, 0, data.length));
		}
		
		String userAction = request.getParameter("userAction");
		if ("doLogin".equals(userAction)) {
			String loginName = request.getParameter("loginName");
			String password = request.getParameter("password");
			// ================= 驗證登入==================
			if ("驗證通過".equals("驗證通過")) {
				HttpSession session = request.getSession();
				session.setAttribute("isLogin", "yes");
				session.setAttribute("loginName", loginName);
				session.setAttribute("password", password);
				response.sendRedirect(request.getContextPath() + "/pages/show.html");
			}
			// ============================================
			return;
		} else if ("doLogout".equals(userAction)) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/login.html");
			return;
		}

	}
}
