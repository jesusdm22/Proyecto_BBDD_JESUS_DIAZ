<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>Inicia sesión</title>


	<!--OWN STYLE-->
	<link rel="stylesheet" type="text/css" href="assets/css/my_css.css">

	<!--Bootstrap-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



<script type="text/javascript">
	function compruebayenvia() {
		datos=document.iniciosesion;
		if (datos.usuario.value == '' ||
			datos.pass.value == '')
			alert ('¡Tiene que rellenar todos los campos!');
		else datos.submit();
	}
	function compruebanums(campo, evento) {
		var keycode;
		if (window.event) keycode = window.event.keyCode;
		else if (evento) keycode = evento.which;
		else return true;
			if (keycode < 48 || keycode > 57) //Rango ASCII de números
			{
				if (keycode != 8 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
					alert('Sólo puede introducir números ');
					return false;
				}
				else return true;
			}
			else return true;
		}
		function compruebaalfan(campo, evento) {
			var keycode;
			if (window.event) keycode = window.event.keyCode;
			else if (evento) keycode = evento.which;
			else return true;
			if (( keycode < 48 || keycode > 57 ) && ( keycode < 64 || keycode > 90 ) && ( keycode < 97 || keycode > 122 )) //Rango ASCII de números y letras
			{
				if (keycode != 8 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
					alert('Sólo puede introducir letras y números ');
					return false;
				}
				else return true;
			}
			else return true;
		}


	</script>
</head>
<body onload="button2Effect()">

	<<form action="bienvenido.jsp" method="post" name="iniciosesion"/>
	<input type="hidden" name="varoculta" value="secreto"/>
	<div class="login-wrap">
		<div class="login-html">
			<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Iniciar sesión</label>
			<input id="tab-2" type="radio" name="tab" class="for-pwd"><label for="tab-2" class="tab"></label>

			<div class="login-form">

				<!--LOG IN-->
				<div class="sign-in-htm">
					<div class="group">
						<label for="usuario" class="label">Usuario</label>
						<input type="text" name="usuario" onkeypress="return compruebaalfan(this,event);" maxlength="10" value="" class="input">
					</div>
					<div class="group">
						<label for="pass" class="label">Contraseña</label>
						<input type="password" name="pass" onkeypress="return compruebaalfan(this,event);" maxlength="8" value="" class="input">
					</div>
					<div class="group">
						<input type="button" name="send" value="Iniciar sesión" onclick="compruebayenvia();" class="themeBtn2">
					</div>
					<div class="hr"></div>
					<p class="footer">Jesús Díaz Muñoz &copy; 2019</p>
				</div>

			</div>
		</div>
	</div>
	</form>


</body>
</html>
