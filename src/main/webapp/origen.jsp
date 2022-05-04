<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Origen</title>
</head>
<body>
<%
String cadena ="La frase del día";
int cod_jugador =35;
int cod_equipo = 23;
int cod_liga =2;
%>
<a href="destino.jsp?variable1=<%out.print(cod_jugador); %>">enlace a la página destino</a>
<a href="destino.jsp?cadena=<%=cadena%>&cod_jugador=<%=cod_jugador%>&cod_equipo=<%=cod_equipo%>&cod_liga=<%=cod_liga%>">enlace con multiples parametros</a>
</body>
</html>