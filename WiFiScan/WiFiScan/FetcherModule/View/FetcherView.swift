//
//  FetcherView.swift
//  WiFiScan
//
//  Created by Kirill Manuilenko on 19.09.24.
//

import SwiftUI

struct FetcherView: View {
    
    // MARK: - Fetch button -
    var fetchButton: some View {
        Button {
            
        } label: {
            ZStack {
                Circle()
                    .fill(.c151515)
                    .frame(width: 320, height: 320)
                           
                Circle()
                    .fill(.c181818)
                    .frame(width: 260, height: 260)
                
                Circle()
                    .fill(.c1E201E)
                    .frame(width: 210, height: 210)
                
                Circle()
                    .fill(.c292C29)
                    .frame(width: 160, height: 160)
                
                Image(.wiFi)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
            }
        }
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
