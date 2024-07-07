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
                    MealDetailContentView(meal: meal)
                } else if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .padding()
                        .frame(maxWidth: .infinity)
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
