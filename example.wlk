object juego{
  method iniciar(){
    game.addVisual(sanLorenzo)
    game.addVisualCharacter(jorge)
    //keyboard.space().onPressDo({sanLorenzo.gana()})
    keyboard.enter().onPressDo({jorge.saludar()})
    game.onCollideDo(jorge, {quien=>quien.gana()})
    game.schedule(4500, {jorge.position(game.origin())})
    

  }
}


object jorge{
var alegria = 10
var lugar = game.at(0,6)

method festejar(){
    alegria = alegria +1
  }

method lamentarse(){
    alegria = 10
  }

method alegria() = alegria

method image() = if (alegria >= 15) "mario.png" else "sombrero.png"

method position() = lugar

method position(nueva){
  lugar = nueva
}

method saludar(){
    game.say(self, "Tengo alegria" + alegria)
}

}


object sanLorenzo{
  method gana(){
    jorge.festejar()
    game.removeTickEvent("moverse")
  }
  method image() = "escudoFulbo.jpg"

  method position() = game.center()

}

object presidente{

  method image() = "presidente.png"
  method position() = sanLorenzo.position().right(2) 
  method gana(){
    jorge.lamentarse()
    game.onTick(1000, "moverse", {jorge.position(jorge.position().down(2))})
    
  }

}
  
