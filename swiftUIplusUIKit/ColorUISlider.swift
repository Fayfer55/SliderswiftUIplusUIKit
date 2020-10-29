//
//  UISlider.swift
//  swiftUIplusUIKit
//
//  Created by Кирилл Файфер on 29.10.2020.
//

import SwiftUI

struct ColorUISlider: UIViewRepresentable {
    @Binding var value: Double
    let alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.tintColor = UIColor(.red)
        slider.thumbTintColor = UIColor(.red)
        
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueChanged),
                         for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.alpha = CGFloat(alpha)/100
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

class Coordinator: NSObject {
    @Binding var value: Double
    
    init(value: Binding<Double>) {
        self._value = value
    }
    
    @objc func valueChanged(_ sender: UISlider) {
        value = Double(sender.value)
    }
}

