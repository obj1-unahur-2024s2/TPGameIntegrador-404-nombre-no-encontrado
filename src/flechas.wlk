import personaje.*
import wollok.game.*
import contador.*
//Clase general de los objetos tipo flecha
const alturaBotones = 0 //cambiar por la coordenada Y de los botones 
const margenDeError = 4 //altura en celdas del sprite + margen de error (0) (fallas si aprietas antes de que se superpongan las flechas)
class Flecha{
  const velocidad = 10 //mas alto = mas lento
  var property id
  var property position = tipo.position()
  var property tipo

  method image() = "flecha-"+ tipo.nombre() +".png"

  method estaEnElFondo() = position.y() <= -4

  method desplazarse(){
    game.onTick(velocidad, id,{
      position = position.down(1)
      if(self.estaEnElFondo()){
        self.resetearPosicion()
      }
    })
  }

  method resetearPosicion(){
    game.removeTickEvent(id)
    position = game.at(position.x(),game.height() + 1)
  }

  method puntaje(){ //nombre temporal, buscar uno mejor
    if(alturaBotones + margenDeError < position.y() or position.y() < alturaBotones){
      BarraDeVida.perderVida()
      self.resetearPosicion()
    }
    else if(position.y() == alturaBotones){
      perfecto.sumarPuntos()
      BarraDeVida.sumarVida()
      self.resetearPosicion()
    }
    else if(position.y() == alturaBotones+1 or position.y() == alturaBotones-1){
      excelente.sumarPuntos()
      BarraDeVida.sumarVida()
      self.resetearPosicion()
    }
    else if(position.y() == alturaBotones+2 or position.y() == alturaBotones-2){
      bien.sumarPuntos()
      BarraDeVida.sumarVida()
      self.resetearPosicion()
    }
    else if(position.y() == alturaBotones+3 or position.y() == alturaBotones-3){
      ok.sumarPuntos()
      BarraDeVida.sumarVida()
      self.resetearPosicion()
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
  var property position = game.at(0,game.height()+1)
  method nombre() = "izquierda"
}
object arriba{
  method position() = izquierda.position().right(4)
  method nombre() = "arriba"
}
object abajo{
  method position() = arriba.position().right(4)
  method nombre() = "abajo"
}
object derecha{
  method position() = abajo.position().right(4)
  method nombre() = "derecha"
}

class DetectorFlecha{
  const tipo //pasarle objeto de puntaje de contador.wlk
  const flechas //pasarle la lista de flechas de su columna
  const position
  method image() = "transparente.png"
  method position() = position
  method detectar(){
    flechas.forEach({flecha => game.onCollideDo(flecha,{tipo.sumarPuntos() flecha.resetearPosicion()})}) //a falta de una forma mejor, chequea si alguna de las flechas lo colisiona, y si lo hace suma el puntaje y la resetea. despues en el game llamamos este método con un onPressDo()
  }
}

class GrupoDetectores{
  const flechas
  const ejeX
  const property detectores = []
  method crearGrupo(){
    const excelente = new DetectorFlecha(tipo = excelente, position = game.at(ejeX,1), flechas = flechas)
    const excelente2 = new DetectorFlecha(tipo = excelente, position = game.at(ejeX,-1), flechas = flechas)
    const bien = new DetectorFlecha(tipo = bien, position = game.at(ejeX,2), flechas = flechas)
    const bien2 = new DetectorFlecha(tipo = bien, position = game.at(ejeX,-2), flechas = flechas)
    const ok = new DetectorFlecha(tipo = ok, position = game.at(ejeX,3), flechas = flechas)
    const ok2 = new DetectorFlecha(tipo = ok, position = game.at(ejeX,-3), flechas = flechas)
    detectores.addAll([excelente,excelente2,bien,bien2,ok,ok2])
  }
}
