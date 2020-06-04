//
// Created by chchrn on 6/4/20.
// Copyright (c) 2020 chchrn. All rights reserved.
//

import Foundation

@objc public enum LogLevel: UInt8 {
    case debug
    case info
    case error
}

internal extension LogLevel {
    func stringDescription() -> String {
        var str = "[unknown]"
        switch self {
        case .debug:
            str = "[DEBUG]"
        case .info:
            str = "[INFO]"
        case .error:
            str = "[ERROR]"
        @unknown default:
            str = "[unknown]"
        }
        return str
    }
}
