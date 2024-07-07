//
//  MealDetailContentView.swift
//  SweetTreats
//
//  Created by Christopher Endress on 7/7/24.
//

import SwiftUI

struct MealDetailContentView: View {
    let meal: MealResponse.Meal
    
    var body: some View {
        VStack(alignment: .leading) {
            if let url = URL(string: meal.strMealThumb) {
                AsyncImage(url: url) { phase in
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
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 50)
            }
            
            Text("Instructions")
                .font(.headline)
                .padding([.top, .horizontal])
            Text(meal.strInstructions ?? "No instructions available.")
                .padding([.horizontal, .bottom])
            
            Text("Ingredients")
                .font(.headline)
                .padding([.top, .horizontal])
            ForEach(meal.ingredients(), id: \.self) { ingredient in
                Text(ingredient)
                    .padding(.horizontal)
            }
            
            Text("Measurements")
                .font(.headline)
                .padding([.top, .horizontal])
            ForEach(meal.measurements(), id: \.self) { measurement in
                Text(measurement)
                    .padding(.horizontal)
            }
        }
    }
}

//#Preview {
//    MealDetailContentView()
//}
