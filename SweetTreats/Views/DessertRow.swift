//
//  DessertRow.swift
//  SweetTreats
//
//  Created by Christopher Endress on 7/7/24.
//

import SwiftUI

struct DessertRow: View {
    let dessert: MealResponse.Meal
    
    var body: some View {
        HStack {
            // Use AsyncImage when loading an image from a server
            AsyncImage(url: URL(string: dessert.strMealThumb)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        .cornerRadius(8)
                } else if phase.error != nil {
                    Image(systemName: "photo")
                        .background(Color.gray)
                        .cornerRadius(8)
                } else {
                    ProgressView()
                }
            }
            .frame(width: 75, height: 75)
            
                Text(dessert.strMeal)
                    .font(.headline)
        }
    }
}

//#Preview {
//    DessertRow()
//}
