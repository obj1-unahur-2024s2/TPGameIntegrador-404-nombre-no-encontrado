// src/canciones.wlk
class Cancion{
    method initialize()
    const delay = 0
    method tirarFlecha(pausa, flecha){
        game.schedule(pausa,{flecha.desplazarFlecha()})
    }

    method reproducir(lista, posicion){
      if(posicion <= lista.size()){
        var tiempo = lista[posicion][0]
        var flecha = lista[posicion][1]
        game.schedule(tiempo,{
          flecha.desplazarFlecha()
          self.reproducir(lista, posicion+1)
        })
      }
      else{
        //lógica de ganaste y esas cosas
      }
    }
}
object flyMeToTheMoon inherits Cancion{
    method initialize(izquierda,arriba,abajo,derecha){
        const fsFlyMeToTheMoon = game.sound("Fly Me To The Moon.mp3")
        const listaDeFlechas = [
        [7800,arriba],          /*fly*/
        [600,derecha],         //me
        [500,izquierda],       //to
        [400,izquierda],       //the
        [400,abajo],           //moon

        [1100,arriba],         //let
        [300,arriba],         //me
        [600,izquierda],      //play
        [1300,abajo],          //among the
        [700,derecha],        //stars

        [2000,arriba],         //let
        [600,derecha],        //me
        [500,izquierda],      //see
        [500,abajo],          //what
        [400,abajo],          //spring
        [600,izquierda],      //is
        [4000,derecha],        //like
        [500,arriba],         //on
        [1400,arriba],         //a ju-
        [500,derecha],        //-piter 
        [500,abajo],          //and mars

        [2000,izquierda],      //in other
        [500,derecha],        //words

        [2500,arriba],        //hold
        [1000,izquierda],     //my
        [500,derecha],       //hand

        [3000,abajo],          //in other
        [1000,izquierda],      //words

        [2600,arriba],         //ba-
        [500,derecha],       //-by
        [500,izquierda],       //kiss
        [400,izquierda],       //me

        [3700,arriba],       //fill
        [500,derecha],       //my
        [600,derecha],       //heart with
        [600,abajo],       //song
        [800,izquierda],       //and
        [500,arriba],       //let me
        [800,derecha],       //sing
        [800,izquierda],       //forever
        [1100,abajo],       //more

        [2100,izquierda],       //you
        [1100,derecha],       //are
        [400,derecha],       //all i
        [600,abajo],       //long
        [400,derecha],       //for
        [700,izquierda],       //all
        [600,arriba],       //i wor-
        [800,derecha],       //-ship
        [800,izquierda], /*and a- dore*/
        [600,abajo] 
        ]
        fsFlyMeToTheMoon.volume(0.25)
        fsFlyMeToTheMoon.play()
        //listaDeFlechas.forEach({k,v => self.tirarFlecha(k, v)})
  }
}

