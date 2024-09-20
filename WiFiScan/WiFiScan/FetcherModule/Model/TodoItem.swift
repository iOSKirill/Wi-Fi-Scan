//
//  TodoItem.swift
//  WiFiScan
//
//  Created by Kirill Manuilenko on 20.09.24.
//

import Foundation

struct TodoItem: Identifiable, Decodable {
    let id: Int
    let title: String
    var completed: Bool
}
