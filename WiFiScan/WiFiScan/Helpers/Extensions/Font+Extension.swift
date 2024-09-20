//
//  Font+Extension.swift
//  WiFiScan
//
//  Created by Kirill Manuilenko on 20.09.24.
//

import SwiftUI

extension SwiftUI.Font {
    static func appBold(of size: CGFloat) -> SwiftUI.Font {
        FontFamily.IBMPlexSans.bold.swiftUIFont(size: size)
    }
    
    static func appMedium(of size: CGFloat) -> SwiftUI.Font {
        FontFamily.IBMPlexSans.medium.swiftUIFont(size: size)
    }
    
    static func appRegular(of size: CGFloat) -> SwiftUI.Font {
        FontFamily.IBMPlexSans.regular.swiftUIFont(size: size)
    }
}
