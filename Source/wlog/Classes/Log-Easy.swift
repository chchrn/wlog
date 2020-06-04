//
// Created by chchrn on 6/4/20.
// Copyright (c) 2020 chchrn. All rights reserved.
//

import Foundation

extension Log {
    public typealias Parameters = [String: Any]

    public func log(level: LogLevel,
                    _ format: String,
                    _ arguments: CVarArg...) {
        let message = String(format: format, arguments: arguments)
        let event = LogEventDefault(level: level, message: message)
        self.log(event)
    }

    public func log(level: LogLevel,
                    key: String,
                    parameters: Parameters = [:]) {
        let event = LogEventWithParams(level: level, key: key, parameters: parameters)
        self.log(event)
    }
}

extension Log {
    public func error(_ key: String,
                      parameters: Parameters = [:]) {
        self.log(level: .error, key: key, parameters: parameters)
    }

    public func debug(_ key: String,
                      parameters: Parameters = [:]) {
        self.log(level: .debug, key: key, parameters: parameters)
    }

    public func info(_ key: String,
                     parameters: Parameters = [:]) {
        self.log(level: .info, key: key, parameters: parameters)
    }
}
