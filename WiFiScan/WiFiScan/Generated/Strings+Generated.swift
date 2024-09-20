// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Fetcher {
    /// Localizable.strings
    ///   WiFiScan
    /// 
    ///   Created by Kirill Manuilenko on 20.09.24.
    internal static let navBar = L10n.tr("Localizable", "fetcher.navBar", fallback: "Fetcher")
    internal enum Button {
      /// Show Results
      internal static let show = L10n.tr("Localizable", "fetcher.button.show", fallback: "Show Results")
    }
    internal enum Title {
      /// It’ll take a couple of seconds
      internal static let loading = L10n.tr("Localizable", "fetcher.title.loading", fallback: "It’ll take a couple of seconds")
      /// The fetch successfully completed.
      internal static let success = L10n.tr("Localizable", "fetcher.title.success", fallback: "The fetch successfully completed.")
      /// Tap on the button to fetch todos
      internal static let tap = L10n.tr("Localizable", "fetcher.title.tap", fallback: "Tap on the button to fetch todos")
    }
  }
  internal enum Todos {
    /// Todos
    internal static let navBar = L10n.tr("Localizable", "todos.navBar", fallback: "Todos")
    internal enum Button {
      /// Done
      internal static let dome = L10n.tr("Localizable", "todos.button.dome", fallback: "Done")
    }
    internal enum Section {
      /// Completed
      internal static let completed = L10n.tr("Localizable", "todos.section.completed", fallback: "Completed")
      /// Not completed
      internal static let notCompleted = L10n.tr("Localizable", "todos.section.notCompleted", fallback: "Not completed")
    }
    internal enum Title {
      /// Tap on the todo to change status
      internal static let tap = L10n.tr("Localizable", "todos.title.tap", fallback: "Tap on the todo to change status")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
