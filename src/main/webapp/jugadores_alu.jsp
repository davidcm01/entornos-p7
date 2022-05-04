<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="FIFA22.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<title>Proyecto Web FIFA20</title>
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
										<li><a href="ligas.jsp">Opción 1</a></li>
										
									</ul>
								</li>
								<li>
									<a href="#">Operaciones</a>
									<ul>
										<li>
											<a href="#">Opción 1</a>
											<ul>
												<li><a href="altajugador.jsp">Opción 1</a></li>
												
											</ul>
										</li>
										<li>
											<a href="#">Opción 2</a>
											<ul>
												<li><a href="#">Opción 1</a></li>
												
											</ul>
										</li>
										<li>
											<a href="#">Opción 3</a>
											<ul>
												<li><a href="#">Opción 1</a></li>
												
											</ul>
										</li>
										<li>
											<a href="#">Opción 4</a>
											<ul>
												<li><a href="#">Opción 1</a></li>
												
											</ul>
										</li>
									</ul>
								</li>
								<li ><a href="#">Simulador</a>
									<ul>
										<li><a href="creador.jsp">Opción 1</a></li>
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
										<table >
											<tr style="border:0px;" >	
												<td style="background-color: white;"><h2>Jugadores</h2></td><td style="text-align: right;background-color: white;""></td>
											</tr>
										</table>
									</header>
									
									<div class="table-wrapper">
								<table class="alt">
									<thead>
										<tr>
											<th>Nombre</th>
											<th width='325' colspan="3"></th>
											<th style="text-align: center;">RAT</th>
											<th style="text-align: center;">POS</th>
											<th style="text-align: center;">CARTA</th>
											<th style="text-align: center;">PRECIO</th>
											<th style="text-align: center;">SKI</th>
											<th style="text-align: center;">WF</th>
											<th style="text-align: center;">PAC</th>
											<th style="text-align: center;">SHO</th>
											<th style="text-align: center;">PAS</th>
											<th style="text-align: center;">DRI</th>
											<th style="text-align: center;">DEF</th>
											<th style="text-align: center;">PHI</th>
											<th style="text-align: center;">ALTURA</th>
										</tr>
									</thead>
									<tbody>
									
									<%BDController bdcontroller = new BDController();
									ArrayList<Jugador> jugadores = bdcontroller.todosJugadores();
									for(int i =0;i<jugadores.size();i++){
										Carta carta = bdcontroller.dameCartaSimple(jugadores.get(i).getCod_jugador());	
										Metodos metodo = new Metodos();																		
										
										%>
										<tr>
											<td width='60' rowspan="2"><a href="Jugador.jsp?cod_jugador=<%out.print(jugadores.get(i).getCod_jugador());%>&nombre_carta=Simple" ><img width='100' src="./images/jugadores/<%out.print(jugadores.get(i).getCod_jugador()); %>.png"></img></a></td>
											<td width='325' colspan="3" style="padding-left: 15px;"><%out.print(jugadores.get(i).getNombre()); %></td>
											
												<td  rowspan="2" width='60' style="text-align: center;"><div class = "cuadradito_amarillo"><%out.print(carta.getRat()); %></div></td>	
												<td rowspan="2" width='60' style="text-align: center;"><%out.print(carta.getPos()); %></td>	
												<td rowspan="2" width='100' style="text-align: center;"><%out.print(carta.getNombre()); %></td>	
												<td rowspan="2" width='100' style="text-align: center;"><%out.print(carta.getPrecio()); %></td>	
												<td rowspan="2" width='60' style="text-align: center;"><%out.print(carta.getFiligranas()); %></td>	
												<td rowspan="2" width='60' style="text-align: center;"><%out.print(carta.getPierna_mala()); %></td>
												
												<td rowspan="2" width='60' style="text-align: center;"><div class=<%=metodo.claseColor(carta.getPac())%>><%out.print(carta.getPac()); %></div></td>	
												
												<td rowspan="2" width='60' style="text-align: center;"><div class=<%=metodo.claseColor(carta.getSho())%>><%out.print(carta.getSho()); %></div></td>	
												
												<td rowspan="2" width='60' style="text-align: center;"><div class=<%=metodo.claseColor(carta.getPas()) %>><%out.print(carta.getPas()); %></div></td>	
													
												<td rowspan="2" width='60' style="text-align: center;"><div class=<%=metodo.claseColor(carta.getDri())%>><%out.print(carta.getDri()); %></div></td>	
													
												<td rowspan="2" width='60' style="text-align: center;"><div class=<%=metodo.claseColor(carta.getDef()) %>><%out.print(carta.getDef()); %></div></td>	
												
												<td rowspan="2" width='60' style="text-align: center;"><div class=<%=metodo.claseColor(carta.getPhy()) %>><%out.print(carta.getPhy()); %></div></td>
												<td rowspan="2" width='60' style="text-align: center;"><%out.print(jugadores.get(i).getAltura()); %></td>
																						
										</tr>
										<tr>
										  <td width='45' style="text-align: right;"><a href="Equipo.jsp?cod_equipo=<%out.print(jugadores.get(i).getCod_equipo());%>" ><img width='50' src="./images/equipos/<%out.print(jugadores.get(i).getCod_equipo()); %>.png"></img></a></td>
										  <td width='50' style="text-align: center;"><img width='50' src="./images/paises/<%out.print(jugadores.get(i).getPais()); %>.png"></img></td>
										  <td width='230'><a href="Liga.jsp?cod_liga=<%out.print(bdcontroller.dameEquipo(jugadores.get(i).getCod_equipo()).getCod_liga());%>" ><img width='50' src="./images/ligas/<%out.print(bdcontroller.dameEquipo(jugadores.get(i).getCod_equipo()).getCod_liga()); %>.png"></img></a></td>
										</tr>
										<%} %>
										
									</tbody>
									
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
								<h3>Más Opciones</h3>
								<ul class="links">
									<li><a href="operaciones.jsp?tipo=altaJugador">Opción 1</a></li>
									
								</ul>
							</section>
							<section class="col-6 col-12-narrower">
								<h3>Solicita Información</h3>
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
								<li>&copy; FIFA 20. Todos los derechos reservados</li><li>Design: <a href="https://www.centronelson.org">Centro Nelson</a></li>
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