//
//  FetcherView.swift
//  WiFiScan
//
//  Created by Kirill Manuilenko on 19.09.24.
//

import SwiftUI

struct FetcherView: View {
    // MARK: - Property -
    @StateObject private var viewModel = FetcherViewModel()
    
    // MARK: - Fetch button -
    var fetchButton: some View {
        Button {
            viewModel.fetchTodos()
        } label: {
            ZStack {
                Circle()
                    .fill(viewModel.isLoading ? Color.cAEE67F.opacity(0.03) : Color.c151515)
                    .frame(width: 320 * (viewModel.isLoading ? viewModel.scaleOuter : 1.0), height: 320 * (viewModel.isLoading ? viewModel.scaleOuter : 1.0))

                Circle()
                    .fill(viewModel.isLoading ? Color.cAEE67F.opacity(0.06) : Color.c181818)
                    .frame(width: 260 * (viewModel.isLoading ? viewModel.scaleMiddle : 1.0), height: 260 * (viewModel.isLoading ? viewModel.scaleMiddle : 1.0))

                Circle()
                    .fill(viewModel.isLoading ? Color.cAEE67F.opacity(0.1) : Color.c1E201E)
                    .frame(width: 210, height: 210)

                Circle()
                    .fill(viewModel.isLoading ? Color.cAEE67F.opacity(0.15) : Color.c292C29)
                    .frame(width: 160, height: 160)

                Image(viewModel.isLoading ? .wiFiActive : .wiFiNotActive)
            }
        }
    }
     
    // MARK: - Status panel  -
    var statusPanel: some View {
        VStack {
            HStack {
                let (imageName, statusText) = viewModel.statusContent
                
                if viewModel.fetchStatus == .loading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                        .frame(width: 28, height: 28)
                } else {
                    Image(imageName)
                }

                Text(statusText)
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
        .padding(.horizontal, 16)
        .padding(.bottom, 24)
    }
    
    // MARK: - Custom Switch Panel
    var switchPanel: some View {
        VStack {
            HStack {
                NavigationLink(destination: ResultView(todos: $viewModel.todos)
                                                .environmentObject(viewModel)) {
                    VStack {
                        Text(L10n.Fetcher.Button.show)
                            .font(.appMedium(of: 14))
                            .foregroundColor(.c203008)
                            .padding(.vertical, 16)
                            .padding(.horizontal, 36)
                    }
                    .background(.cAEE67F)
                    .cornerRadius(50)
                }
                .disabled(viewModel.fetchStatus != .success)
                .opacity(viewModel.fetchStatus != .success ? 0.5 : 1)
                
                Spacer()
                
                Button {
                    withAnimation {
                        viewModel.isSwitchOn.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(viewModel.isSwitchOn ? Color.cAEE67F : Color.gray)
                            .frame(width: 71, height: 40)
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 30, height: 30)
                            .offset(x: viewModel.isSwitchOn ? 15 : -15)
                            .shadow(radius: 3)
                            .animation(.easeInOut, value: viewModel.isSwitchOn)

                        Image(systemName: viewModel.isSwitchOn ? "person.fill" : "person.slash.fill")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.white)
                            .offset(x: viewModel.isSwitchOn ? -15 : 15)
                            .animation(.easeInOut, value: viewModel.isSwitchOn)
                    }
                }
                .disabled(!viewModel.isSwitchEnabled) 
                .opacity(viewModel.isSwitchEnabled ? 1 : 0.5)
            }
            .padding(16)
        }
        .frame(maxWidth: .infinity)
        .background(.c292C29.opacity(0.6))
        .cornerRadius(40)
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }

    // MARK: - Body -
    var body: some View {
        NavigationView {
            ZStack {
                Color.c111411.ignoresSafeArea()
                
                VStack {
                    Spacer()
                    fetchButton
                    Spacer()
                    statusPanel
                    switchPanel
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(L10n.Fetcher.navBar)
                        .font(.appBold(of: 20))
                        .foregroundColor(.cEBEEE9)
                }
            }
        }
    }
}

#Preview {
    FetcherView()
}
