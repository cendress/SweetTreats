//
//  ContentView.swift
//  SweetTreats
//
//  Created by Christopher Endress on 7/6/24.
//

import SwiftUI

struct DessertListView: View {
    var body: some View {
        NavigationStack {
            List {
                Text("Dessert 1")
                
                Text("Dessert 2")
            }
            .navigationTitle("SweetTreats")
        }
    }
}

#Preview {
    DessertListView()
}
