//
//  MealDetailViewModel.swift
//  SweetTreats
//
//  Created by Christopher Endress on 7/7/24.
//

import Foundation

@MainActor
class MealDetailViewModel: ObservableObject {
    @Published var mealDetail: MealResponse.Meal?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func loadMealDetails(mealID: String) async {
        isLoading = true
        errorMessage = nil
        
        do {
            mealDetail = try await NetworkService.shared.fetchMealDetails(mealID: mealID)
        } catch {
            errorMessage = error.localizedDescription
            print("Error fetching meal details by meal ID.")
        }
        
        isLoading = false
    }
}
