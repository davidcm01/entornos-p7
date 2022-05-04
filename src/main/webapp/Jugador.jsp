<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="FIFA22.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<title>Proyecto Web FIFA20</title>
</head>
<% 
							  int codJugador = Integer.parseInt(request.getParameter("cod_jugador")); 
								String nombrecarta=request.getParameter("nombre_carta");
								String colorletra="";
								Metodos metodos = new Metodos();
								BDController bdcontroller = new BDController();
							 	Jugador jugador = bdcontroller.dameJugador(codJugador);							 	
							 	Carta carta = bdcontroller.dameCarta(codJugador, nombrecarta);
							 	
							 	if(nombrecarta.equalsIgnoreCase("simple")){
							 		colorletra="#484848";
							 	}else{
							 		colorletra="#ffffff";
							 	}
							 	
							 	
							   %>	
<body class="is-preload">
		<div id="page-wrapper">
		<%
		
		%>
			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="index.html" id="logo">FIFA22</a></a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="index.html">Inicio</a></li>
								<li>
									<a href="#">Listados</a>
									<ul>
										<li><a href="jugadores.jsp">FIFA 22 Jugadores</a></li>
										<li><a href="ligas.jsp">FIFA 22 Ligas</a></li>
										<li><a href="equipos.jsp">FIFA 22 Equipos</a></li>
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
										<table style="background-color:white; border-color: white; margin:0;padding: 0 0em 0em 0em;">
											<tr style="background-color:white; border-color: white; margin:0;padding: 0 0em 0em 0em;">
											<td width="100" style="background-color:white; border-color: black;text-align:center; margin:0;padding: 0 0em 0em 0em;"><h2><%=jugador.getNombre() %></h2></td>
											</tr>
										</table>
									</header>
							 
							<!-- Grid -->
							<div class="grid-containerGeneral">
							  <div class="c1">
								  <div class="grid-container" style="background-image: url('images/cartas/<%=nombrecarta.toUpperCase()%>.png');">
									  <div class="A" style="color:<%=colorletra %>"><%=carta.getRat() %></div>
									  <div class="B" style="color:<%=colorletra %>"><%=carta.getPos() %></div>
									  <div class="C"><img width="30"  src="images/paises/<% out.print(jugador.getPais());%>.png"></img></div>
									  <div class="D"><img width="30"  src="images/equipos/<% out.print(jugador.getCod_equipo());%>.png"></img></div>
									  <div class="E"><img width="100"  src="images/jugadores/<% out.print(jugador.getCod_jugador());%>.png"></img></div>
									  <div class="F" style="color:<%=colorletra %>"><%=jugador.getNombre() %></div>
									  <div class="G" style="color:<%=colorletra %>"><%=carta.getPac() %> PAC &nbsp;&nbsp;|&nbsp;&nbsp; <%=carta.getDri()%> DRI<br> <%=carta.getSho() %> SHO   &nbsp;|&nbsp;&nbsp; <%=carta.getDef() %> DEF<br><%=carta.getPas() %> PAS   &nbsp;&nbsp;|&nbsp;&nbsp; <%=carta.getPhy() %> PHY</div>
									 </div>
							  </div>
							 
							  <div class="b">
							 
								  <div class="grid-container2" >
									  <div class="grid-container2">
									  
										  <div class="a2">PACE</div>
										  <div class="b2" style="color:<%=metodos.colorStats(carta.getPac()) %>;"><%=carta.getPac() %></div>
										  <div class="c2" style="background-color:<%=metodos.colorStats(carta.getPac()) %>; width:<%=carta.getPac()*3 %>px;"></div>
										  
										
										  <div class="d2">SHOOTING</div>
										  <div class="e2" style="color:<%=metodos.colorStats(carta.getSho()) %>;"><%=carta.getSho() %></div>
										  <div class="f2" style="background-color:<%=metodos.colorStats(carta.getSho()) %>; width:<%=carta.getSho()*3 %>px;"></div>
										  									  
										  
										  <div class="g2">PASSING</div>
										  <div class="h2" style="color:<%=metodos.colorStats(carta.getPas()) %>;"><%=carta.getPas() %></div>
										  <div class="i2" style="background-color:<%=metodos.colorStats(carta.getPas()) %>; width:<%=carta.getPas()*3 %>px;"></div>
									
										  <div class="j2">DRIBBLING</div>
										  <div class="k2" style="color:<%=metodos.colorStats(carta.getDri()) %>;"><%=carta.getDri()%></div>
										  <div class="l2" style="background-color:<%=metodos.colorStats(carta.getDri()) %>; width:<%=carta.getDri()*3%>px;"></div>
										
										  <div class="m2">DEFENDING</div>
										  <div class="n2" style="color:<%=metodos.colorStats(carta.getDef()) %>;"><%=carta.getDef() %></div>
										  <div class="o2" style="background-color:<%=metodos.colorStats(carta.getDef()) %>; width:<%=carta.getDef()*3 %>px;"></div>
										 
										
										  <div class="p2">PHYSICALITY</div>
										  <div class="q2" style="color:<%=metodos.colorStats(carta.getPhy()) %>;"><%=carta.getPhy() %></div>
										  <div class="r2" style="background-color:<%=metodos.colorStats(carta.getPhy()) %>; width:<%=carta.getPhy()*3 %>px;"></div>
									</div>
								 </div>
								 <% ArrayList<Carta> cartas = bdcontroller.todasCartasJugador(codJugador);%>
							  </div>
							</div>
							<div class="grid-containerGeneral">
								<div class="c1"  style="padding-left:5px; padding-top:5px;text-align: center;">
									<table style="border-color:white; background-color:white;">
										<tr style="border-color:white; background-color:white;">
										<%if(!(cartas.size()<2)){ %>
											<td style="border-color:white; background-color:white;"><a href="Jugador.jsp?cod_jugador=<%=jugador.getCod_jugador()%>&nombre_carta=Simple"><div class="SIMPLE" style="text-align: center;"><%=bdcontroller.dameRatCarta(codJugador, "SIMPLE") %></div></a></td>
											<%}
											for (int i=0;i<cartas.size();i++){ 
											if(!(cartas.get(i).getNombre().equalsIgnoreCase("SIMPLE"))){
												
											
											%>											
												<td style="border-color:white; background-color:white;"><a href="Jugador.jsp?cod_jugador=<%=jugador.getCod_jugador()%>&nombre_carta=<%=cartas.get(i).getNombre()%>"><div class='<%=cartas.get(i).getNombre()%>' style="text-align: center;"><%=bdcontroller.dameCarta(jugador.getCod_jugador(), cartas.get(i).getNombre()).getRat()%></div></a></td>
											<%}} %>	
										</tr>
									</table>
								</div>
								
								
								<div class="b"></div>
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
									<li><a href="jugadores.asp">Listado de Jugadores</a></li>
									<li><a href="equipos.asp">Listado de Equipos</a></li>
									<li><a href="ligas.asp">Listado de Ligas</a></li>
								
								</ul>
							</section>
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>M�s Opciones</h3>
								<ul class="links">
									<li><a href="altaJugador.jsp">Alta Jugador</a></li>
									<li><a href="altaEquipo.jsp">Alta Equipo</a></li>
									<li><a href="altaLiga.jsp">Alta Liga</a></li>
									<li><a href="altaCarta.jsp">Alta Carta</a></li>
									<li><a href="modifiJugador.jsp">Modificar Jugador</a></li>
									<li><a href="modifiEquipo.jsp">Modificar Equipo</a></li>
									<li><a href="modifiLiga.jsp">Modificar Liga</a></li>
									<li><a href="modifiCarta.jsp">Modificar Carta</a></li>
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
								<li>&copy; FIFA 19. Todos los derechos reservados</li><li>Design: <a href="https://www.centronelson.org">Centro Nelson</a></li>
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

</body></html>