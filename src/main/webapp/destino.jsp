<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="FIFA22.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Destino</title>
</head>
<body>
<%
String cadena = request.getParameter("cadena");
String cod_jugador = request.getParameter("cod_jugador");
String cod_equipo = request.getParameter("cod_equipo");
String cod_liga = request.getParameter("cod_liga");
BDController bdcontroller = new BDController();
Jugador player = bdcontroller.dameJugador(Integer.parseInt(cod_jugador));
Equipo equipo = bdcontroller.dameEquipo(Integer.parseInt(cod_equipo));
Liga liga = bdcontroller.dameLiga(Integer.parseInt(cod_liga));
%>
<h1>Esto lo hago en la pagina destino</h1>
<p><%out.print(player.getNombre()); %></p>
<p><%out.print(equipo.getNombre()); %></p>
<p><%out.print(liga.getNombre()); %></p>
<p><%out.print(cadena); %></p>
</body>
</html>