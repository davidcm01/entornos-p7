<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="FIFA22.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="assets/css/main.css" />
<title>Insert title here</title>
</head>
<body class="is-preload">
		<div id="page-wrapper">
			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="index.jsp" id="logo">FIFA22</a></a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="index.jsp">Inicio</a></li>
								<li>
									<a href="#">Listados</a>
									<ul>
										<li><a href="ligas.jsp">Opci�n 1</a></li>
										
									</ul>
								</li>
								<li>
									<a href="#">Operaciones</a>
									<ul>
										<li>
											<a href="#">Opci�n 1</a>
											<ul>
												<li><a href="altajugador.jsp">Opci�n 1</a></li>
												
											</ul>
										</li>
										<li>
											<a href="#">Opci�n 2</a>
											<ul>
												<li><a href="#">Opci�n 1</a></li>
												
											</ul>
										</li>
										<li>
											<a href="#">Opci�n 3</a>
											<ul>
												<li><a href="#">Opci�n 1</a></li>
												
											</ul>
										</li>
										<li>
											<a href="#">Opci�n 4</a>
											<ul>
												<li><a href="#">Opci�n 1</a></li>
												
											</ul>
										</li>
									</ul>
								</li>
								<li ><a href="#">Simulador</a>
									<ul>
										<li><a href="creador.jsp">Opci�n 1</a></li>
									</ul>
								</li>
							</ul>
						</nav>

				</div>

			<!-- Main -->
				<section class="wrapper style1">
					<div class="container">
						<div id="content">

							<!-- Content -->
							
								<article>
									<header>
									<%BDController bdcontroller = new BDController();
									int codigoLiga = Integer.parseInt(request.getParameter("cod_liga"));
									ArrayList<Equipo> equipos = bdcontroller.dameEquiposLIga(codigoLiga);
									Liga liga = bdcontroller.dameLiga(codigoLiga);%>
										<h2><%out.print(liga.getNombre()); %></h2>
									</header>
									
									<div class="table-wrapper">
								<table class="alt">
									<thead>
										<tr>
											<th>Nombre</th>
											<th width='195' colspan="3"></th>
											<th colspan="19">Equipos</th>
											
										</tr>
									</thead>
										<%
									for(int i =0;i<equipos.size();i++){
										
										ArrayList<Jugador> jugadores = bdcontroller.todosJugadoresEquipo(equipos.get(i).getCod_equipo());
									%>
									<tbody>
									
										<tr>
											<td width='60' rowspan="2"><a href="Equipo.jsp?cod_equipo=<%out.print(equipos.get(i).getCod_equipo());%>" title="<%out.print(equipos.get(i).getNombre());%>"><img width="70"  src="images/equipos/<% out.print(equipos.get(i).getCod_equipo());%>.png"></img></a></td>
											<td width='300' colspan="3" style="padding-left: 15px;"><% out.print(equipos.get(i).getNombre());%></td>
											<% for(int j =0;j<jugadores.size();j++){%>
											<td rowspan="2" width='60' style="text-align: center;"><a href="Jugador.jsp?cod_jugador=<%out.print(jugadores.get(j).getCod_jugador());%>&nombre_carta=SIMPLE"><img width="70"  src="images/jugadores/<% out.print(jugadores.get(j).getCod_jugador());%>.png" title="<%out.print(jugadores.get(j).getNombre());%>"></img></a></td>	
											<%}%>	
										</tr>
										<tr>
										  
										  <td width='50' style="text-align: left; padding-left: 14px;"><a href="Liga.jsp?cod_liga=<%out.print(equipos.get(i).getCod_liga());%>" ><img width="50" src="images/ligas/<% out.print(equipos.get(i).getCod_liga());%>.png"></img></a></td>
										  <td width='205'><img width="50" src="images/paises/<% out.print(liga.getPais());%>.png"></img></td>
										  <td width='205'></td>
										</tr>
										
										
									</tbody>
									<%}%>
								</table>
							</div>

									
								</article>

						</div>
					</div>
				</section>
			

			<!-- Footer -->
				<div id="footer">
					<div class="container">
						<div class="row">
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>Listados</h3>
								<ul class="links">
									<li><a href="jugadores.asp">Listado de Ligas</a></li>
									
								
								</ul>
							</section>
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>M�s Opciones</h3>
								<ul class="links">
									<li><a href="operaciones.jsp?tipo=altaJugador">Opci�n 1</a></li>
									
								</ul>
							</section>
							<section class="col-6 col-12-narrower">
								<h3>Solicita Informaci�n</h3>
								<form>
									<div class="row gtr-50">
										<div class="col-6 col-12-mobilep">
											<input type="text" name="name" id="name" placeholder="Name" />
										</div>
										<div class="col-6 col-12-mobilep">
											<input type="email" name="email" id="email" placeholder="Email" />
										</div>
										<div class="col-12">
											<textarea name="message" id="message" placeholder="Message" rows="5"></textarea>
										</div>
										<div class="col-12">
											<ul class="actions">
												<li><input type="submit" class="button alt" value="Enviar Email" /></li>
											</ul>
										</div>
									</div>
								</form>
							</section>
						</div>
					</div>

					<!-- Icons -->
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li>
							<li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
							<li><a href="#" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
						</ul>

					<!-- Copyright -->
						<div class="copyright">
							<ul class="menu">
								<li>&copy; FIFA 22. Todos los derechos reservados</li><li>Design: <a href="https://www.centronelson.org">Centro Nelson</a></li>
							</ul>
						</div>

				</div>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>