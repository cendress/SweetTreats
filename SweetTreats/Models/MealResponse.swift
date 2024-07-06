//
//  Meal.swift
//  SweetTreats
//
//  Created by Christopher Endress on 7/6/24.
//

import Foundation

import Foundation

struct MealResponse: Codable {
    var meals: [Meal]
    
    // Nested struct for organization
    struct Meal: Identifiable, Codable {
        var idMeal: String
        var strMeal: String
        var strMealThumb: String
        var strInstructions: String?
        
        /// Optional ingredients
        var strIngredient1: String?
        var strIngredient2: String?
        var strIngredient3: String?
        var strIngredient4: String?
        var strIngredient5: String?
        var strIngredient6: String?
        var strIngredient7: String?
        var strIngredient8: String?
        var strIngredient9: String?
        var strIngredient10: String?
        var strIngredient11: String?
        var strIngredient12: String?
        var strIngredient13: String?
        var strIngredient14: String?
        var strIngredient15: String?
        var strIngredient16: String?
        var strIngredient17: String?
        var strIngredient18: String?
        var strIngredient19: String?
        var strIngredient20: String?
        
        /// Optional measurements
        var strMeasure1: String?
        var strMeasure2: String?
        var strMeasure3: String?
        var strMeasure4: String?
        var strMeasure5: String?
        var strMeasure6: String?
        var strMeasure7: String?
        var strMeasure8: String?
        var strMeasure9: String?
        var strMeasure10: String?
        var strMeasure11: String?
        var strMeasure12: String?
        var strMeasure13: String?
        var strMeasure14: String?
        var strMeasure15: String?
        var strMeasure16: String?
        var strMeasure17: String?
        var strMeasure18: String?
        var strMeasure19: String?
        var strMeasure20: String?
        
        // ID property required to conform to Identifiable protocol
        var id: String {
            return idMeal
        }
        
        // Helper functions to get a list of ingredients and measurements
        func ingredients() -> [String] {
            var ingredients = [String]()
            
            if let ingredient1 = strIngredient1, !ingredient1.isEmpty {
                ingredients.append(ingredient1)
            }
            if let ingredient2 = strIngredient2, !ingredient2.isEmpty {
                ingredients.append(ingredient2)
            }
            if let ingredient3 = strIngredient3, !ingredient3.isEmpty {
                ingredients.append(ingredient3)
            }
            if let ingredient4 = strIngredient4, !ingredient4.isEmpty {
                ingredients.append(ingredient4)
            }
            if let ingredient5 = strIngredient5, !ingredient5.isEmpty {
                ingredients.append(ingredient5)
            }
            if let ingredient6 = strIngredient6, !ingredient6.isEmpty {
                ingredients.append(ingredient6)
            }
            if let ingredient7 = strIngredient7, !ingredient7.isEmpty {
                ingredients.append(ingredient7)
            }
            if let ingredient8 = strIngredient8, !ingredient8.isEmpty {
                ingredients.append(ingredient8)
            }
            if let ingredient9 = strIngredient9, !ingredient9.isEmpty {
                ingredients.append(ingredient9)
            }
            if let ingredient10 = strIngredient10, !ingredient10.isEmpty {
                ingredients.append(ingredient10)
            }
            if let ingredient11 = strIngredient11, !ingredient11.isEmpty {
                ingredients.append(ingredient11)
            }
            if let ingredient12 = strIngredient12, !ingredient12.isEmpty {
                ingredients.append(ingredient12)
            }
            if let ingredient13 = strIngredient13, !ingredient13.isEmpty {
                ingredients.append(ingredient13)
            }
            if let ingredient14 = strIngredient14, !ingredient14.isEmpty {
                ingredients.append(ingredient14)
            }
            if let ingredient15 = strIngredient15, !ingredient15.isEmpty {
                ingredients.append(ingredient15)
            }
            if let ingredient16 = strIngredient16, !ingredient16.isEmpty {
                ingredients.append(ingredient16)
            }
            if let ingredient17 = strIngredient17, !ingredient17.isEmpty {
                ingredients.append(ingredient17)
            }
            if let ingredient18 = strIngredient18, !ingredient18.isEmpty {
                ingredients.append(ingredient18)
            }
            if let ingredient19 = strIngredient19, !ingredient19.isEmpty {
                ingredients.append(ingredient19)
            }
            if let ingredient20 = strIngredient20, !ingredient20.isEmpty {
                ingredients.append(ingredient20)
            }
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
            if let measure3 = strMeasure3, !measure3.isEmpty {
                measurements.append(measure3)
            }
            if let measure4 = strMeasure4, !measure4.isEmpty {
                measurements.append(measure4)
            }
            if let measure5 = strMeasure5, !measure5.isEmpty {
                measurements.append(measure5)
            }
            if let measure6 = strMeasure6, !measure6.isEmpty {
                measurements.append(measure6)
            }
            if let measure7 = strMeasure7, !measure7.isEmpty {
                measurements.append(measure7)
            }
            if let measure8 = strMeasure8, !measure8.isEmpty {
                measurements.append(measure8)
            }
            if let measure9 = strMeasure9, !measure9.isEmpty {
                measurements.append(measure9)
            }
            if let measure10 = strMeasure10, !measure10.isEmpty {
                measurements.append(measure10)
            }
            if let measure11 = strMeasure11, !measure11.isEmpty {
                measurements.append(measure11)
            }
            if let measure12 = strMeasure12, !measure12.isEmpty {
                measurements.append(measure12)
            }
            if let measure13 = strMeasure13, !measure13.isEmpty {
                measurements.append(measure13)
            }
            if let measure14 = strMeasure14, !measure14.isEmpty {
                measurements.append(measure14)
            }
            if let measure15 = strMeasure15, !measure15.isEmpty {
                measurements.append(measure15)
            }
            if let measure16 = strMeasure16, !measure16.isEmpty {
                measurements.append(measure16)
            }
            if let measure17 = strMeasure17, !measure17.isEmpty {
                measurements.append(measure17)
            }
            if let measure18 = strMeasure18, !measure18.isEmpty {
                measurements.append(measure18)
            }
            if let measure19 = strMeasure19, !measure19.isEmpty {
                measurements.append(measure19)
            }
            if let measure20 = strMeasure20, !measure20.isEmpty {
                measurements.append(measure20)
            }
            return measurements
        }
    }
}
