object protagonista {
  var property vida = 100

  method perderVida() {
	vida = vida - 10
  }

  method sumarVida() {
	vida = vida + 10
  }
}

class BarraDeVida{
	
	const division
  const position
	method position() = position
	
	method image() = "barraDeVida" + calculo.barra(protagonista.vida(),division)  + ".png"
}

object calculo{
	
	method barra(tipoBarra, division) = ((tipoBarra / division).truncate(0)*10 ).toString()
}