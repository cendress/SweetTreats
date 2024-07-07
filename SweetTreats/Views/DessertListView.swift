//
//  ContentView.swift
//  SweetTreats
//
//  Created by Christopher Endress on 7/6/24.
//

import SwiftUI

struct DessertListView: View {
    // Ensure view is updated when @Published properties change
    @StateObject private var viewModel = DessertListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.desserts) { dessert in
                NavigationLink(destination: MealDetailView(mealID: dessert.idMeal)) {
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
            .navigationTitle("SweetTreats")
            .onAppear {
                // Use Task when calling an asynchronous function
                Task {
                    await viewModel.loadDesserts()
                }
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .alert(isPresented: .constant(viewModel.errorMessage != nil)) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage ?? "There was an error."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

#Preview {
    DessertListView()
}
