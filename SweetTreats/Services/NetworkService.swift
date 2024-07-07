//
//  NetworkService.swift
//  SweetTreats
//
//  Created by Christopher Endress on 7/6/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case badResponse
}

class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    // Function to fetch meals by category rather than solely by desserts
    func fetchMeals(category: String) async throws -> [MealResponse.Meal] {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=\(category)") else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // Check for valid HTTP response
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.badResponse
            }
            
            guard !data.isEmpty else {
                throw NetworkError.noData
            }
            
            do {
                let mealResponse = try JSONDecoder().decode(MealResponse.self, from: data)
                // Sort meals alphabetically by name
                return mealResponse.meals.sorted { $0.strMeal < $1.strMeal }
            } catch {
                throw NetworkError.decodingError
            }
        } catch {
            // Throw any remaining errors if checks fail
            throw error
        }
    }
    
    // Function to fetch meal details by ID
    func fetchMealDetails(mealID: String) async throws -> MealResponse.Meal {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)") else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.badResponse
            }
            
            guard !data.isEmpty else {
                throw NetworkError.noData
            }
            
            do {
                let mealDetailResponse = try JSONDecoder().decode(MealResponse.self, from: data)
                
                guard let mealDetail = mealDetailResponse.meals.first else {
                    throw NetworkError.noData
                }
                
                return mealDetail
            } catch {
                throw NetworkError.decodingError
            }
        } catch {
            throw error
        }
    }
}
