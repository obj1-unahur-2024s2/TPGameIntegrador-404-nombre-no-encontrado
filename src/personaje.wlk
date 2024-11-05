class Jugador {
  const barraDeVida
  
  method perderVida() {
    barraDeVida.perderVida()
  }

  method sumarVida() {
    barraDeVida.sumarVida()
  }

  method controles(){}
}

class BarraDeVida{
  var vida = 100
	const division
  const position
	method position() = position
	
	//method image() = "barraDeVida" + calculo.barra(jugador.vida(),division)  + ".png"
  method image() = "barraDeVida"+ vida +".png"

  method perderVida() {
	vida = 0.max(vida - 10)
  }

  method sumarVida() {
	vida = 100.max(vida + 10)
  }
}
/*
object calculo{
	
	method barra(tipoBarra, division) = ((tipoBarra / division).truncate(0)*10 ).toString()
}
*/