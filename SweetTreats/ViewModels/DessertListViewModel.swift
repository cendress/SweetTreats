//
//  DessertListViewModel.swift
//  SweetTreats
//
//  Created by Christopher Endress on 7/7/24.
//

import Foundation

// UI updates must occur on the main thread
@MainActor
class DessertListViewModel: ObservableObject {
    @Published var desserts: [MealResponse.Meal] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func loadDesserts() async {
        isLoading = true
        // Clear any prior error messages
        errorMessage = nil
        
        do {
            desserts = try await NetworkService.shared.fetchMeals(category: "Dessert")
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
