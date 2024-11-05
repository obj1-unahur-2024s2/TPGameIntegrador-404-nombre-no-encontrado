class Jugador {
  var property vida = 100

  method perderVida() {
	vida = vida - 10
  }

  method sumarVida() {
	vida = vida + 10
  }

  method controles(){}
}

class BarraDeVida{
	const property jugador
	const division
  const position
	method position() = position
	
	//method image() = "barraDeVida" + calculo.barra(jugador.vida(),division)  + ".png"
  method image() = "baraDeVida"+jugador.vida()+".png"
}
/*
object calculo{
	
	method barra(tipoBarra, division) = ((tipoBarra / division).truncate(0)*10 ).toString()
}
*/