<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="FIFA22.*" %>
<%@ page import="java.io.*,java.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<title>Proyecto Web FIFA22</title>
</head>

<body class="is-preload">
		<div id="page-wrapper">
		
		<%
		//variables glovales
		BDController bdcontroller = new BDController();
		String tipo = request.getParameter("tipo");
		String mensaje ="";
		boolean crear=true;
		String nombre ="";
		
		
		//ALTA JUGADOR
		if(tipo.equalsIgnoreCase("altajugador")){
			int codEquipo =0;
			String pierna ="";
			int altura =0;
			String pais = "";
		int cod = bdcontroller.dameUltimoCodigoJugador() +1 ;
		
		if(request.getParameter("nombre").isBlank() || request.getParameter("nombre").isEmpty()){
			mensaje="Debe introducir un nombre válido";
			crear = false;
		}else{
			 nombre = request.getParameter("nombre");
		}
		
		if(request.getParameter("codEquipo").isBlank() || request.getParameter("codEquipo").isEmpty() || Integer.parseInt(request.getParameter("codEquipo"))<=0){
			mensaje="Debe introducir un código de equipo válido";
			crear = false;
		}else{
			codEquipo = Integer.parseInt(request.getParameter("codEquipo"));
		}
		
		if(request.getParameter("pierna").isBlank() || request.getParameter("pierna").isEmpty()){
			mensaje="Debe introducir una pierna válida";
			crear = false;
		}else{
			 pierna = request.getParameter("pierna");
		}
		
		if(request.getParameter("altura").isBlank() || request.getParameter("altura").isEmpty() || Integer.parseInt(request.getParameter("altura"))<=0){
			mensaje="Debe introducir una altura válida";
			crear = false;
		}else{
			 altura = Integer.parseInt(request.getParameter("altura"));
		}
		
		if(request.getParameter("pais").isBlank() || request.getParameter("pais").isEmpty()){
			mensaje="Debe introducir un país válido";
			crear = false;
		}else{
			 pais = request.getParameter("pais");
		}
		
		if(crear){
			Jugador jugador = new Jugador(cod,nombre,codEquipo,pierna,altura,pais);
			if(bdcontroller.existeEquipo(jugador.getCod_equipo())){
			bdcontroller.altaJugador(jugador);
			mensaje="Alta creada con exito ";
			}else{
			mensaje="El equipo seleccionado no existe, vuelva a intentarlo";
				}
			}	
	
		}
		
		
		//ALTA LIGA
		
				if(tipo.equalsIgnoreCase("altaliga")){
					nombre ="";
					String pais ="";
					if(request.getParameter("nombre_liga").isBlank() && request.getParameter("nombre_liga").isEmpty()){
						mensaje="Debe introducir un nombre válido";
						crear = false;
					}else{
						 nombre = request.getParameter("nombre_liga");
						
					}
				
					if(request.getParameter("pais_liga").isBlank() && request.getParameter("pais_liga").isEmpty()){
						mensaje="Debe introducir un país válido";
						crear = false;
					}else{
						 pais = request.getParameter("pais_liga");
					}
				
					if(crear){
						Liga liga= new Liga(bdcontroller.dameUltimoCodigoLiga() +1,nombre,pais);
					bdcontroller.altaLiga(liga);
					mensaje="Alta creada con exito ";
					}
			
			
				}
		
				//ALTA EQUIPO
				
				if(tipo.equalsIgnoreCase("altaequipo")){
					int cod_equipo =bdcontroller.dameUltimoCodigoEquipo() +1;
					 nombre ="";
					int cod_liga =0;
					
					if(request.getParameter("nombre_equipo").isBlank() && request.getParameter("nombre_equipo").isEmpty()){
						mensaje="Debe introducir un nombre válido";
						crear = false;
					}else{
						 nombre = request.getParameter("nombre_equipo");
						
					}
				
					if(request.getParameter("cod_liga").isBlank() && request.getParameter("cod_liga").isEmpty() || Integer.parseInt( request.getParameter("cod_liga"))<=0){
						mensaje="Debe introducir un código válido";
						crear = false;
					}else{
						cod_liga = Integer.parseInt(request.getParameter("cod_liga"));
					}
				
					if(crear){
						Equipo equipo= new Equipo(cod_equipo,nombre,cod_liga);
					bdcontroller.altaEquipo(equipo);
					mensaje="Alta de equipo creada con exito ";
					}
			
			
				}
		
		
		//BAJA JUGADOR
				if(tipo.equalsIgnoreCase("bajajugador")){
					if(request.getParameter("cod_jugador").isBlank() || Integer.parseInt(request.getParameter("cod_jugador"))<=0){
						mensaje="Debe introducir un código válido";
					}else if(bdcontroller.existeJugador(Integer.parseInt(request.getParameter("cod_jugador")))){
						int codigo_jugador =  Integer.parseInt(request.getParameter("cod_jugador"));
						bdcontroller.bajaJugador(codigo_jugador);
						mensaje="Jugador dado de baja con éxito";
					}else{
						mensaje="El jugador que desea eliminar no existe";
					}
					
					
				}
		
				//BAJA LIGA
				if(tipo.equalsIgnoreCase("bajaliga")){
					if(request.getParameter("cod_liga").isBlank() || Integer.parseInt(request.getParameter("cod_liga"))<=0){
						mensaje="Debe introducir un código válido";
					}else if(bdcontroller.existeLiga(Integer.parseInt(request.getParameter("cod_liga")))){
						int cod_liga =  Integer.parseInt(request.getParameter("cod_liga"));
						bdcontroller.bajaLiga(cod_liga);
						mensaje="Liga dado de baja con éxito";
					}else{
						mensaje="La liga que desea eliminar no existe";
					}
					
					
				}
				
				//BAJA LIGA
				if(tipo.equalsIgnoreCase("bajaequipo")){
					if(request.getParameter("cod_equipo").isBlank() || Integer.parseInt(request.getParameter("cod_equipo"))<=0){
						mensaje="Debe introducir un código válido";
					}else if(bdcontroller.existeEquipo(Integer.parseInt(request.getParameter("cod_equipo")))){
						int cod_equipo =  Integer.parseInt(request.getParameter("cod_equipo"));
						bdcontroller.bajaEquipo(cod_equipo);
						mensaje="Equipo dado de baja con éxito";
					}else{
						mensaje="El equipo que desea eliminar no existe";
					}
					
					
				}
		
				//Modificar JUGADOR
				if(tipo.equalsIgnoreCase("modificarjugador")){
					
					int codEquipo =0;
					String pierna ="";
					int altura =0;
					String pais = "";
				int cod =  Integer.parseInt(request.getParameter("cod_jugador"));
				
				if(request.getParameter("nombre").isBlank() || request.getParameter("nombre").isEmpty()){
					mensaje="Debe introducir un nombre válido";
					crear = false;
				}else{
					 nombre = request.getParameter("nombre");
				}
				
				if(request.getParameter("codEquipo").isBlank() || request.getParameter("codEquipo").isEmpty() || Integer.parseInt(request.getParameter("codEquipo"))<=0){
					mensaje="Debe introducir un código de equipo válido";
					crear = false;
				}else{
					codEquipo = Integer.parseInt(request.getParameter("codEquipo"));
				}
				
				if(request.getParameter("pierna").isBlank() || request.getParameter("pierna").isEmpty()){
					mensaje="Debe introducir una pierna válida";
					crear = false;
				}else{
					 pierna = request.getParameter("pierna");
				}
				
				if(request.getParameter("altura").isBlank() || request.getParameter("altura").isEmpty() || Integer.parseInt(request.getParameter("altura"))<=0){
					mensaje="Debe introducir una altura válida";
					crear = false;
				}else{
					 altura = Integer.parseInt(request.getParameter("altura"));
				}
				
				if(request.getParameter("pais").isBlank() || request.getParameter("pais").isEmpty()){
					mensaje="Debe introducir un país válido";
					crear = false;
				}else{
					 pais = request.getParameter("pais");
				}
				
				if(crear){
					Jugador jugador = new Jugador(cod,nombre,codEquipo,pierna,altura,pais);
					if(bdcontroller.existeEquipo(jugador.getCod_equipo())){
					bdcontroller.modificarJugador(jugador);
					mensaje="Modificación realizada con exito ";
						}
			
					}
				}
				
				//MODIFICAR LIGA
				
				if(tipo.equalsIgnoreCase("modificarliga")){
					nombre ="";
					String pais ="";
					int cod_liga=Integer.parseInt(request.getParameter("cod_liga"));
					if(request.getParameter("nombre_liga").isBlank() && request.getParameter("nombre_liga").isEmpty()){
						mensaje="Debe introducir un nombre válido";
						crear = false;
					}else{
						 nombre = request.getParameter("nombre_liga");
						
					}
				
					if(request.getParameter("pais_liga").isBlank() && request.getParameter("pais_liga").isEmpty()){
						mensaje="Debe introducir un país válido";
						crear = false;
					}else{
						 pais = request.getParameter("pais_liga");
					}
				
					if(crear){
						Liga liga= new Liga(cod_liga,nombre,pais);
					bdcontroller.modificarLiga(liga);
					mensaje="Alta creada con exito ";
					}
			
			
				}
				
