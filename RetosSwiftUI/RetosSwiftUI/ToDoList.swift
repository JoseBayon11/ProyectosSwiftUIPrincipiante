//
//  ToDoList.swift
//  RetosSwiftUI
//
//  Created by Jose Bayon on 10/11/24.
//


//Lista de Tareas Pendientes (To-Do List)
//
//Descripción: Crea una lista de tareas donde el usuario pueda agregar tareas mediante un campo de texto y un botón. Las tareas deben aparecer en la lista y poder marcarse como completadas.
//

import SwiftUI

struct ToDoList: View {
    @State private var tasks: [String] = [] //Array que almacena las variables
    @State private var newTask: String = "" //Variable que permite agregar nuevas tareas
    @State private var showSheet: Bool = false //Booleano para accionar el sheet
    
    var body: some View {
        NavigationView {
            HStack {
                List { //Agrego una lista y recorro con un ForEach el array de las tareas, y en el Texto, muestra las tareas
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                            
                    }.onDelete { offsets in
                        tasks.remove(atOffsets: offsets) //Para poder eliminar las tareas con el boton de edit
                    }
                }
            }.navigationTitle("To-Do List 📝") //Titulo del navigationView
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {//Toolbar con el boton de editar
                        EditButton()
                    }
                    ToolbarItem {//Toolbar con el boton de agregar tareas
                        Button {
                            showSheet.toggle()//Cambia el valor del show
                        } label: {
                            Image(systemName: "plus")
                        }
                        }
                    }.sheet(isPresented: $showSheet) {//Para que la hoja secundaria aparezca
                        SheetView(tasks: $tasks, newTask: $newTask, showSheet: $showSheet)//Llamo al struct SheetView y tengo que dar valores a las variables
                        
                    }
                }
            }
        }


#Preview {
    ToDoList()
}

struct SheetView: View {
    //Declaro tres variables con Binding, ya que las @State estan en la vista principal. Las declaro sin valores ya que el valor lo coge en la vista principal
    @Binding var tasks: [String]
    @Binding var newTask: String
    @Binding var showSheet: Bool
    var body: some View {
        HStack {
            TextField("  Enter new Task", text: $newTask)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.gray.opacity(0.2))
            Button(action: {
                //Evita agregar una tarea vacia
                guard !newTask.isEmpty else { return }
                tasks.append(newTask)
                newTask = ""
            }) {
                Text("Add")
                    .padding()
                    .bold()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }.padding()
        }
    }
}


