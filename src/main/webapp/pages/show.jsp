<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="UTF-8">
    <title>Show.jsp</title>
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
  </head>
	<body class="container"> 
	 
	 	<div>
			<h1 style="color:red;float: left;">【Server 1】</h1>
			<form action="<%=request.getContextPath()%>/LoginServlet" method="post" style="float: right;">
				 <input type="submit" value="登出" class="btn btn-warning btn-lg"/>
				 <input type="hidden" name="userAction" value="doLogout"/>
			</form>
	 	</div>
		
		<br/>
	    <p style="clear: both;">輸出session中的值:</p>  
	    <%  
		    if (request.getSession().getAttribute("isLogin") == null) {  
		        response.sendRedirect(request.getContextPath() + "/login.jsp");  
		    }  
		%>  
		
		<div class="container">
		    <%  
		        java.util.Enumeration keys = session.getAttributeNames();
		        out.println("<table class='table table-striped table-hover' style='border: 1px solid black;'>");
		        out.println("<thead>" + 
		         				"<tr style='background-color:#0072e3;color:#e0e0e0;'><th>session key</th><th>session Value</th></tr>" +
		        			"</thead>");
				while (keys.hasMoreElements()){
					String key = (String) keys.nextElement();
					out.println( "<tr>" +
									"<td>" + "session.getValue( \"" + key +"\" )" + "</td>" + "<td>" + session.getValue(key) + "</td>" +
								 "</tr>" );
				}
				out.println("</table>");
		    %>  
		</div>
		
	    <hr style="background-color:black; height:10px"/>
	    
	    <p>此session相關屬性：</p>  
	    <table class="table table-sm table-hover" style='border: 1px solid black;'>
	    	<thead>
	    		<tr style='background-color:#408080; color:	#e0e0e0;'><th>屬性名稱</th><th>屬性值</th></tr>
	    	</thead>
	    	<tbody>
	    		<tr>
	    			<td>jsessionId</td><td style="color:green;"><%=session.getId()%></td>
				</tr>	
				<tr>    
	    			<td>request.getRemoteAddr()</td><td><%=request.getRemoteAddr()%></td>
				</tr>			
				<tr>    
	    			<td>request.getRemotePort()</td><td><%=request.getRemotePort()%></td>
				</tr>			
				<tr>    
	    			<td>request.getRemoteHost()</td><td><%=request.getRemoteHost()%></td>
				</tr>			
				<tr>    
	    			<td>request.getRemoteUser()</td><td><%=request.getRemoteUser()%></td>
				</tr>			
				<tr>    
	    			<td>request.getHeader("X-Real-IP")</td><td><%=request.getHeader("X-Real-IP")%></td>
				</tr>			
				<tr>    
	    			<td>request.getHeader("Host")</td><td><%=request.getHeader("Host")%></td>
				</tr>			
				<tr>    
	    			<td>request.getHeader("X-Forwarded-For")</td><td><%=request.getHeader("X-Forwarded-For")%></td>
				</tr>			
				<tr>    
	    			<td>request.getLocalPort()</td><td style="color:red;"><%=request.getLocalPort()%></td>
				</tr>			
	    	</tbody>
	    </table>
	</body> 
</html>
