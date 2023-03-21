//
//  extensions.swift
//  swiftsky
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
extension ISO8601DateFormatter {
    convenience init(_ formatOptions: Options) {
        self.init()
        self.formatOptions = formatOptions
    }
}
extension RelativeDateTimeFormatter {
    convenience init(_ dateTimeStyle: DateTimeStyle) {
        self.init()
        self.dateTimeStyle = dateTimeStyle
    }
}
extension Formatter {
    static let iso8601withFractionalSeconds = ISO8601DateFormatter([.withInternetDateTime, .withFractionalSeconds])
    static let iso8601withTimeZone = ISO8601DateFormatter([.withInternetDateTime, .withTimeZone])
    static let relativeDateNamed = RelativeDateTimeFormatter(.named)
}
extension Date {
    var iso8601withFractionalSeconds: String { return Formatter.iso8601withFractionalSeconds.string(from: self) }
}
extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
