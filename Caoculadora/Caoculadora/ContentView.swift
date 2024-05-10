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
    
    let portes = ["Pequeno", "Médio", "Grande"]
    @State var porteSelecionado = "Pequeno"
    
    var body: some View {
        VStack (alignment: .leading, spacing: 24){
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
            Picker("Portes", selection: $porteSelecionado){
                ForEach(portes, id:\.self) { porte in Text(porte)
                }
            }
            .pickerStyle(.segmented)
            
            Divider()
            
            Spacer()
            
            if let result {
                Text("Seu cachorro tem , em idade humana...")
                Text("\(result) anos")
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: .infinity)
                    .shadow(radius: 50)
            }
            
            Spacer()
            
            Button("Cãocular", action: processYears)
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
    
    
    func processYears() {
        
        print("Cãocular")
        guard let years, let months else {
            print("campos não preenchidos")
            return
        }
        
    
        guard months > 0 || years > 0 else {
            print("Pelo menos um campo deve ser maior que zero.")
            return
        }
        // o resultado vai ser os anos*multiplicador + fração do ano em meses*multiplicador
        // multiplicador:
        //        *pequeno: 6
        //        *medio: 7
        //        *grande: 8
        let multiplicador: Int
        switch porteSelecionado{
        case "Pequeno":
            multiplicador = 6
        case "Médio":
            multiplicador = 7
        case "Grande":
            multiplicador = 8
        default:
            multiplicador = 0
        }
        result = years*multiplicador + months*multiplicador/12
    }
}

#Preview {
    ContentView()
}
