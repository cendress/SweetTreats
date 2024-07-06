//
//  MealDetailResponse.swift
//  SweetTreats
//
//  Created by Christopher Endress on 7/6/24.
//

import Foundation

struct MealDetailResponse: Codable {
    var meals: [MealDetail]

    struct MealDetail: Identifiable, Codable {
        var idMeal: String
        var strMeal: String
        var strInstructions: String
        var strMealThumb: String
        var strIngredient1: String?
        var strIngredient2: String?
        // Add other ingredients up to strIngredient20
        var strMeasure1: String?
        var strMeasure2: String?
        // Add other measurements up to strMeasure20
        
        var id: String {
            return idMeal
        }
        
        // Helper function to get a list of ingredients and measurements
        func ingredients() -> [String] {
            var ingredients = [String]()
            if let ingredient1 = strIngredient1, !ingredient1.isEmpty {
                ingredients.append(ingredient1)
            }
            if let ingredient2 = strIngredient2, !ingredient2.isEmpty {
                ingredients.append(ingredient2)
            }
            // Add other ingredients checks up to strIngredient20
            return ingredients
        }
        
        func measurements() -> [String] {
            var measurements = [String]()
            if let measure1 = strMeasure1, !measure1.isEmpty {
                measurements.append(measure1)
            }
            if let measure2 = strMeasure2, !measure2.isEmpty {
                measurements.append(measure2)
            }
            // Add other measurements checks up to strMeasure20
            return measurements
        }
    }
}
