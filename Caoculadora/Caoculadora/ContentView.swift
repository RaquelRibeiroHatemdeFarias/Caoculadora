//
//  ContentView.swift
//  Caoculadora
//
//  Created by Raquel Ribeiro Hatem de Farias on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var years: Int?
    @State var months: Int?
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Qual é a idade do seu cão?")
            Text("Anos")
            TextField(
            "Quantos anos completos tem seu cão",
            value: $years,
            format: .number
            )
            Text("Meses")
            TextField(
            "Quantos meses ele tem",
            value: $months,
            format: .number
            )
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .padding()
    }
}

#Preview {
    ContentView()
}
