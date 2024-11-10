//
//  Calculator.swift
//  RetosSwiftUI
//
//  Created by Jose Bayon on 10/11/24.
//

import SwiftUI

struct Calculator: View {
    @State private var number1: String = ""
    @State private var number2: String = ""
    @State private var result: String = ""
    
    var body: some View {
        NavigationView {
        ZStack {
            Color.gray.opacity(0.8).ignoresSafeArea()
                VStack {
                    TextField("Number 1", text: $number1)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                        .bold()
                    TextField("Number 2", text: $number2)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                        .bold()
                    
                    HStack {
                        Button("Sum") {
                            result = String((Double(number1) ?? 0) + (Double(number2) ?? 0))
                        }
                        .padding()
                        
                        Button("Substract") {
                            result =  String((Double(number1) ?? 0) - (Double(number2) ?? 0))                   }
                        .padding()
                        
                        Button("Multiply") {
                            result =  String((Double(number1) ?? 0) * (Double(number2) ?? 0))                     }
                        .padding()
                        
                        Button("Divide") {
                            if let num2 = Double(number2), num2 != 0 {
                                result =  String((Double(number1) ?? 0) / num2)
                            } else {
                                result = "Can't divide by zero"
                            }
                        }
                        .padding()
                        
                        
                    }.navigationBarTitle("Calculator", displayMode: .inline).bold().padding()
                    Text("Result is: \(result)")
                        .padding().bold()
                }
                
            }
            }
        }
}

#Preview {
    Calculator()
}
