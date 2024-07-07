//
//  RectangleDividerView.swift
//  SweetTreats
//
//  Created by Christopher Endress on 7/7/24.
//

import SwiftUI

struct RectangleDividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.white.opacity(0.5))
            .padding(.vertical)
    }
}

#Preview {
    RectangleDividerView()
}
