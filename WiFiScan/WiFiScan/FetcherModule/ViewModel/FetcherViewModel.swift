//
//  FetcherViewModel.swift
//  WiFiScan
//
//  Created by Kirill Manuilenko on 20.09.24.
//

import Foundation
import SwiftUI

class FetcherViewModel: ObservableObject {
    // MARK: - Property -
    @Published var todos: [TodoItem] = []
    @Published var errorMessage: String? = nil
    @Published var fetchStatus: FetchStatus = .idle
    @Published var isLoading: Bool = false
    @Published var scaleOuter: CGFloat = 1.0
    @Published var scaleMiddle: CGFloat = 1.0
    @Published var isSwitchOn: Bool = true
    @Published var isSwitchEnabled: Bool = true

    private let networkService: AlamofireManagerProtocol = AlamofireManager()
    
    init() {
        reset()
    }
    
    // Reset view
    func reset() {
        todos = []
        fetchStatus = .idle
        isLoading = false
        isSwitchEnabled = true
        isSwitchOn = true
    }
    
    // Fetch data from URL
    func fetchTodos() {
        fetchStatus = .loading
        isLoading = true
        isSwitchEnabled = false
        startAnimation()
        
        Task {
            do {
                let fetchedTodos: [TodoItem]
                if isSwitchOn {
                    fetchedTodos = try await networkService.fetchTodos(for: 5)
                } else {
                    fetchedTodos = try await networkService.fetchTodos()
                }

                print("Fetched Todos: \(fetchedTodos)")

                await MainActor.run {
                    self.todos = fetchedTodos
                    self.fetchStatus = .success
                    self.isLoading = false
                    self.isSwitchEnabled = true
                    self.stopAnimation()
                }
            } catch {
                await MainActor.run {
                    self.fetchStatus = .error(error.localizedDescription)
                    self.isLoading = false
                    self.isSwitchEnabled = true
                    self.stopAnimation()
                }
            }
        }
    }
    
    // Animation Wi-Fi logo
    private func startAnimation() {
        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
            scaleOuter = 1.2
            scaleMiddle = 1.1
        }
    }

    private func stopAnimation() {
        withAnimation {
            scaleOuter = 1.0
            scaleMiddle = 1.0
        }
    }
    
    // Computed property for status content
     var statusContent: (imageName: String, statusText: String) {
         switch fetchStatus {
         case .idle:
             return ("Tap", L10n.Fetcher.Title.tap)
         case .loading:
             return ("Loading", L10n.Fetcher.Title.loading)
         case .success:
             return ("Success", L10n.Fetcher.Title.success)
         case .error(let message):
             return ("Error", message)
         }
     }
}
