<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="mipk.beanDB"%>
<%@page import="mipk.querys"%>
<%@page import="objetoscrm.*"%>
<%
	try {
		String aux = session.getAttribute("usuario").toString();
	} catch (Exception e) {
		response.sendRedirect("cerrarsesion.jsp");
	}
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mostrar datos</title>
<!--OWN STYLE-->
<link rel="stylesheet" type="text/css" href="assets/css/my_css2.css">

<!--Bootstrap-->
<script src="assets/js/script.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<script src="https://unpkg.com/ionicons@4.5.5/dist/ionicons.js"></script>

<!-- Script para el filtro de tabla -->
<script>
	$(document).ready(function(){
		  $("#busqueda").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#tabla tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
</script>

<!-- Script para cambiar la pestaña activa -->
<script>
	$(document).ready(function(){
		var tabListados = document.getElementById('listados').className;
		var tabInforme = document.getElementById('informe').className;
		var tabRegistro = document.getElementById('registro').className;
	});
</script>

<!-- Para recargar la tabla -->
<script>
$(document).ready(function() {


	//You can load HTML page partial, in your case is everything inside div#mytable.

	setTimeout(function(){
	   $( "#tablaEditados" ).load( "verdatos.jsp #tablaEditados" );
	}, 2000); //refresh every 2 seconds


   // OR CAN THIS WAY
   //
   // $("#refresh-btn").on("click", function() {
   //    $( "#mytable" ).load( "your-current-page.html #mytable" );
   // });


});
</script>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="bienvenido.jsp">JSGame</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="bienvenido.jsp">Inicio</a></li>
				<li class="nav-item text-right"><a class="nav-link "
					href="cerrarsesion.jsp" tabindex="-1">Cerrar sesión</a></li>
			</ul>
		</div>
	</nav>

	<%
		//String query="select idGrupo, Profesores_idProfesor, etapas_idEtapa from grupos";

		//QUERY USUARIOS
		String query = "SELECT id_usuario, nick, email FROM usuarios";
		beanDB basededatos = new beanDB();
		String[][] tablares = basededatos.resConsultaSelectA3(query);
		ArrayList<usuarios> listaUsuarios = new ArrayList<usuarios>();
		for (int i = 0; i < tablares.length; i++) {
			listaUsuarios.add(new usuarios(tablares[i][0], tablares[i][1], tablares[i][2]));
		}

		//QUERY PERSONAJES
		String query2 = "SELECT id_personaje, nombrePersonaje FROM personajes";
		String[][] tablares2 = basededatos.resConsultaSelectA3(query2);
		ArrayList<personajes> listaPersonajes = new ArrayList<personajes>();
		for (int i = 0; i < tablares2.length; i++) {
			listaPersonajes.add(new personajes(tablares2[i][0], tablares2[i][1]));
		}
		
		
		//QUERY NIVELES
				String query4 = "SELECT id_nivel, descripcion, velocidad FROM niveles";
				String[][] tablares4 = basededatos.resConsultaSelectA3(query4);
				ArrayList<niveles> listaNiveles = new ArrayList<niveles>();
				for (int i = 0; i < tablares4.length; i++) {
					listaNiveles.add(new niveles(tablares4[i][0], tablares4[i][1], tablares4[i][2]));
				}

		/*QUERY PERSONAJES
		String query3 = "SELECT id_nivel, descripcion, velocidad FROM personajes";
		String [][] tablares3 = basededatos.resConsultaSelectA3(query3);
		ArrayList<niveles> listaNiveles = new ArrayList<niveles>();
		for (int i=0; i < tablares2.length;i++) {
			listaNiveles.add(new niveles(tablares3[i][0], tablares3[i][1]));
		}*/

		//QUERY GENERICA
	%>
	
	<br>
	<br>
	<div class="container">
		<div class="row">
			<!--<h1session.getAttribute("usuario")o") %>: Estos son los datos datos</h1>-->
			<br>
			<div class="col-md-12">
				<ul class="nav nav-tabs" id="myTab" role="tablist">

					<li class="nav-item"><a class="nav-link active"
						id="listados-tab" data-toggle="tab" href="#listados" role="tab"
						aria-controls="home">Listados</a></li>
					<li class="nav-item"><a class="nav-link" id="informe-tab"
						data-toggle="tab" href="#informe" role="tab"
						aria-controls="informe">Informe personalizado</a></li>
					<li class="nav-item"><a class="nav-link" id="registro-tab"
						data-toggle="tab" href="#registro" role="tab"
						aria-controls="registro">Registro de un nuevo usuario</a></li>
					<li class="nav-item"><a class="nav-link" id="editar-tab"
						data-toggle="tab" href="#editar" role="tab"
						aria-controls="editar">Editar nivel</a></li>
				</ul>
				<div class="tab-content" id="myTabContent">

					<div class="tab-pane fade" id="informe" role="tabpanel"
						aria-labelledby="informe-tab">
						<br> <br>
						<form name="formulario" method="get" class="form-inline">
							<h4>ID del usuario para ver sus partidas: &nbsp;</h4>
							<input type="number" name="id" placeholder="ID"
								class="form-control"> <input type="submit" name="submit"
								value="Ejecutar" class="btn btn-primary" onclick="getNewClass2()"><br> <br>
							<%
								String numero = request.getParameter("id");
								ArrayList<query> listaQuery = new ArrayList<query>();
								try {
									String sql = "SELECT U.nick, PER.nombrePersonaje, P.id_nivel, N.velocidad FROM usuarios U JOIN usuario_personaje UP ON (U.id_usuario = UP.id_usuario) JOIN personajes PER ON (UP.id_personaje = PER.id_personaje) JOIN partidas P ON (UP.id_up = P.id_up) JOIN niveles N ON (P.id_nivel = N.id_nivel) WHERE U.id_usuario='"
											+ numero + "'";
									String[][] resultado = basededatos.resConsultaSelectA3(sql);
									for (int i = 0; i < resultado.length; i++) {
										listaQuery.add(new query(resultado[i][0], resultado[i][1], resultado[i][2], resultado[i][3]));
									}
								} catch (Exception e) {
									out.println("No hay resultados");
								}
							%>

							<!-- QUERY GENERICA -->
							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th scope="col">Nick</th>
										<th scope="col">Personaje</th>
										<th scope="col">Nivel jugado</th>
										<th scope="col">Dificultad</th>
									</tr>
								</thead>
								<%
									for (query q : listaQuery) { //u es una variable tipo grupo que va recorriendo la lista
								%><tr>
									<td><%=q.getString1()%></td>
									<td><%=q.getString2()%></td>
									<td><%=q.getString3()%></td>
									<td><%=q.getString4() + " (0-20)"%></td>
								</tr>
								<%
									}
								%>
							</table>


						</form>
					</div>


					<div class="tab-pane fade show active" id="listados"
						role="tabpanel" aria-labelledby="listados-tab">
						<br> <br>
						<form name="formulario2" method="post" class="form-inline">
							<h4>Selecciona una opción para ver listado de:&nbsp;</h4>

							<select name="opcion" class="form-control">
								<option selected>Seleccione una opción...</option>
								<option value="usuarios">Usuarios</option>
								<option value="personajes">Personajes</option>
							</select> 
							<input type="submit" name="submit" value="Ejecutar"
								class="btn btn-primary" onclick="getNewClass1()">
						</form>


						<div class="row" id="resultado">
							<div class="col-md-12">
								<%
									//Obtenemos la opcion
									String opcion = request.getParameter("opcion");
									if (opcion != null) {

										switch (opcion) {
										case "usuarios":
								%>
								<h3>Usuarios</h3>
								<input class="form-control" type="text" placeholder="Buscar..."
									id="busqueda">
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th scope="col">#</th>
											<th scope="col">Nick</th>
											<th scope="col">E-Mail</th>
										</tr>
									</thead>
									<tbody id="tabla">
										<%
										for (usuarios u : listaUsuarios) { //u es una variable tipo grupo que va recorriendo la lista
									%><tr>
											<td><%=u.getIdUsuario()%></td>
											<td><%=u.getNick()%></td>
											<td><%=u.getEmail()%></td>
										</tr>
										<%
										}
									%>
									</tbody>
								</table>
								<p id="error"></p>
								<%
									break;

										case "personajes":
								%>
								<h3>Personajes</h3>
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th scope="col">#</th>
											<th scope="col">Nombre del personaje</th>
										</tr>
									</thead>
									<%
										for (personajes p : listaPersonajes) { //u es una variable tipo grupo que va recorriendo la lista
									%><tr>
										<td><%=p.getIdPersonaje()%></td>
										<td><%=p.getNombre()%></td>
									</tr>
									<%
										}
									%>
								</table>
								<%
									break;

										default:
											out.println("Nada seleccionado");
											break;
										}
									}

									//Realizamos una query u otra dependiendo de la opcion seleccionada
								%>
							</div>
						</div>

					</div>


					<div class="tab-pane fade" id="registro" role="tabpanel"
						aria-labelledby="registro-tab">
						<br> <br>

						<div class="row">
							<div class="col-md-12">
								<form name="formulario3" method="post" class="form">
									<h4>Registro de un nuevo usuario &nbsp;</h4>


									<div class="col-sm-5 my-1">
										<span>Nick:</span> <input type="text" name="nick"
											placeholder="Introduce un nick..." class="form-control"
											id="nick" required maxlength="10">
									</div>

									<div class="col-sm-5 my-1">
										<span>E-Mail:</span> <input type="text" name="email"
											placeholder="Introduce el e-mail..." class="form-control"
											id="email" required>
									</div>

									<div class="col-sm-5 my-1">
										<span>Contraseña:</span> <input type="password"
											name="password" placeholder="Introduce una contraseña..."
											class="form-control" id="password" maxlength="3" required>
									</div>

									<br>
									<div class="col-sm-5 my-1">
										<input type="submit" name="submit" value="Registrar"
											class="btn btn-primary">
									</div>
								</form>

								<!-- Código JAVA para procesar los datos -->
								<%
									String nick = request.getParameter("nick");
									String email = request.getParameter("email");
									String contra = request.getParameter("password");
									/*String sql = "INSERT INTO usuarios (nick, password, email) VALUES" +
											"('" + nick + "', " + "'" + contra + "', " + "'" + email + "')";*/
									if(nick == null || email == null || contra == null) {
										
									} else {
										String sql = mipk.querys.getInsert(nick, contra, email);
										basededatos.insert(sql);
									%>
									<script>alert("Usuario registrado con éxito")</script>
									<%}
								%>
							</div>
						</div>

					</div>
					
					
					<div class="tab-pane fade" id="editar" role="tabpanel"
						aria-labelledby="editar-tab">
						<br> <br>
						<!--  DELETE FROM bbdd_project`.`usuarios` WHERE  `id_usuario`=104; -->
						<div class="row">
							<div class="col-md-12">
								
								<form name="formulario4" method="get" class="form">
									<h4>Editor de nivel:  &nbsp;</h4>

									<div class="col-sm-5 my-1">
										<span>ID Nivel</span> 
										<input type="text" name="idNivel"
											class="form-control" id="idNivel" value="" readonly>
									</div>

									<div class="col-sm-5 my-1">
										<span>Descripción</span> 
										<input type="text" name="nuevaDesc"
											placeholder="Introduce una descripción..." class="form-control"
											id="nuevaDesc" required value="" >
									</div>

									<div class="col-sm-5 my-1">
										<span>Velocidad:</span> <input type="number"
											name="nuevaVelocidad" placeholder="Introduce la velocidad..."
											class="form-control" id="nuevaVelocidad" maxlength="2" required value="">
									</div>

									<br>
									<div class="col-sm-5 my-1">
										<input type="submit" name="submit" value="Editar"
											class="btn btn-warning">
									</div>
								</form>

									
									<script>
									window.onload=function() {
										 
										// creamos los eventos para cada elemento con la clase "boton"
										let elementos=document.getElementsByClassName("recuperar");
										for(let i=0;i<elementos.length;i++)
										{
								 
											// cada vez que se haga clic sobre cualquier de los elementos,
											// ejecutamos la función obtenerValores()
											elementos[i].addEventListener("click",obtenerValores);
										}
								    }
								 
									// funcion que se ejecuta cada vez que se hace clic
									function obtenerValores(e) {
										var valores="";
								 
										// vamos al elemento padre (<tr>) y buscamos todos los elementos <td>
										// que contenga el elemento padre
										var elementosTD=e.srcElement.parentElement.getElementsByTagName("td");
								 
										// recorremos cada uno de los elementos del array de elementos <td>
										for(let i=0;i<elementosTD.length;i++)
										{
								 
											// obtenemos cada uno de los valores y los ponemos en la variable "valores"
											valores+=elementosTD[i].innerHTML+"\n";
										}
								 
										var velocidad = elementosTD[2].innerHTML;
										var desc = elementosTD[1].innerHTML;
										var id = elementosTD[0].innerHTML;
										
										document.getElementById('idNivel').setAttribute("value", elementosTD[0].innerHTML.toString());
										document.getElementById('nuevaDesc').setAttribute("value", elementosTD[1].innerHTML.toString());
										document.getElementById('nuevaVelocidad').setAttribute("value", elementosTD[2].innerHTML.toString());
									}
									</script>
									<!-- Código JAVA para procesar los datos -->
								<%
									String idNivel = request.getParameter("idNivel");
									String nuevaDesc = request.getParameter("nuevaDesc");
									String nuevaVelocidad = request.getParameter("nuevaVelocidad");
									
									if(nuevaDesc == null || nuevaVelocidad == null || idNivel == null) {%>
										
									<% } else {
										String sql = mipk.querys.getUpdate(nuevaDesc, nuevaVelocidad, idNivel);
										basededatos.update(sql);
									%>
									<script>alert("Nivel editado con éxito")</script>
									<%}
								%>
								
								<hr>
								<h3>Busqueda de nivel: </h3>
								<input class="form-control" type="text" placeholder="Buscar..."
									id="busqueda">
								<table class="table table-striped" id="tablaEditados">
									<thead class="thead-dark">
										<tr>
											<th scope="col">#</th>
											<th scope="col">Descripción</th>
											<th scope="col">Velocidad</th>
											<th scope="col">Acciones</th>
										</tr>
									</thead>
									<tbody id="tabla">
										<%
										for (niveles n : listaNiveles) { //u es una variable tipo grupo que va recorriendo la lista
									%><tr>
											<td><%=n.getIdNivel()%></td>
											<td><%=n.getDescripcion()%></td>
											<td><%=n.getVelocidad()%></td>
											<td class="recuperar">Editar</td>
										</tr>
										<%
										}
									%>
									</tbody>
								</table>
							</div>
						</div>

					</div>
					

				</div>

			</div>
			<br>

		</div>
	</div>
</body>
</html>