//MODIFICAR EQUIPO
				
				if(tipo.equalsIgnoreCase("modificarEquipo")){
					int cod_equipo =Integer.parseInt(request.getParameter("cod_equipo"));
					 nombre ="";
					int cod_liga =0;
					
					if(request.getParameter("nombre_equipo").isBlank() && request.getParameter("nombre_equipo").isEmpty()){
						mensaje="Debe introducir un nombre válido";
						crear = false;
					}else{
						 nombre = request.getParameter("nombre_equipo");
						
					}
				
					if(request.getParameter("cod_liga").isBlank() && request.getParameter("cod_liga").isEmpty() || Integer.parseInt( request.getParameter("cod_liga"))<=0){
						mensaje="Debe introducir un código válido";
						crear = false;
					}else{
						cod_liga = Integer.parseInt(request.getParameter("cod_liga"));
					}
				
					if(crear){
						Equipo equipo= new Equipo(cod_equipo,nombre,cod_liga);
					bdcontroller.modificarEquipo(equipo);
					mensaje="Alta de equipo creada con exito ";
					}
			
			
				}
		
				
		%>
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
										<li><a href="ligas.jsp">FIFA 22 Ligas</a></li>
										<li><a href="equipos.jsp">FIFA 22 Equipos</a></li>
										<li><a href="jugadores.jsp">FIFA 22 Jugadores</a></li>
									</ul>
								</li>
								<li>
									<a href="#">Operaciones</a>
									<ul>
										<li>
											<a href="#">Jugadores</a>
											<ul>
												<li><a href="operaciones.jsp?tipo=altajugador">Alta Jugador</a></li>
												<li><a href="#">Baja Jugador</a></li>
												<li><a href="#">Modificar Jugador</a></li>
											</ul>
										</li>
										<li>
											<a href="#">Equipos</a>
											<ul>
												<li><a href="#">Alta Equipo</a></li>
												<li><a href="#">Baja Equipo</a></li>
												<li><a href="#">Modificar Equipo</a></li>
											</ul>
										</li>
										<li>
											<a href="#">Ligas</a>
											<ul>
												<li><a href="#">Alta Liga</a></li>
												<li><a href="#">Baja Liga</a></li>
												<li><a href="#">Modificar Liga</a></li>
											</ul>
										</li>
										<li>
											<a href="#">Cartas</a>
											<ul>
												<li><a href="#">Alta Carta</a></li>
												<li><a href="#">Baja Carta</a></li>
												<li><a href="#">Modificar Carta</a></li>
											</ul>
										</li>
									</ul>
								</li>
								<li ><a href="#">Simulador</a>
									<ul>
										<li><a href="#">Construye tu Equipo</a></li>
									</ul>
								</li>
							</ul>
						</nav>
				</div>
				<!-- Main -->
				<section class="wrapper style1" style="height:500px;">
					<div class="container">
						<div id="content">

							<!-- Content -->
							
								<article>
									
									<section class="col-6 col-12-narrower">
								<h3><%=mensaje %></h3>
								
							</section>
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
								<h3>Más Opciones</h3>
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
			<script src="assets/js/index.js"></script>
			<script src="assets/js/dropdown.js"></script>

</body>

</html>