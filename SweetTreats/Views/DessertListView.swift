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
                    DessertRow(dessert: dessert)
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
