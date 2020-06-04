//
// Created by chchrn on 6/4/20.
// Copyright (c) 2020 chchrn. All rights reserved.
//

import Foundation

@objc public class LogEventWrap: NSObject, LogEvent {
    private let origin: LogEvent

    public init(_ origin: LogEvent) {
        self.origin = origin
    }

    public var level: LogLevel {
        return self.origin.level
    }

    public var message: String {
        return self.origin.message
    }
}
