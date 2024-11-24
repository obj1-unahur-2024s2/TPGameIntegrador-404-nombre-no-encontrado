import tablero.*

object puntaje {
	var property puntos = 0
	var property textColor = "FFFFFF"

	method position() = game.at(25, 4)
	
	method text() = puntos.toString()
  method asignarTipoDePuntaje(posicionDeFlecha) {
    self.sumarPuntos(100-20*posicionDeFlecha)
    if (posicionDeFlecha == 0) {
      perfecto.aparecer()
    } else if(posicionDeFlecha.abs() == 1) {
      excelente.aparecer()
    } else if(posicionDeFlecha.abs() == 2) {
      bien.aparecer()
    } else if(posicionDeFlecha.abs() == 3) {
      ok.aparecer()
    }
  }

	method sumarPuntos(puntaje) {
	  puntos += puntaje
	}

	method resetear(){
		puntos = 0
	}

}


class TipoDePuntaje {
  //const puntos
  method image()
  method position() = game.at(16, 8)
  method aparecer() {
    game.addVisual(self)
    game.schedule(500, {game.removeVisual(self)})
  }
}
object perfecto inherits TipoDePuntaje() {
  override method image() = "cartel-perfecto.png"
}

object excelente inherits TipoDePuntaje() {
  override method image() = "cartel-excelente.png"
}

object bien inherits TipoDePuntaje() {
  override method image() = "cartel-bien.png"
}

object ok inherits TipoDePuntaje() {
  override method image() = "cartel-ok.png"
}