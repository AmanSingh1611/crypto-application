//
//  CircleButtonAnimationView.swift
//  crypto-application
//
//  Created by Aman on 12/11/25.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate: Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1 : 0)
            .opacity(animate ? 0 : 1)
            .animation(animate ? .easeOut(duration: 1) : .none, value: animate)
    }
}

#Preview {
//    CircleButtonAnimationView()
//        .foregroundStyle(.red)
}