object billieJean inherits Cancion{
  //posible implementacion de canciones, va a ser una banda --Maty
  method initialize(izq,arr,abj,der){ 
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

object hipShop inherits Cancion{
  //Siento que esta es un buen tutorial o Facil
  //Intente separarlo por tiempos
  method initialize(izquierda,arriba,abajo,derecha) {
      const fsHipShop = game.sound("Hip Shop.mp3")
      const listaDeFlechas = new Dictionary()
      listaDeFlechas.put(2500 + delay,abajo)
      listaDeFlechas.put(3400 + delay,derecha)
      listaDeFlechas.put(3700 + delay,arriba)
      listaDeFlechas.put(4200 + delay,derecha)
      listaDeFlechas.put(4600 + delay,abajo)

      listaDeFlechas.put(7100 + delay,izquierda)
      listaDeFlechas.put(7300 + delay,abajo)
      listaDeFlechas.put(7400 + delay,derecha)

      listaDeFlechas.put(8300 + delay,izquierda)
      listaDeFlechas.put(8700 + delay,abajo)
      listaDeFlechas.put(9200 + delay,derecha)
      listaDeFlechas.put(9600 + delay,abajo)

      listaDeFlechas.put(12400 + delay,arriba)

      listaDeFlechas.put(14500 + delay,izquierda)
      listaDeFlechas.put(14700 + delay,arriba)
      listaDeFlechas.put(14800 + delay,arriba)
      listaDeFlechas.put(15300 + delay,derecha)
      listaDeFlechas.put(15800 + delay,abajo)

      listaDeFlechas.put(17300 + delay,izquierda)
      listaDeFlechas.put(17800 + delay,izquierda)
      listaDeFlechas.put(18200 + delay,abajo)
      listaDeFlechas.put(18500 + delay,derecha)
      listaDeFlechas.put(19000 + delay,derecha)
      listaDeFlechas.put(19500 + delay,arriba)

      listaDeFlechas.put(24400 + delay,arriba)
      listaDeFlechas.put(24600 + delay,derecha)
      listaDeFlechas.put(24700 + delay,arriba)
      listaDeFlechas.put(25200 + delay,abajo)
      listaDeFlechas.put(25700 + delay,abajo)

      listaDeFlechas.put(27200 + delay,izquierda)
      listaDeFlechas.put(27700 + delay,abajo)
      listaDeFlechas.put(28100 + delay,izquierda)
      listaDeFlechas.put(28400 + delay,derecha)
      listaDeFlechas.put(28900 + delay,abajo)
      listaDeFlechas.put(29400 + delay,arriba)

      listaDeFlechas.put(34300 + delay,derecha)
      listaDeFlechas.put(34500 + delay,arriba)
      listaDeFlechas.put(34600 + delay,izquierda)

      listaDeFlechas.put(35600 + delay,derecha)
      listaDeFlechas.put(35900 + delay,izquierda)
      listaDeFlechas.put(36300 + delay,arriba)
      listaDeFlechas.put(36800 + delay,arriba)

      listaDeFlechas.put(38000 + delay,izquierda)
      listaDeFlechas.put(38200 + delay,derecha)
      listaDeFlechas.put(38300 + delay,abajo)
      listaDeFlechas.put(38800 + delay,abajo)

      listaDeFlechas.put(39300 + delay,arriba)
      
      fsHipShop.volume(0.25)
      fsHipShop.play()
      listaDeFlechas.forEach({k,v => self.tirarFlecha(k, v)})

    }


}

object theSoundOfSilence inherits Cancion {
  method initialize(izquierda,arriba,abajo,derecha) {
    const fsTheSoundOfSilence = game.sound("The Sound of Silence.mp3")
    const listaDeFlechas = new Dictionary()
    listaDeFlechas.put(10600 + delay,arriba) //hello
    listaDeFlechas.put(11400 + delay,abajo) //darkness
    listaDeFlechas.put(12100 + delay,arriba) //my old
    listaDeFlechas.put(13300 + delay,derecha)  //friend

    listaDeFlechas.put(16100 + delay,abajo) //I've
    listaDeFlechas.put(16500 + delay,izquierda) //come
    listaDeFlechas.put(17100 + delay,abajo) //to talk
    listaDeFlechas.put(17800 + delay,derecha) //with you
    listaDeFlechas.put(19200 + delay,abajo) //again

    listaDeFlechas.put(22000 + delay,arriba) //because
    listaDeFlechas.put(22800 + delay,derecha) //of
    listaDeFlechas.put(23100 + delay,izquierda) //visions
    listaDeFlechas.put(23800 + delay,derecha) //softly
    listaDeFlechas.put(25300 + delay,derecha) //creeping

    listaDeFlechas.put(28000 + delay,izquierda) //left
    listaDeFlechas.put(28500 + delay,abajo) //it's seeds
    listaDeFlechas.put(29300 + delay,abajo) //while
    listaDeFlechas.put(29700 + delay,arriba) //I
    listaDeFlechas.put(30200 + delay,derecha) //was
    listaDeFlechas.put(31100 + delay,arriba) //sleeping

    listaDeFlechas.put(34000 + delay,abajo) //and
    listaDeFlechas.put(34500 + delay,izquierda) //the vision
    listaDeFlechas.put(37000 + delay,derecha) //that was
    listaDeFlechas.put(37700 + delay,abajo) //planted
    listaDeFlechas.put(39300 + delay,arriba) //in my
    listaDeFlechas.put(40300 + delay,abajo) //brain
    
    listaDeFlechas.put(42400 + delay,izquierda) //still
    listaDeFlechas.put(44000 + delay,arriba) //remains
    listaDeFlechas.put(47000 + delay,abajo) //whitin
    listaDeFlechas.put(47700 + delay,derecha) //the sound
    listaDeFlechas.put(50500 + delay,abajo) //of silence

    listaDeFlechas.put(54100 + delay,derecha) //in restless
    listaDeFlechas.put(55200 + delay,izquierda) //dreams i
    listaDeFlechas.put(56000 + delay,derecha) //walked alone
    listaDeFlechas.put(60000 + delay,arriba) //narrow
    listaDeFlechas.put(60900 + delay,abajo) //streets
    listaDeFlechas.put(61400 + delay,arriba) //of cobellstone

    listaDeFlechas.put(66000 + delay,abajo) //'Neath 
    listaDeFlechas.put(66500 + delay,izquierda) //the halo
    listaDeFlechas.put(67800 + delay,izquierda) //of a
    listaDeFlechas.put(69000 + delay,abajo) //street
    listaDeFlechas.put(69500 + delay,arriba) //lamp

    listaDeFlechas.put(71500 + delay,abajo) //i
    listaDeFlechas.put(71900 + delay,derecha) //turned 
    listaDeFlechas.put(72200 + delay,arriba) //my collar
    listaDeFlechas.put(73200 + delay,abajo) //to the
    listaDeFlechas.put(74000 + delay,izquierda) //cold 
    listaDeFlechas.put(74800 + delay,arriba) //and damped

    listaDeFlechas.put(77600 + delay,derecha) //when
    listaDeFlechas.put(78000 + delay,abajo) //my eyes
    listaDeFlechas.put(79100 + delay,derecha) //were stabbed
    listaDeFlechas.put(80500 + delay,izquierda) //by
    listaDeFlechas.put(81100 + delay,abajo) //the flash
    listaDeFlechas.put(82300 + delay,arriba) //of a
    listaDeFlechas.put(82700 + delay,abajo)   //neon
    listaDeFlechas.put(83700 + delay,derecha) //light
    listaDeFlechas.put(86000 + delay,izquierda) //that split
    listaDeFlechas.put(87300 + delay,abajo) //the night
    listaDeFlechas.put(90200 + delay,arriba) //and touched
    listaDeFlechas.put(91000 + delay,arriba) //the sound
    listaDeFlechas.put(93800 + delay,abajo) //of silence

    listaDeFlechas.put(97300 + delay,derecha) // and in
    listaDeFlechas.put(98000 + delay,abajo) //the naked
    listaDeFlechas.put(99000 + delay,izquierda) //light I
    listaDeFlechas.put(100000 + delay,arriba) //Saw

    listaDeFlechas.put(102900 + delay,abajo) //10 thousand
    listaDeFlechas.put(104000 + delay,arriba) //people
    listaDeFlechas.put(104900 + delay,abajo) //maybe more

    listaDeFlechas.put(109000 + delay,derecha) //people 
    listaDeFlechas.put(109800 + delay,izquierda) //talking
    listaDeFlechas.put(110000 + delay,arriba) //without
    listaDeFlechas.put(111000 + delay,izquierda) // speakin

    listaDeFlechas.put(114700 + delay,izquierda) //people
    listaDeFlechas.put(115500 + delay,derecha) //hearing
    listaDeFlechas.put(116100 + delay,abajo) //whitout
    listaDeFlechas.put(117400 + delay,derecha) //listening

    listaDeFlechas.put(119000 + delay,abajo) //people
    listaDeFlechas.put(119900 + delay,abajo) //writing 
    listaDeFlechas.put(120000 + delay,arriba) //SONGS
    listaDeFlechas.put(123000 + delay,derecha) // that 
    listaDeFlechas.put(123800 + delay,izquierda) // voices
    listaDeFlechas.put(125200 + delay,abajo) //never
    listaDeFlechas.put(126200 + delay,derecha) //shared

    listaDeFlechas.put(128700 + delay,abajo) //  no one
    listaDeFlechas.put(129900 + delay,izquierda) // dared

    listaDeFlechas.put(132700 + delay,arriba) // disturb
    listaDeFlechas.put(133200 + delay,derecha) // the 
    listaDeFlechas.put(133700 + delay,derecha) //sound
    listaDeFlechas.put(136100 + delay,abajo) //of
    listaDeFlechas.put(136500 + delay,izquierda) //SILENCE

    listaDeFlechas.put(139900 + delay,arriba) // FOOLS
    listaDeFlechas.put(140300 + delay,izquierda) //SAYED 
    listaDeFlechas.put(140800 + delay,abajo) //I
    listaDeFlechas.put(141100 + delay,izquierda) //YOU 
    listaDeFlechas.put(141500 + delay,arriba) //DO NOT
    listaDeFlechas.put(142400 + delay,derecha) //KOOOOOOW

    listaDeFlechas.put(145500 + delay,abajo) // silence
    listaDeFlechas.put(146500 + delay,abajo) //like
    listaDeFlechas.put(146800 + delay,derecha) // a 
    listaDeFlechas.put(147000 + delay,izquierda) //cancer
    listaDeFlechas.put(148200 + delay,derecha) //GROOOOOWS

    listaDeFlechas.put(151200 + delay,izquierda) //hear
    listaDeFlechas.put(151500 + delay,arriba) //my
    listaDeFlechas.put(152000 + delay,derecha) //words
    listaDeFlechas.put(152400 + delay,arriba) //that i
    listaDeFlechas.put(153000 + delay,abajo) //might 
    listaDeFlechas.put(154000 + delay,derecha) //teach
    listaDeFlechas.put(154500 + delay,izquierda) //you 

    listaDeFlechas.put(156600 + delay,derecha) //take 
    listaDeFlechas.put(157100 + delay,abajo) //my 
    listaDeFlechas.put(157600 + delay,izquierda) //arm
    listaDeFlechas.put(157900 + delay,abajo) //that i
    listaDeFlechas.put(158400 + delay,arriba) //might
    listaDeFlechas.put(159300 + delay,izquierda) //reach
    listaDeFlechas.put(159900 + delay,derecha) //youuu

    listaDeFlechas.put(162400 + delay,abajo) //but 
    listaDeFlechas.put(162700 + delay,derecha) // my 
    listaDeFlechas.put(163200 + delay,abajo) //words
    listaDeFlechas.put(165200 + delay,arriba) //like
    listaDeFlechas.put(165700 + delay,izquierda) //silent
    listaDeFlechas.put(167300 + delay,derecha) //raindrops
    listaDeFlechas.put(168400 + delay,abajo) //fell

    listaDeFlechas.put(170700 + delay,derecha) // oh oh oh

    listaDeFlechas.put(172800 + delay,arriba) // echoed
    listaDeFlechas.put(173800 + delay,derecha) //in the wellS
    listaDeFlechas.put(176626 + delay,arriba) // of silence

    listaDeFlechas.put(180500 + delay,abajo) //and the
    listaDeFlechas.put(181400 + delay,izquierda) // people
    listaDeFlechas.put(182000 + delay,arriba) // bowed
    listaDeFlechas.put(182500 + delay,abajo) // and prayed
    listaDeFlechas.put(186000 + delay,derecha) //to the
    listaDeFlechas.put(186600 + delay,arriba) // neon
    listaDeFlechas.put(187500 + delay,abajo) // god
    listaDeFlechas.put(188600 + delay,derecha) //they
    listaDeFlechas.put(189300 + delay,izquierda) //made

    listaDeFlechas.put(191600 + delay,arriba) //andthe
    listaDeFlechas.put(192200 + delay,derecha) // sign
    listaDeFlechas.put(192600 + delay,derecha) //flahsed out
    listaDeFlechas.put(193500 + delay,abajo) //it's 
    listaDeFlechas.put(194400 + delay,izquierda) //warning

    listaDeFlechas.put(197300 + delay,derecha) // In the
    listaDeFlechas.put(198000 + delay,abajo) //word that
    listaDeFlechas.put(198700 + delay,izquierda) // it was
    listaDeFlechas.put(200100 + delay,abajo) // forming

    listaDeFlechas.put(202800 + delay,arriba) //and the
    listaDeFlechas.put(203500 + delay,izquierda) // sign
    listaDeFlechas.put(204300 + delay,arriba) //sayed: 
    listaDeFlechas.put(204700 + delay,abajo) // "the words
    listaDeFlechas.put(205700 + delay,derecha) // on the
    listaDeFlechas.put(206300 + delay,izquierda) // prophets
    listaDeFlechas.put(207000 + delay,derecha) //are 
    listaDeFlechas.put(207700 + delay,abajo) //writteen on
    listaDeFlechas.put(208900 + delay,arriba) //  the subway
    listaDeFlechas.put(210300 + delay,arriba) //walls
    listaDeFlechas.put(212400 + delay,izquierda) //and tenement
    listaDeFlechas.put(213700 + delay,derecha) //halls"

    listaDeFlechas.put(215800 + delay,arriba) //and whispered
    listaDeFlechas.put(218700 + delay,derecha) // in the
    listaDeFlechas.put(219100 + delay,abajo) //SOUUUUUUUUND
    listaDeFlechas.put(225000 + delay,izquierda) //OFFF
    listaDeFlechas.put(226200 + delay,abajo) // SIIIIIIILEEEEEEEEENNNNNCEEEEEE

    fsTheSoundOfSilence.volume(0.25)
    fsTheSoundOfSilence.play()
    listaDeFlechas.forEach({k,v => self.tirarFlecha(k, v)})
    
  }
}

object myBestFriend inherits Cancion {
  method initialize(izquierda,arriba,abajo,derecha) {
    const fsMyBestFriend = game.sound("My Best Friend.mp3")
    const listaDeFlechas = new Dictionary()
    listaDeFlechas.put(1800 + delay,abajo)
    listaDeFlechas.put(2500 + delay,derecha)
    listaDeFlechas.put(3100 + delay,arriba)
    listaDeFlechas.put(3800 + delay,abajo)
    listaDeFlechas.put(4500 + delay,izquierda)
    listaDeFlechas.put(5100 + delay,abajo)
    listaDeFlechas.put(5700 + delay,arriba)
    listaDeFlechas.put(6300 + delay,derecha)
    listaDeFlechas.put(7000 + delay,derecha)
    listaDeFlechas.put(7600 + delay,abajo)
    listaDeFlechas.put(8300 + delay,arriba)
    listaDeFlechas.put(8900 + delay,izquierda)
    listaDeFlechas.put(9600 + delay,arriba)
    listaDeFlechas.put(10200 + delay,derecha)
    listaDeFlechas.put(10900 + delay,izquierda)
    listaDeFlechas.put(11500 + delay,derecha)
    listaDeFlechas.put(12100 + delay,abajo)
    listaDeFlechas.put(12800 + delay,arriba)
    listaDeFlechas.put(13400 + delay,arriba)
    listaDeFlechas.put(14100 + delay,abajo)
    listaDeFlechas.put(14700 + delay,derecha)
    listaDeFlechas.put(15400 + delay,izquierda)
    listaDeFlechas.put(16000 + delay,arriba)
    listaDeFlechas.put(16700 + delay,abajo)
    listaDeFlechas.put(17300 + delay,izquierda)
    listaDeFlechas.put(18000 + delay,abajo)
    listaDeFlechas.put(18600 + delay,derecha)
    listaDeFlechas.put(19200 + delay,derecha)
    listaDeFlechas.put(19900 + delay,arriba)
    listaDeFlechas.put(20500 + delay,derecha)
    listaDeFlechas.put(21200 + delay,izquierda)
    listaDeFlechas.put(22500 + delay,abajo)
    listaDeFlechas.put(23100 + delay,arriba)
    listaDeFlechas.put(23800 + delay,izquierda)
    listaDeFlechas.put(24400 + delay,derecha)
    listaDeFlechas.put(25100 + delay,izquierda)
    listaDeFlechas.put(25700 + delay,arriba)
    listaDeFlechas.put(26400 + delay,abajo)
    listaDeFlechas.put(27000 + delay,derecha)
    listaDeFlechas.put(27700 + delay,izquierda)
    listaDeFlechas.put(28300 + delay,abajo)
    listaDeFlechas.put(28900 + delay,derecha)
    listaDeFlechas.put(29600 + delay,abajo)
    listaDeFlechas.put(30200 + delay,arriba)
    listaDeFlechas.put(31400 + delay,arriba)
    listaDeFlechas.put(31500 + delay,abajo)
    listaDeFlechas.put(31500 + delay,derecha)

    fsMyBestFriend.volume(0.25)
    fsMyBestFriend.play()
    listaDeFlechas.forEach({k,v => self.tirarFlecha(k, v)})
    
  }

}  