//
//  TodoRow.swift
//  WiFiScan
//
//  Created by Kirill Manuilenko on 20.09.24.
//

import SwiftUI

struct TodoRow: View {
    // MARK: - Property -
    var todo: TodoItem
    var action: () -> Void

    // MARK: - Body -
    var body: some View {
        HStack {
            VStack {
                Image(systemName: todo.completed ? "checkmark.circle.fill" : "multiply")
                    .foregroundColor(todo.completed ? .cAEE67F : .cB5B8B5)
                    .padding(todo.completed ? 10 : 12)
            }
            .background(.c292C29)
            .cornerRadius(100)
            
            Text(todo.title)
                .font(.appBold(of: 17))
                .foregroundColor(.cEBEEE9)
                .padding(.leading, 16)
            
            Spacer()
            
            Circle()
                .fill(todo.completed ? .cAEE67F : .cF42719)
                .frame(width: 8, height: 13)
        }
        .onTapGesture {
            action()
        }
    }
}
