//
//  FetchStatus+Enum.swift
//  WiFiScan
//
//  Created by Kirill Manuilenko on 20.09.24.
//

import Foundation

enum FetchStatus: Equatable {
    case idle
    case loading
    case success
    case error(String)
}
