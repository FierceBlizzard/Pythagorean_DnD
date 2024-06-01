//
//  ContentView.swift
//  Pythagorean-DnD
//
//  Created by IceMac on 6/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var a = ""
    @State private var b = ""
    @State private var spellRange = ""
    @State private var result = ""
    var body: some View {
            ZStack{
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Text("Let's find out if your spell is in range!")
                        .font(.title)
                        .bold()
                        .padding()
                        .foregroundColor(.white)
                    TextField("Enter the length A: ", text: $a)
                        .keyboardType(.numberPad)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Enter the height B: ", text: $b)
                        .keyboardType(.numberPad)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Enter the spell range: ", text: $spellRange)
                        .keyboardType(.numberPad)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    HStack{
                        Button(action: calculateHypotenuse){
                            Text("Calculate")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        Button(action: clearFields){
                            Text("Clear")
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    
                    Text(result)
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
                    
                }
                .padding()
            }
}
    
    private func calculateHypotenuse(){
        guard let a = Double(a), let b = Double(b), let spellRange = Double(spellRange) else{
            result = "Please enter valid numbers"
            return
        }
        
        let hypotenuse = round(sqrt(a * a + b * b))
        if(hypotenuse <= spellRange){
            result = "the hypotenuse is \(hypotenuse). The spell is in range \(spellRange)"
        } else{
            result = "the hypotenuse is \(hypotenuse). The spell is out of range by \(hypotenuse - spellRange) ft"
        }
    }
    
    private func clearFields(){
        a = ""
        b = ""
        spellRange = ""
        result = ""
    }
}

#Preview {
    ContentView()
}
