import personaje.*
import wollok.game.*
import contador.*
//Clase general de los objetos tipo flecha
const alturaBotones = 0 //cambiar por la coordenada Y de los botones 
const margenDeError = 4 //altura en celdas del sprite + margen de error (0) (fallas si aprietas antes de que se superpongan las flechas)
class Flecha{
  const velocidad = 50 //mas alto = mas lento
  var property id
  var property tipo
  var property position

  method image() = "flecha-"+ tipo.nombre() +".png"

  method estaEnElFondo() = position.y() <= -4

  method desplazarse(){
    game.onTick(velocidad, id,{
      position = position.down(1)
      if(self.estaEnElFondo()){
        barraDeVida.perderVida() 
        self.resetearPosicion()
      }
    })
  }

  method resetearPosicion(){
    game.removeTickEvent(id)
    position = game.at(position.x(),game.height())
  }
}

//botones sobre los cuales las flechas/marcadores tienen que estar
class BotonFlecha {
    const property tipo
    const property position = tipo.position()
    const flechas

    var imagenPresionada = ""

    var posicionDeFlechaDetectada = 0

    // Método para obtener la imagen según el tipo
    method image() = "boton-flecha-" + tipo.nombre() + imagenPresionada + ".png"

    // Método para manejar la acción de cambiar a la imagen en rojo cuando se presiona la tecla
    method presionarTecla() {
        imagenPresionada = "-presionada"

        game.schedule(300, { imagenPresionada = "" })

        self.detectarFlecha(flechas)

    }

    method detectarFlecha(listaDeFlechas) {
      if (self.hayFlechaCerca(listaDeFlechas)) {
        posicionDeFlechaDetectada = listaDeFlechas.min({f => f.position().y()}).position().y()
        puntaje.asignarTipoDePuntaje(posicionDeFlechaDetectada)
        listaDeFlechas.min({f => f.position().y()}).resetearPosicion()
      }
    }

    method hayFlechaCerca(listaDeFlechas) = listaDeFlechas.any({f => 
        f.position().y().between(-3, 3)
        
      })
}


object izquierda{
  var property position = game.at(0,41)
  method nombre() = "izquierda"
}
object arriba{
  method position() = izquierda.position().right(4)
  method nombre() = "arriba"
}
object abajo{
  method position() = izquierda.position().right(8)
  method nombre() = "abajo"
}
object derecha{
  method position() = izquierda.position().right(12)
  method nombre() = "derecha"
}
