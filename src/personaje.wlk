import tableroManager.*

object barraDeVida{
  var vida = 100
	method position() = game.at(15,0)
	
  method image() = "barraDeVida"+ vida +".png"

  method perderVida() {
	  if (game.hasVisual(self)){ //verifica que la barra de vida esté en el tablero, si lo está, perder vida
      vida = 0.max(vida - 10)
    }
    if (vida <= 0) {
      game.schedule(500, {pantallaDerrota.config()} )
    }
  }

  method sumarVida() {
    if (game.hasVisual(self)){ //verifica que la barra de vida esté en el tablero, si lo está, perder vida
	    vida = 100.max(vida + 10)
    }
  }

  method inicializar(){
    vida = 100
    self.position()
    self.image()
    
  }
}

object tutorialPantalla {

  method position() = game.at(15,0)

  method image() = "tutorialPantalla.png"
}