//
//  ContentView.swift
//  swiftUIplusUIKit
//
//  Created by Кирилл Файфер on 29.10.2020.
//

import SwiftUI

struct GameView: View {
    @State private var currentValue = 0.0
    @State private var targetValue = Int.random(in: 0...100)
    @State private var showAlert = false
    @State private var alphaSlider = 1.0
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            
            SliderView(value: $currentValue,
                       alpha: computeScore())
                       
            
            Button("Проверь меня!") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                let score = computeScore()
                
                return Alert(title: Text("Ваш счёт"), message: Text("\(score)"))
            }
            .padding()
            
            Button("Начать заново!") { targetValue = Int.random(in: 0...100) }
        }
    }
}

extension GameView {
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
