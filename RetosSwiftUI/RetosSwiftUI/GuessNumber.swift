//
//  GuessNumber.swift
//  RetosSwiftUI
//
//  Created by Jose Bayon on 10/11/24.
//

//Crea un juego donde el usuario tiene que adivinar un número aleatorio entre 1 y 100.

import SwiftUI

struct GuessNumber: View {
    @State private var guess: String = ""
    @State private var number: Int = Int.random(in: 1...10)
    @State private var message: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                TextField("Piensa en un numero",text: $guess)
                    .keyboardType(.numberPad)
                    .padding()
                
                Button("Submit Guess") {
                    //Se crea variable del numero que introduce el usuario para igualarlo a un entero
                    if let userGuess = Int(guess) {
                        if userGuess == number {
                            message = "Correcto!"
                        } else if userGuess < number {
                            message = "El numero es mayor"
                        } else {
                            message = "El numero es menor"
                        }
                    } else {
                        message = "Introduzca valor valido"
                    }
                }.padding()
                
                Text(message)
            }.navigationBarTitle(Text("Adivina el numero"), displayMode: .inline)
            
            
        }
    }
}

#Preview {
    GuessNumber()
}
