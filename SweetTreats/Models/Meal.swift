//
//  Meal.swift
//  SweetTreats
//
//  Created by Christopher Endress on 7/6/24.
//

import Foundation

struct MealResponse: Codable {
    var meals: [Meal]
    
    struct Meal: Identifiable, Codable {
        var idMeal: String
        var strMeal: String
        var strMealThumb: String
        
        // ID property required to conform to Identifiable protocol. Return the actual ID the API provides.
        var id: String {
            return idMeal
        }
    }
}
