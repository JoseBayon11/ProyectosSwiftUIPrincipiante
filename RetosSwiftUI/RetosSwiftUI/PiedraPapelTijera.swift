//
//  PiedraPapelTijera.swift
//  RetosSwiftUI
//
//  Created by Jose Bayon on 27/11/24.
//

import SwiftUI

struct PiedraPapelTijera: View {
    
    //Variable de iconos de piedra, papel y tijera
    @State private var iconos: [String] = ["🪨", "📝", "✂️"]
    
    //Variable de eleccion del jugador
    @State private var eleccionJugador: String = "❓"
    
    //Variable de eleccion maquina
    @State private var eleccionMaquina: String = "❓"
    
    //Mensaje de la eleccion, y posteriormente el resultado
    @State private var resultado:String = "Haz tu eleccion"
    
    var body: some View {
        
        //Vstack con el titulo, elecciones de jugador y maquina y botones
        VStack (spacing: 20) {
            
            Text("Juego Piedra, Papel o Tijera")
                .font(.largeTitle).bold().multilineTextAlignment(.center).padding()
            
            //Hstack con la eleccion del jugadro y de la maquina
            HStack {
                
                //Eleccion del jugador
                VStack {
                    Text("Elección del jugador")
                        .font(.headline).bold()
                    Text(eleccionJugador)
                        .font(.system(size: 80))
                }
                .padding(10)
                .background(Color.blue.opacity(0.4))
                .cornerRadius(20)
                
                //Eleccion de la maquina
                VStack {
                    Text("Elección del Maquina")
                        .font(.headline).bold()
                    Text(eleccionMaquina)
                        .font(.system(size: 80))
                }
                .padding(10)
                .background(Color.blue.opacity(0.4))
                .cornerRadius(20)
            }
            
            //Texto con el resultado
            Text(resultado)
                .font(.title)
                .padding()
                .bold()
            
            //Hstack recorriendo los iconos
            HStack {
                ForEach(iconos, id: \.self) { icono in
                    
                    //Creo un boton dentro del foreach
                    Button (action : {
                        
                        //La accion es la funcion de jugar, con el string del foreach del icono
                        jugar(jugadorSeleccionado: icono)
                    }) {
                        Text(icono)
                        .font(.largeTitle)
                        .frame(width: 80, height: 80)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(20)
                    }
                }
            }
            }
        }
    
    
    
    //Funcion jugar. Dentro un string deJugador seleccionado
    func jugar (jugadorSeleccionado: String) {
        
        //la eleccion del jugador, se guarda dentro del jugadorSeleccionado
        eleccionJugador = jugadorSeleccionado
        
        //La aleccion de la maquina, muestra un random de los iconos, sino, la ?
        eleccionMaquina = iconos.randomElement() ?? "❓"
        
        //El resultado se iguala a la funcion de determinar ganador. Se iguala la variable jugador y maquina a las variables eleccionJugador y eleccionMaquina
        resultado = determinarGanador(jugador: eleccionJugador, maquina: eleccionMaquina)
    }


    //Funcion determinar ganador. Se crean 2 variables jugador y maquina
    func determinarGanador(jugador: String, maquina: String) -> String {
        if jugador == maquina {
            return "¡Es un empate!"
        } else if (jugador == "🪨" && maquina == "✂️") ||
                  (jugador == "📝" && maquina == "🪨") ||
                  (jugador == "✂️" && maquina == "📝") {
            return "¡Ganaste!"
        } else {
            return "¡Perdiste!"
        }
    }

    }

#Preview {
    PiedraPapelTijera()
}
