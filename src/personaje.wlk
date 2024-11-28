import tableroManager.*

object barraDeVida{
  var vida = 100
	method position() = game.at(15,0)
	
  method image() = "barraDeVida"+ vida +".png"

  method vida() = vida

  method perderVida() {
	  if (game.hasVisual(self) and vida > 0){ //verifica que la barra de vida esté en el tablero, si lo está, perder vida
      vida = 0.max(vida - 10)
    }
    else{
      game.schedule(500, {if(not game.hasVisual(derrotaPantalla)){pantallaDerrota.config()}})//agregué un check par aque no intente agregar la pantalla si ya está en el tablero
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