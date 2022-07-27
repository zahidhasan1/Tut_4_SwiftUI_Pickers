//
//  ContentView.swift
//  Tut_4_SwiftUI_Pickers
//
//  Created by ZEUS on 27/7/22.
//

import SwiftUI

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate
    case vanilla
    case strawberry

    var id: String { self.rawValue }
}

struct ContentView: View {
    
    @State private var selectedFlavor = Flavor.chocolate
    
    @State var choice = 0
    @State var showText = false
    @State var transitModes = ["Bike", "Car", "Bus"]
    @State var sliderVal: Float = 0
    @State var stepVal = 0
    @State var gameTime = Date()
    
    var body: some View {
        Form {
            Section{
                Picker("Transit Modes", selection: $choice){
                    ForEach( 0 ..< transitModes.count){ index in
                        Text("\(self.transitModes[index])")
                    }
                    
                }.pickerStyle(SegmentedPickerStyle())
                Text("Current Choice: \(transitModes[choice])")
                
                
                Picker("Flavor", selection: $selectedFlavor) {
//                    Text("Chocolate").tag(Flavor.chocolate)
//                    Text("Vanilla").tag(Flavor.vanilla)
//                    Text("Strawberry").tag(Flavor.strawberry)
                    ForEach(Flavor.allCases) {
                                   Text($0.rawValue).tag($0)
                               }
                    
                }.pickerStyle(SegmentedPickerStyle())
                Text("Selected flavor: \(selectedFlavor.rawValue)")
            }
            
            Section{
                Toggle(isOn: $showText) {
                    Text("Show Text")
                }
                if showText{
                    Text("The Text Toogle is ON")
                }else{
                    Text("The Text Toogle is OFF")
                }
            }
            
            Section{
                Slider(value: $sliderVal, in: 0...10, step: 0.001)
                Text("Slider current value \(sliderVal, specifier: "%.1f")")
            }
            
            Section{
                Stepper("Stepper", value: $stepVal, in: 0...5)
                Text("Stepper current value: \(stepVal)")
            }
            
            Section{
                DatePicker("Please select a date", selection: $gameTime)
                Text("Selected Date: \(gameTime)").padding()
            }
            
            Section{
                DatePicker("Please select a date", selection: $gameTime, in: Date()...)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
