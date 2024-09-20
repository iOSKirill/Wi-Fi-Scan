//
//  AlamofireManager.swift
//  WiFiScan
//
//  Created by Kirill Manuilenko on 20.09.24.
//

import Alamofire
import Foundation

protocol AlamofireManagerProtocol {
    func fetchTodos() async throws -> [TodoItem]
    func fetchTodos(for userId: Int) async throws -> [TodoItem]
}

class AlamofireManager: AlamofireManagerProtocol {
    
    // Getting all todos
     func fetchTodos() async throws -> [TodoItem] {
         let url = Constants.URLs.todosURL
         return try await makeRequest(url: url)
     }

     // Getting todos by user ID
     func fetchTodos(for userId: Int) async throws -> [TodoItem] {
         let url = "\(Constants.URLs.todosURL)?userId=\(userId)"
         return try await makeRequest(url: url)
     }

     // A common method for executing a request
     private func makeRequest(url: String) async throws -> [TodoItem] {
         return try await withCheckedThrowingContinuation { continuation in
             AF.request(url).responseDecodable(of: [TodoItem].self) { response in
                 switch response.result {
                 case .success(let todos):
                     continuation.resume(returning: todos)
                 case .failure(let error):
                     continuation.resume(throwing: error)
                 }
             }
         }
     }
}
