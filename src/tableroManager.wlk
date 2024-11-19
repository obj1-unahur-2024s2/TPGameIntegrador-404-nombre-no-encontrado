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

const pantallaInicio = new Pantalla(image = "assets/portadaInicio.png")
const modalidadesPantalla = new Pantalla(image = "assets/modalidadJuego.png")
const derrotaPantalla = new Pantalla(image = "assets/pantallaPerdiste.png")
const victoriaPantalla = new Pantalla(image = "assets/pantallaGanaste.png")

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