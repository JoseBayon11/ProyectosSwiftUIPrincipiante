//
//  LoginForm.swift
//  RetosSwiftUI
//
//  Created by Jose Bayon on 10/11/24.
//


//Reto 2: Crea un formulario de inicio de sesión
//
//Descripción: Haz una vista con dos campos de texto, uno para el nombre de usuario y otro para la contraseña, y un botón que muestre una alerta si se pulsa.

import SwiftUI

struct LoginForm: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showingAlert: Bool = false
    
    var body: some View {
        VStack {
            TextField("Username:", text: $username)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                .padding()
            
            SecureField("Password:", text: $password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                .padding()
            
            Button("Login") {
                showingAlert = true
            }.padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .bold()
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Error"), message: Text("Invalid username or password"))
                }
        }
    }
    
}

#Preview {
    LoginForm()
}
