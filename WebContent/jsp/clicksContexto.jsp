<%@page import="modelo.ClickContexto"%>
<%@page import="modelo.Click"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert titulaso here</title>
<style type="text/css">
	.sesion {
		background-color: green;
	}
</style>
</head>
<body>
	<p>Clicks contexto y sesión <b><%=session.getId()%></b></p>
	<table border="1">
		<tr>
			<td colspan="2">Sesion</td>
			<td colspan="3">Contexto</td>
		</tr>
		<tr>
			<td>Contador</td>
			<td>Fecha/Hora</td>
			<td>ID Sesion</td>
			<td>Contador</td>
			<td>Fecha/Hora Contexto</td>
		</tr>
		<% 	
			//Compruebo los tamaños
			ArrayList<Click> clicksSesion = (ArrayList<Click>) session.getAttribute("clicks");
			ArrayList<ClickContexto> clicksContexto = (ArrayList<ClickContexto>) application.getAttribute("clicks");
			
		
			for(int i=0; i<clicksContexto.size(); i++)
			{
				String s_contador;
				String s_fecha;
				String idSesion;
				int c_contador;
				Date c_fecha;
				
				if(i<clicksSesion.size()){
					s_contador = clicksSesion.get(i).getContador().toString();
					s_fecha = clicksSesion.get(i).getFechaHora().toString();
				}
				else{
					s_contador="";
					s_fecha="";
				}
				idSesion = clicksContexto.get(i).getIdSesion();
				c_contador = clicksContexto.get(i).getClick().getContador().getContador();
				c_fecha = clicksContexto.get(i).getClick().getFechaHora();
				
			
			
		%>
		<tr>
			<td><%=s_contador%></td>
			<td><%=s_fecha%></td>
			
			<%-- 
				//AHORRAMOS LINEAS
				String clase;
				if(session.getId().equals(idSesion)
				{
					clase ="class=\"sesion\"";
				}
				else{
					clase = "";
				}
				
			--%>
			<% if(session.getId().equals(idSesion))
			{%>
				<td class="sesion"><%=idSesion%></td>
				<td class="sesion"><%=c_contador%></td>
				<td class="sesion"><%=c_fecha%></td>
			<%}
			else{%>
				<td><%=idSesion%></td>
				<td><%=c_contador%></td>
				<td><%=c_fecha%></td>
			<%}
			%>
			
		</tr>
		<%
			}
		%>	
	</table>
	<br/>
	<!--  CORRECTO -->
	<%--  <table border="1">
		<tr>
			<td colspan="2">Contexto</td>
		</tr>
		<tr>
			<td>ID Sesion</td>
			<td>Contador</td>
		</tr>
		<% 	
			ArrayList<ClickContexto> clicksContexto = (ArrayList<ClickContexto>) application.getAttribute("clicks");
			
			for(int i=0; i<clicksContexto.size(); i++)
			{ %>
				<tr>
					<td><%=clicksContexto.get(i).getIdSesion()%></td>
					<td><%=clicksContexto.get(i).getClick().toString()%></td>
				</tr>
			<%}
		%>
	</table> --%>
</body>
</html>