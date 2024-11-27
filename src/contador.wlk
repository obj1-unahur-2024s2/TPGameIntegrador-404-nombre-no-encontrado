object puntaje {
	var property puntos = 0
	var property textColor = "FFFFFF"

	method position() = game.at(25, 4)
	
	method text() = puntos.toString()
  method asignarTipoDePuntaje(posicionDeFlecha) {
    self.sumarPuntos(100-20*posicionDeFlecha)
    cartelPuntaje.aparecer(posicionDeFlecha.abs())

    /*
    if (posicionDeFlecha == 0) {
      perfecto.aparecer()
    } else if(posicionDeFlecha.abs() == 1) {
      excelente.aparecer()
    } else if(posicionDeFlecha.abs() == 2) {
      bien.aparecer()
    } else if(posicionDeFlecha.abs() == 3) {
      ok.aparecer()
    }
    */
  }

	method sumarPuntos(puntaje) {
	  puntos += puntaje
	}

	method resetear(){
		puntos = 0
	}

}


object cartelPuntaje {
  var tipoDeCartel = 0
  method image() = "cartel-" + tipoDeCartel + ".png"
  method position() = game.at(16, 8)
  method aparecer(posicionDeFlecha) {
    tipoDeCartel = posicionDeFlecha
    game.addVisual(self)
    game.schedule(500, {game.removeVisual(self)})
  }
}