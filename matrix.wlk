object neo {
  var energia = 100
  method saltar() {
    energia *= 0.5
  }
  method vitalidad() = energia/10
  method esElegido() = true

  method bajarDeLANave() {
    nave.bajarPasajero(self)
  }
}
object morfeo {
  var property vitalidad = 8
  var estaCansado = false
  method saltar() {
    estaCansado = !estaCansado
    vitalidad -= 1
  }
  method vitalidad() = vitalidad
  method esElegido() = false

 method bajarDeLANave() {
    nave.bajarPasajero(self)
  }
}

object trinity {
  method vitalidad() = 0
  method saltar() {}
  method esElegido() = false

   method bajarDeLANave() {
    nave.bajarPasajero(self)
  }
}

// Nave

object nave {
  const property pasajeros = []
  
  method cantidadDePasajeros() = pasajeros.size()
  method pasajeroDeMayorVitalidad() = pasajeros.max({p => p.vitalidad()}) 
  method estaEquilibrada() = self.pasajeroDeMayorVitalidad().vitalidad() <= self.pasajeroDeMenorVitalidad()
  method pasajeroDeMenorVitalidad() = pasajeros.min({p => p.vitalidad()})
  method elElegidoEstaEnLaNave() = pasajeros.any({p => p.esElegido()})

  method chocar() {
    pasajeros.forEach({p => p.saltar(); p.bajarDeLaNave()})
  }
  method acelerar() {
    self.pasajerosNoElegidos().forEach({p => p.saltar()})
  }
    method pasajerosNoElegidos() = pasajeros.filter({p => p.esElegido()})

// Extras

method pasajerosValiosos() = pasajeros.filter({p => p.vitalidad() > 5})

method hayPasajerosAlHorno() = pasajeros.any({p => p.vitalidad() == 0})

method todosPuedenEnfrentarAgente() = pasajeros.all({p => p.vitalidad() > 2})

method vitalidadPromedio() = pasajeros.sum({p => p.vitalidad()}) / self.cantidadDePasajeros()

method cantidadConVitalidadPar() = pasajeros.count({p => p.vitalidad().even()})

method realizarSimulacro() {
    pasajeros.forEach({p => p.saltar(); p.saltar(); p.saltar()})
}

method vitalidades() = pasajeros.map({p1 => p.vitalidad()})

method ordenarPasajerosDeMenorAMayor() = pasajeros.sortBy({p1, p2 => p1.vitalidad() > p2})

method elegirAlAzar() = pasajeros.anyOne()

method cantidadDeElegidos() = pasajeros.count({p => p.esElegido()})

method potenciaVital() = pasajeros.fold(1,{acumulador, p => p.vitalidad() * acumulador}) 



  // Aux
    method subirPasajero(pasajero) {
    pasajeros.add(pasajero)
  }
  method subirPasajeros(listaDePasajeros) {
    pasajeros.addAll(listaDePasajeros)
  }
  method bajarPasajero(pasajero) {
    pasajeros.remove(pasajero)
  }
}