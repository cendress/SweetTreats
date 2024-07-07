//
//  MealDetailView.swift
//  SweetTreats
//
//  Created by Christopher Endress on 7/6/24.
//

import SwiftUI

struct MealDetailView: View {
    var mealID: String

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    // Maybe place image thumbnail here?
                    
                    Text("Instructions will go here.")
                        .padding()
                    
                    Text("Ingredients will go here.")
                        .padding()
                    
                    Text("Measurements will go here.")
                        .padding()
                }
            }
            .navigationTitle(mealID)
        }
    }
}

#Preview {
    MealDetailView(mealID: "Sample Dessert Name")
}
