import wollok.game.*
import contador.*
import flechas.*
import listasDeFlechas.*
import canciones.*
import personaje.*
//init del tablero
/*
  la idea sería usar una grilla 3 o 4 (o más de ser necesario) veces más densa que los sprite de las flechas,
  es decir, si el sprite es de 64px por 64px, cada celda de la grilla tendría que ser de 16px de lado.
  De esta forma podríamos tener un movimiento un poco mas fluido para las flechas, y permitirnos obtener diferentes
  puntajes en base a la precisión del jugador.
  después para los Menús ya si se podría usar una grilla menos densa y usar el tipo de objeto con el movimiento ya
  implementado 
*/
object tablero{

  method inicializar(){
    game.width(38)
    game.height(40)
    game.cellSize(16)
    game.title("Tablero")
    game.boardGround("fondo-arcade.png")
    

    // Añadir la pantalla de inicio al juego
    game.addVisual(pantallaInicio)

    //var contFlechas = 0
    //APRETAR enter Y EMPIEZA EL JUEGO
    keyboard.enter().onPressDo({
      game.removeVisual(pantallaInicio)  // Quitar pantalla de inicio
      
      self.inicializarFlechas(flyMeToTheMoon)

    })

    keyboard.l().onPressDo({
      game.removeVisual(pantallaInicio)  // Quitar pantalla de inicio
       // Crear botones y asignar posición
      self.inicializarFlechas(hipShop)
    }) 
  }

  method inicializarFlechas(cancion){
    // Crear botones y asignar posición
      izquierda.position(game.origin())
      const botonIzquierda = new BotonFlecha(tipo = izquierda)
      const botonArriba = new BotonFlecha(tipo = arriba)
      const botonAbajo = new BotonFlecha(tipo = abajo)
      const botonDerecha = new BotonFlecha(tipo = derecha)
      const barraDeVida = new BarraDeVida(position = game.at(15,0))
      // Añadir los botones al juego
      game.addVisual(botonArriba)
      game.addVisual(botonAbajo)
      game.addVisual(botonIzquierda)
      game.addVisual(botonDerecha)
      game.addVisual(barraDeVida)
      game.addVisual(puntaje)

      //configurar las flechas y detectores
      izquierda.position(game.at(0,game.height()+1))
      const flechasIzquierda = new FlechasIzquierda()
      const detectoresIzquierda = new GrupoDetectores(flechas = flechasIzquierda, ejeX = 0)
      const flechasArriba = new FlechasArriba()
      const detectoresArriba = new GrupoDetectores(flechas = flechasArriba, ejeX = 4)
      const flechasAbajo = new FlechasAbajo()
      const detectoresAbajo = new GrupoDetectores(flechas = flechasAbajo, ejeX = 8)
      const flechasDerecha = new FlechasDerecha()
      const detectoresDerecha = new GrupoDetectores(flechas = flechasDerecha, ejeX = 12)
      //añadir las flechas y detectores
      flechasIzquierda.lista().forEach({flecha => game.addVisual(flecha)})
      detectoresIzquierda.detectores().forEach({detector => game.addVisual(detector)})
      flechasArriba.lista().forEach({flecha => game.addVisual(flecha)})
      detectoresArriba.detectores().forEach({detector => game.addVisual(detector)})
      flechasAbajo.lista().forEach({flecha => game.addVisual(flecha)})
      detectoresAbajo.detectores().forEach({detector => game.addVisual(detector)})
      flechasDerecha.lista().forEach({flecha => game.addVisual(flecha)})
      detectoresDerecha.detectores().forEach({detector => game.addVisual(detector)})

      // Configurar teclas
      keyboard.w().onPressDo({  botonArriba.presionarTecla()
                                  detectoresArriba.detectores().forEach({detector => detector.detectar()})
                                })
      keyboard.s().onPressDo({  botonAbajo.presionarTecla()
                                  detectoresAbajo.detectores().forEach({detector => detector.detectar()})
                                })
      keyboard.a().onPressDo({  botonIzquierda.presionarTecla()
                                  detectoresIzquierda.detectores().forEach({detector => detector.detectar()})
                                })
      keyboard.d().onPressDo({  botonDerecha.presionarTecla()
                                  detectoresDerecha.detectores().forEach({detector => detector.detectar()})
                                })

      //DEBUG - apretar p para probar el efecto de los carteles de puntaje
      keyboard.p().onPressDo({ perfecto.aparecer()})
      keyboard.o().onPressDo({ excelente.aparecer()})
      keyboard.i().onPressDo({ bien.aparecer()})
      keyboard.u().onPressDo({ ok.aparecer()})

      cancion.initialize(flechasIzquierda,flechasArriba,flechasAbajo,flechasDerecha)
  }
    
}
object pantallaInicio {
  method image() = "portadaInicio.jpg"      // La imagen de inicio que cubrirá toda la pantalla
  method position() = game.at(0,0)  // Posición en la esquina superior izquierda
}
