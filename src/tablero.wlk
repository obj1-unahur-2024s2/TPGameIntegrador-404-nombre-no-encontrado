import wollok.game.*
import contador.*
import flechas.*
import listasDeFlechas.*
import canciones.*
import personaje.*
import tableroManager.*

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
    game.title("Melody Hero")
    game.boardGround("fondo-arcade.png")
    
    game.schedule (20,{musicaMenu.play()}) //musica del menu
    game.addVisual(pantallaInicio)    // Añadir la pantalla de inicio al juego

    //var contFlechas = 0
    //APRETAR enter Y EMPIEZA EL JUEGO
    keyboard.enter().onPressDo({
      botonMenu.play()
      game.removeVisual(pantallaInicio)  // Quitar pantalla de inicio
      game.addVisual(modalidadesPantalla)
      self.menuModalidades()
    
      //self.inicializarFlechas(flyMeToTheMoon)
    })

    keyboard.l().onPressDo({
      game.removeVisual(pantallaInicio)  // Quitar pantalla de inicio

      self.inicializarFlechas(hipShop)
    }) 
  }

  method menuReset() {		
		  self.inicializar()
  }

  method menuModalidades(){

      keyboard.z().onPressDo{
        tutorial.configurar()
        botonMenu.play()
        game.removeVisual(modalidadesPantalla)
        
		  }
      keyboard.x().onPressDo{
        facil.configurar()
        botonMenu.play()
        game.removeVisual(modalidadesPantalla)
        
		  }
      keyboard.c().onPressDo{
        normal.configurar()
        botonMenu.play()
        game.removeVisual(modalidadesPantalla)
        
		  }
    }

  method inicializarFlechas(cancion){

    //configurar las flechas
    izquierda.position(game.at(0,40))
    //console.println(izquierda.position())
    const flechasIzquierda = new FlechasIzquierda()
    const flechasArriba = new FlechasArriba()
    const flechasAbajo = new FlechasAbajo()
    const flechasDerecha = new FlechasDerecha()
    //añadir las flechas
    flechasIzquierda.lista().forEach({flecha => game.addVisual(flecha)})
    flechasArriba.lista().forEach({flecha => game.addVisual(flecha)})
    flechasAbajo.lista().forEach({flecha => game.addVisual(flecha)})
    flechasDerecha.lista().forEach({flecha => game.addVisual(flecha)})

    //detectores
    //const detectoresIzquierda = new GrupoDetectores(flechas = flechasIzquierda, ejeX = 0)
    //const detectoresArriba = new GrupoDetectores(flechas = flechasArriba, ejeX = 4)
    //const detectoresAbajo = new GrupoDetectores(flechas = flechasAbajo, ejeX = 8)
    //const detectoresDerecha = new GrupoDetectores(flechas = flechasDerecha, ejeX = 12)

    //añadir los detectores
    //detectoresIzquierda.detectores().forEach({detector => game.addVisual(detector)})
    //detectoresArriba.detectores().forEach({detector => game.addVisual(detector)})
    //detectoresAbajo.detectores().forEach({detector => game.addVisual(detector)})
    //detectoresDerecha.detectores().forEach({detector => game.addVisual(detector)})

    // Crear botones y asignar posición
    izquierda.position(game.origin())
    //console.println(izquierda.position())
    const botonIzquierda = new BotonFlecha(tipo = izquierda, flechas = flechasIzquierda.lista())
    const botonArriba = new BotonFlecha(tipo = arriba, flechas = flechasArriba.lista())
    const botonAbajo = new BotonFlecha(tipo = abajo, flechas = flechasAbajo.lista())
    const botonDerecha = new BotonFlecha(tipo = derecha ,flechas = flechasDerecha.lista())
    //const barraDeVida = new BarraDeVida(position = game.at(15,0))
    // Añadir los botones al juego
    game.addVisual(botonArriba)
    game.addVisual(botonAbajo)
    game.addVisual(botonIzquierda)
    game.addVisual(botonDerecha)
    //game.addVisual(barraDeVida)
    game.addVisual(puntaje)

    // Configurar teclas
    keyboard.w().onPressDo({  botonArriba.presionarTecla()
                                /*detectoresArriba.detectores().forEach({detector => detector.detectar()})*/
                              })
    keyboard.s().onPressDo({  botonAbajo.presionarTecla()
                                /*detectoresAbajo.detectores().forEach({detector => detector.detectar()})*/
                              })
    keyboard.a().onPressDo({  botonIzquierda.presionarTecla()
                                /*detectoresIzquierda.detectores().forEach({detector => detector.detectar()})*/
                              })
    keyboard.d().onPressDo({  botonDerecha.presionarTecla()
                                /*detectoresDerecha.detectores().forEach({detector => detector.detectar()})*/
                              })

    //DEBUG - apretar p para probar el efecto de los carteles de puntaje
    keyboard.p().onPressDo({ perfecto.aparecer()})
    keyboard.o().onPressDo({ excelente.aparecer()})
    keyboard.i().onPressDo({ bien.aparecer()})
    keyboard.u().onPressDo({ ok.aparecer()})

    cancion.initialize(flechasIzquierda,flechasArriba,flechasAbajo,flechasDerecha)
  }
    
}
