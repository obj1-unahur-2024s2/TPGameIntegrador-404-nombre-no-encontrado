import canciones.*
import contador.*
import flechas.*
import listasDeFlechas.*
import personaje.*
import tablero.*

class Pantalla{
	var property image 
	const property position = game.origin()
}

const pantallaInicio = new Pantalla(image = "portadaInicio.jpg")
const modalidadesPantalla = new Pantalla(image = "modalidadJuego.jpg")
const derrotaPantalla = new Pantalla(image = "pantallaPerdiste.png")
const victoriaPantalla = new Pantalla(image = "pantallaGanaste.png")

object botonMenu {
	
	method play (){
		game.sound("botonSonido.mp3").play()
	}
}

object musicaMenu{
var musica = game.sound("menuMusica.mp3")

	method play (){
		musica = game.sound("menuMusica.mp3")
		musica.shouldLoop(true)
		musica.volume(0.3)
		musica.play()
	}
	
	method stop(){
		musica.stop()
	}
}