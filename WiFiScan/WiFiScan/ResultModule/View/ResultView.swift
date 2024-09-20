//
//  ResultView.swift
//  WiFiScan
//
//  Created by Kirill Manuilenko on 20.09.24.
//

import SwiftUI

struct ResultView: View {
    // MARK: - Property -
    @Binding var todos: [TodoItem]
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: FetcherViewModel
    
    // MARK: - Done button -
    var doneButton: some View {
        Button {
            dismiss()
        } label: {
            VStack {
                Text(L10n.Todos.Button.dome)
                    .font(.appMedium(of: 14))
                    .foregroundColor(.c203008)
                    .padding(.vertical, 16)
            }
            .frame(maxWidth: .infinity)
            .background(.cAEE67F)
            .cornerRadius(50)
        }
        .padding(.bottom, 16)
    }
    
    // MARK: - Info Panel -
    var infoPanel: some View {
        VStack {
            HStack {
                Image(.tap)
                
                Text(L10n.Todos.Title.tap)
                    .font(.appMedium(of: 14))
                    .foregroundColor(.cB5B8B5)
                    .padding(.leading, 10)
                
                Spacer()
            }
            .padding(20)
        }
        .frame(maxWidth: .infinity)
        .background(.c292C29.opacity(0.6))
        .cornerRadius(18)
        .padding(.top, 16)
    }
    
    // MARK: - List preview data -
    var listData: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text(L10n.Todos.Section.notCompleted)
                    .font(.appBold(of: 15))
                    .foregroundColor(.cB5B8B5.opacity(0.5))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Rectangle()
                    .frame(width: .infinity, height: 1)
                    .foregroundColor(.cB5B8B5.opacity(0.1))
                
                
                VStack {
                    ForEach(todos.filter { !$0.completed }) { todo in
                        TodoRow(todo: todo) {
                            toggleTodo(todo)
                        }
                    }
                }
                .padding(.top, 18)
            }
            .padding(.top, 24)
            
            VStack {
                Text(L10n.Todos.Section.completed)
                    .font(.appBold(of: 15))
                    .foregroundColor(.cB5B8B5.opacity(0.5))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Rectangle()
                    .frame(width: .infinity, height: 1)
                    .foregroundColor(.cB5B8B5.opacity(0.1))
                
                VStack {
                    ForEach(todos.filter { $0.completed }) { todo in
                        TodoRow(todo: todo) {
                            toggleTodo(todo)
                        }
                    }
                }
                .padding(.top, 18)
            }
            .padding(.top, 24)
        }
    }

    // MARK: - Body -
    var body: some View {
        ZStack {
            Color.c111411.ignoresSafeArea()
            
            VStack {
                infoPanel
                listData
                
                Spacer()
                
                doneButton
            }
            .padding(.horizontal, 16)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(L10n.Todos.navBar)
                    .font(.appBold(of: 20))
                    .foregroundColor(.cEBEEE9)
            }
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton()
            }
        }
        .onDisappear {
            viewModel.reset() // Reset the FetcherViewModel
        }
    }
    
    private func toggleTodo(_ todo: TodoItem) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].completed.toggle()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTodos = [
            TodoItem(id: 1, title: "Task 1", completed: false),
            TodoItem(id: 2, title: "Task 2", completed: true),
            TodoItem(id: 3, title: "Task 3", completed: false)
        ]

        let viewModel = FetcherViewModel()
        viewModel.todos = sampleTodos // Устанавливаем тестовые данные

        return ResultView(todos: .constant(sampleTodos)) // Используем .constant для создания Binding
            .environmentObject(viewModel) // Передаем экземпляр FetcherViewModel
    }
}
