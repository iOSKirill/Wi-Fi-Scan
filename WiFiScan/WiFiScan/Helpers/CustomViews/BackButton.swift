//
//  BackButton.swift
//  WiFiScan
//
//  Created by Kirill Manuilenko on 20.09.24.
//

import SwiftUI

struct BackButton: View {
    // MARK: - Property -
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Body -
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(.backButton)
        }
    }
}

#Preview {
    BackButton()
}
