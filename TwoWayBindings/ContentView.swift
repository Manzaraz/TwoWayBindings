//
//  ContentView.swift
//  TwoWayBindings
//
//  Created by Christian Manzaraz on 30/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var pressCount = 0
    @State private var toggleIsOn = false
    @State private var name = ""
    @State private var selectedColor: Color = .red
    @State private var selectedDate = Date()
    @State private var stepperValue = 1
    
    var body: some View {
        VStack {
            Group {
                Spacer()
                
                Text("Press Count: \(pressCount)")
                
                Button("Press Me") {
                    pressCount += 1
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                TextField("Enter a name", text: $name)
                    .textFieldStyle(.roundedBorder)
                Text("Name entered: \(name)")
                
                Spacer()
                
                Toggle("Toggle is \(toggleIsOn ? "on" : "off"):", isOn: $toggleIsOn)
                
                Spacer()
            }
            
            Rectangle()
                .fill(selectedColor)
                .frame(width: 100, height: 100)
            ColorPicker("Pick a rectangle color: ", selection: $selectedColor)
            
            Spacer()
            
            DatePicker("Date:", selection: $selectedDate)
            
            Text("Selected Date is: \(selectedDate.formatted(date: .abbreviated, time: .shortened))")
            
            Spacer()
            
            Stepper("Stepper value \(stepperValue)", value: $stepperValue, in: 1...10)
            
            Spacer()
        }
        .font(.title2)
        .padding()
    }
}

#Preview {
    ContentView()
}
