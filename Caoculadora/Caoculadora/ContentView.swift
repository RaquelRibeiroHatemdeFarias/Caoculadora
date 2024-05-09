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
    @State var result: Int?
    
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
            Text("Porte")
            // Aqui vai o segmented control.
            
            if let result {
                Text("Seu cachorro tem , em idade humana...")
                Text("\(result) anos")
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: .infinity)
            }
            Button("Cãocular") {
                print("cãocular")
                result = 23
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(.indigo)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .bold()
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .padding()
    }
}

#Preview {
    ContentView()
}
