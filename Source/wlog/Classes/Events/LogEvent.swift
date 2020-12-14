//
// Created by chchrn on 6/4/20.
// Copyright (c) 2020 chchrn. All rights reserved.
//

import Foundation

@objc public protocol LogEvent {
    var level: LogLevel {get}
    var message: String {get}
}

@objc public class LogEventDefault: NSObject, LogEvent {
    public let level: LogLevel
    public let message: String

    @objc public init(level: LogLevel, message: String) {
        self.level = level
        self.message = message
    }
}

@objc public class LogEventWithParams: NSObject, LogEvent {
    public typealias Parameters = [String: Any]

    public let level: LogLevel
    public let key: String
    public let parameters: Parameters

    public var message: String {
        let pairs = self.parameters.map { key, value -> String in
            return (key + " = " + String(describing: value))
        }
        let paramsStr = pairs.joined(separator: "\n")
        let message = self.parameters.count > 0 ? (self.key + " {\n" + paramsStr + "\n}") : self.key
        return message
    }

    @objc public init(level: LogLevel,
                      key: String,
                      parameters: Parameters) {
        self.level = level
        self.key = key
        self.parameters = parameters
    }
}
