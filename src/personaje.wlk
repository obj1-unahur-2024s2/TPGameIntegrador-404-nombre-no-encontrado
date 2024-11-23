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

object barraDeVida{
  var vida = 100
	method position() = game.at(15,0)
	
  method image() = "barraDeVida"+ vida +".png"

  method perderVida() {
	  if (game.hasVisual(self)){ //verifica que la barra de vida esté en el tablero, si lo está, perder vida
      vida = 0.max(vida - 10)
    }
  }

  method sumarVida() {
    if (game.hasVisual(self)){ //verifica que la barra de vida esté en el tablero, si lo está, perder vida
	    vida = 100.max(vida + 10)
    }
  }
}

object tutorialPantalla {

  method position() = game.at(15,0)

  method image() = "tutorialPantalla.png"
}