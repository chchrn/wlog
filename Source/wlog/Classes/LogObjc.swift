//
// Created by chchrn on 6/4/20.
// Copyright (c) 2020 chchrn. All rights reserved.
//

import Foundation

@objc class LogObjc: NSObject, Log {
    private let wrappedLog: Log

    init(_ wrappedLog: Log) {
        self.wrappedLog = wrappedLog
    }

    @objc public func log(_ event: LogEvent) {
        self.wrappedLog.log(event)
    }
}
