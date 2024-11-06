import personaje.*
import wollok.game.*
import contador.*
//Clase general de los objetos tipo flecha
const alturaBotones = 0 //cambiar por la coordenada Y de los botones 
const margenDeError = 4 //altura en celdas del sprite + margen de error (0) (fallas si aprietas antes de que se superpongan las flechas)
class Flecha{
  const velocidad = 96 //mas alto = mas lento
  var property id
  var property position = tipo.position()
  var property tipo

    method image() = "flecha-"+ tipo.nombre() +".png"


  method desplazarse(){
    //console.println("ejecuta el método") //debug
    game.onTick(velocidad, id,{
      position = position.down(1)
      //console.println("HAY MOVIMIENTO!!!") //debug
      if(position.y() <= -4){
        game.removeTickEvent(id)
        game.removeVisual(self)
        //console.println("flecha detenida") //debug
      }
    })
  }

  method resetearPosicion(){
    position = position.up(25)
  }

  method puntaje(){ //nombre temporal, buscar uno mejor
    if(alturaBotones + margenDeError < position.y() or position.y() < alturaBotones){
      BarraDeVida.perderVida()
    }
    else if(position.y() == alturaBotones){
      perfecto.sumarPuntos()
      BarraDeVida.sumarVida()
    }
    else if(position.y() == alturaBotones+1 or position.y() == alturaBotones-1){
      excelente.sumarPuntos()
      BarraDeVida.sumarVida()
    }
    else if(position.y() == alturaBotones+2 or position.y() == alturaBotones-2){
      bien.sumarPuntos()
      BarraDeVida.sumarVida()
    }
    else if(position.y() == alturaBotones+3 or position.y() == alturaBotones-3){
      ok.sumarPuntos()
      BarraDeVida.sumarVida()
    }
  }
}

//botones sobre los cuales las flechas/marcadores tienen que estar
class BotonFlecha {
    var property tipo // Puede ser "arriba", "abajo", "izquierda", "derecha"
    var property position
    var property imagenPresionada = ""
    //"flecha-" + tipo + ".png"

    // Método para obtener la imagen según el tipo
    method image() = "boton-flecha-" + tipo + imagenPresionada + ".png"

    // Método para manejar la acción de cambiar a la imagen en rojo cuando se presiona la tecla
    method presionarTecla() {
        //var imagenOriginal = self.image() // Guardar la imagen original

        // Cambiar la imagen a la versión en azul
        imagenPresionada = "-presionada"
        //console.println("presionaste la tecla")

        // Volver a la imagen original después de un corto tiempo
        game.schedule(300, { imagenPresionada = "" })
    }
}


object izquierda{
  var property position = game.at(0,10)
  method nombre() = "izquierda"
}
object arriba{
  method position() = izquierda.position().right(4)
  method nombre() = "arriba"
}
object abajo{
  method position() = arriba.position().right(4)
  method nombre() = "derecha"
}
object derecha{
  method position() = abajo.position().right(4)
  method nombre() = "abajo"
}