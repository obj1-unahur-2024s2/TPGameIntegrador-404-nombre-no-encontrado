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
  const position
	method position() = position
	
  method image() = "barraDeVida"+ vida +".png"

  method perderVida() {
	vida = 0.max(vida - 10)
  }

  method sumarVida() {
	vida = 100.max(vida + 10)
  }
}

object tutorialPantalla {

  method position() = game.at(15,0)

  method image() = "tutorialPantalla.png"
}