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
    @State var porteSelected = Porte.pequeno
    
    var body: some View {
        VStack (alignment: .leading, spacing: 24){
            Text("Qual é a idade do seu cão?")
                .font(.header5)
            Text("Anos")
                .font(.body1)
            TextField(
            "Quantos anos completos tem seu cão",
            value: $years,
            format: .number
            )
            Text("Meses")
                .font(.body1)
            TextField(
            "Quantos meses ele tem",
            value: $months,
            format: .number
            )
            Text("Porte")
                .font(.body1)
            // Aqui vai o segmentes control
            Picker("Portes", selection: $porteSelected){
                ForEach(Porte.allCases, id:\.self) { porte in 
                    Text(porte.rawValue)
                }
            }
            .pickerStyle(.segmented)
            
            Divider()
            
            Spacer()
            
            if let result {
                Text("Seu cachorro tem , em idade humana...")
                    .font(.body1)
                Text("\(result) anos")
                    .font(.display)
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
            .font(.body1)
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
        switch porteSelected {
        case .pequeno:
            multiplicador = 6
        case .medio:
            multiplicador = 7
        case .grande:
            multiplicador = 8
        }
        result = years*multiplicador + months*multiplicador/12
    }
}

#Preview {
    ContentView()
}
