import wollok.game.*
import contador.*
import flechas.*
import listasDeFlechas.*
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
       // Crear botones y asignar posición
      const botonArriba = new BotonFlecha(tipo = "arriba", position = game.at(4, 0))
      const botonAbajo = new BotonFlecha(tipo = "abajo", position = game.at(8, 0))
      const botonIzquierda = new BotonFlecha(tipo = "izquierda", position = game.at(0, 0))
      const botonDerecha = new BotonFlecha(tipo = "derecha", position = game.at(12, 0))
      var barraDeVida = new BarraDeVida(position = game.at(15,0))
      // Añadir los botones al juego
      game.addVisual(botonArriba)
      game.addVisual(botonAbajo)
      game.addVisual(botonIzquierda)
      game.addVisual(botonDerecha)
      game.addVisual(barraDeVida)
      game.addVisual(puntaje)

      // Configurar teclas
      keyboard.w().onPressDo({ botonArriba.presionarTecla() })
      keyboard.s().onPressDo({ botonAbajo.presionarTecla() })
      keyboard.a().onPressDo({ botonIzquierda.presionarTecla() })
      keyboard.d().onPressDo({ botonDerecha.presionarTecla() })

      izquierda.position(game.at(0,35))
      const flechasIzquierda = new FlechasIzquierda()
      const flechasArriba = new FlechasArriba()
      const flechasAbajo = new FlechasAbajo()
      const flechasDerecha = new FlechasDerecha()
      flechasIzquierda.lista().forEach({flecha => game.addVisual(flecha)})
      flechasArriba.lista().forEach({flecha => game.addVisual(flecha)})
      flechasAbajo.lista().forEach({flecha => game.addVisual(flecha)})
      flechasDerecha.lista().forEach({flecha => game.addVisual(flecha)})
      
      self.bilieJean(flechasIzquierda,flechasArriba,flechasAbajo,flechasDerecha)
      
      /*
      game.onTick(480*4, "spawn flecha izq", {
        //console.println(contFlechas) //debug
        var flecha = new Flecha(tipo=izquierda,id=contFlechas)
        contFlechas += 1
        game.addVisual(flecha)
        flecha.desplazarse()
        game.schedule(240,{
          flecha = new Flecha(tipo=arriba,id=contFlechas)
          contFlechas +=1
          game.addVisual(flecha)
          flecha.desplazarse()
        })
        game.schedule(480,{
          flecha = new Flecha(tipo=abajo,id=contFlechas)
          contFlechas+= 1
          game.addVisual(flecha)
          flecha.desplazarse()
        })
        game.schedule(720,{
        flecha = new Flecha(tipo=derecha,id=contFlechas)
        contFlechas+= 1
        game.addVisual(flecha)
        flecha.desplazarse()
        })
      })
      */

    })
    
    /*
    const bgm = game.sound("bgm.mp3")
 	  bgm.shouldLoop(true)
	  bgm.volume(0.25)
    keyboard.q().onPressDo({
		  bgm.play()
		})
	  keyboard.r().onPressDo({
      bgm.stop()
    })
    */

    
  }

  //posible implementacion de canciones, va a ser una banda --Maty
  method bilieJean(izq,arr,abj,der){ 
    const mjBillieJean = game.sound("mj-billie-jean.mp3")
    mjBillieJean.volume(0.25) 
    mjBillieJean.play()
    game.schedule(1200,{ 
      game.schedule(4150,{arr.desplazarFlecha()})
      game.schedule(4340,{abj.desplazarFlecha()})
      game.schedule(4680,{der.desplazarFlecha()})
      game.schedule(4940,{arr.desplazarFlecha()})
      game.schedule(5180,{izq.desplazarFlecha()})
      game.schedule(5460,{der.desplazarFlecha()})
      game.schedule(5700,{abj.desplazarFlecha()})
      game.schedule(5960,{der.desplazarFlecha()})
    })
}
    
}
object pantallaInicio {
  method image() = "pantallaInicio.jpg"      // La imagen de inicio que cubrirá toda la pantalla
  method position() = game.at(0, 0)  // Posición en la esquina superior izquierda
}
