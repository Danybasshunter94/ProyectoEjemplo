<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.Contador" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 
	
	//Usando los objetos implicitos de JSP session, request, response, out. Son parecidos a los del Servlet
	if(session.getAttribute("contador") == null){
		session.setAttribute("contador", new Contador());
		out.println("Creando variable de sesión contador");
	}
	else {
		out.println("Creada la variable de sesión contador");	
	}
	
	Contador contador = (Contador) session.getAttribute("contador");
	contador.setContador(contador.getContador() + 1);
	out.write("<p> id Sesion = "+ session.getId() + "</p><p>contador = " + contador.getContador() + "</p>" );
		
	%>
</body>
</html>