//
//  SliderView.swift
//  SlidersAppSwiftUI
//
//  Created by Кирилл Файфер on 19.10.2020.
//

import SwiftUI

struct SliderView: View {
    @State private var showAlert = false
    @Binding var value: Double
    let alpha: Int
    
    var body: some View {
        HStack {
            Text("0")
            ColorUISlider(value: $value,
                          alpha: alpha)
            Text("100")
        }
        .padding()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(50), alpha: 1)
    }
}
