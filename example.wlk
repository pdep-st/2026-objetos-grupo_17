class Guerrero {
    const poderOfensivo
    const energiaInicial
    var experiencia
    var energia

    method disminuirEnergia(energiaASustraer) {
        energia -= energiaASustraer
    }

    method aumentarExperiencia(experienciaGanada) {
        experiencia += experienciaGanada
    }
    
    method atacaA(otroGuerrero) {
        otroGuerrero.disminuirEnergia(0.1 * poderOfensivo)
        otroGuerrero.aumentarExperiencia(1)
    }

    method comeSemillaDelErmitanio() {
        energia = energiaInicial
    }

}
