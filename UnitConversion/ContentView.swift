//
//  ContentView.swift
//  UnitConversion
//
//  Created by Yash  Khanande on 12/08/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstUnit: String = "Meter"
    @State private var secondUnit: String = "Inches"
    @State private var value1 = 0.0
   
    @FocusState private var valueFocus : Bool
    var units = ["Meter","Inches","Feet","Cm"]
    
    
    var converter : Double{
        
        if firstUnit == "Meter" {
            if secondUnit == "Inches" {
                return  value1 * 39.3701
            }
            else if secondUnit == "Feet" {
                return  value1 * 3.28084
            }
            else if secondUnit == "Cm" {
                return  value1 * 100
            }else {
                return value1
            }
        }else if firstUnit == "Inches" {
            if secondUnit == "Meter" {
                return  value1 / 39.3701
            }
            else if secondUnit == "Feet" {
                return value1 / 12
            }
            else if secondUnit == "Cm" {
                return value1 / 2.54
            }
            else {
                return value1
            }
        }
        else if firstUnit == "Feet" {
            if secondUnit == "Meter"{
                return value1 / 3.28084
            }
            else if secondUnit == "Inches" {
                return value1 * 12
            }
            else if secondUnit == "Cm" {
                return value1 * 30.48
            }
            else {
                return value1
            }
        }
        else if firstUnit == "Cm" {
            if secondUnit == "Meter"{
                return value1 / 100
            }
            else if secondUnit == "Inches" {
                return value1 * 2.54
            }
            else if secondUnit == "Feet" {
                return value1 * 0.0328084
            }
            else {
                return value1
            }
        }
        return 0.0
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("select first unit"){
                    Picker("First Unit" , selection: $firstUnit){
                        ForEach(units , id : \.self){
                            Text($0)
                        }
                    }
                    TextField("Enter Value in  \(firstUnit)" , value: $value1 , format: .number).keyboardType(.decimalPad)
                        .focused($valueFocus)
                }
                
                Section("select second unit"){
                    
                    Picker("Second Unit",selection : $secondUnit ){
                        ForEach(units , id : \.self){
                            Text($0)
                        }
                    }
                }
                Section("converted value in \(secondUnit)"){
                    Text("\(converter)")
                }
                
                
            }.navigationTitle("Unit Converter")
            .toolbar{
                    if valueFocus {
                        Button("Done"){
                            valueFocus = false
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
