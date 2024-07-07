//
//  MealDetailView.swift
//  SweetTreats
//
//  Created by Christopher Endress on 7/6/24.
//

import SwiftUI

struct MealDetailView: View {
    @StateObject private var viewModel = MealDetailViewModel()
    var mealID: String
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if let meal = viewModel.mealDetail {
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
                } else if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .padding()
                }
            }
            .navigationTitle(viewModel.mealDetail?.strMeal ?? "Loading...")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                Task {
                    await viewModel.loadMealDetails(mealID: mealID)
                }
            }
        }
    }
}

#Preview {
    MealDetailView(mealID: "52772")
}
