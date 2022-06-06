//
//  ContentView.swift
//  TempConverter
//
//  Created by Musa Rafik on 6/5/22.
//

import SwiftUI

struct ContentView: View {
    let units = ["Fahrenheit", "Celsius", "Kelvin"]
    @State private var selectedInputUnit = "Fahrenheit"
    @State private var selectedOutputUnit = "Celsius"
    @State private var inputTemp = 0.0
    
    var outputTemp: Double {
        let baseTemp = getBaseUnitTemp(tempUnit: selectedInputUnit, temp: inputTemp)
        if(selectedOutputUnit == "Fahrenheit"){
            return (baseTemp * 1.8) + 32
        }
        else if(selectedOutputUnit == "Celsius"){
            return baseTemp
        }
        else{
            return baseTemp + 273.15
        }
    }
    
    // The base unit is Celsius
    func getBaseUnitTemp(tempUnit: String, temp: Double) -> Double{
        if(tempUnit == "Fahrenheit"){
            return (temp - 32) / 1.8
        }
        else if(tempUnit == "Celsius"){
            return temp
        }
        else{
            return temp - 273.15
        }
    }
    
    var body: some View {
        Form{
            Section{
                Picker("Unit of temperature", selection: $selectedInputUnit){
                    ForEach(units, id: \.self){
                        Text("\($0)")
                    }
                }.pickerStyle(.segmented)
                
            } header:{
                Text("Select the input unit of temperature")
            }
            
            Section{
                TextField("Input Temperature", value: $inputTemp, format: .number)
            } header:{
                Text("Temperature")
            }
            
            Section{
                Picker("Unit of Temperature", selection: $selectedOutputUnit){
                    ForEach(units, id: \.self){
                        Text("\($0)")
                    }
                }.pickerStyle(.segmented)
            } header:{
                Text("Select the output unit of temperature")
            }
            
            Section{
                Text(outputTemp, format: .number)
            } header:{
                Text("Output tempertaure")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
