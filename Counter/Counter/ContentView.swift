//
//  ContentView.swift
//  Counter
//
//  Created by Jose Bayon on 10/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var counter: Int = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                    .opacity(0.6)
                VStack {
                    Text("Counter: \(counter)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                        .padding()
                    HStack {
                        Button(action: {
                            counter -= 1
                        }) {
                            Text("Decrease")
                                .frame(width: 110, height: 50)
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                                .background(Color.red)
                                .cornerRadius(15)
                                .padding()
                            
                        }
                        
                        Button(action: {
                            counter += 1
                        }) {
                            Text("Increase")
                                .frame(width: 110, height: 50)
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                                .background(Color.green)
                                .cornerRadius(15)
                                .padding()
                            
                        }
                    }
                    
                    
                }.navigationTitle("Counter").navigationBarTitleDisplayMode(.inline).font(.largeTitle)
            }
        }
    }
}

#Preview {
    ContentView()
}

 
