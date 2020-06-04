//
// Created by chchrn on 6/4/20.
// Copyright (c) 2020 chchrn. All rights reserved.
//

import Foundation
import os.log

public class OsLog: Log {
    private let subsystem: String
    private let category: String
    private let osLog: OSLog

    public init(subsystem: String = "",
                category: String = "") {
        self.subsystem = subsystem
        self.category = category
        if #available(iOS 10.0, macOS 10.12, tvOS 10.0, watchOS 3.0, *) {
            self.osLog = OSLog(subsystem: subsystem, category: category)
        } else {
            fatalError()
        }
    }

    public func log(_ event: LogEvent) {
        if #available(iOS 10.0, macOS 10.12, tvOS 10.0, watchOS 3.0, *) {
            let osLogType = event.level.osLogType()
            let levelStr = event.level.stringDescription()
            os_log("%{public}@ %{public}@",
                   log: self.osLog,
                   type: osLogType,
                   levelStr,
                   event.message)
        }
    }
}

private extension LogLevel {
    func osLogType() -> OSLogType {
        var osLogType = OSLogType.default
        switch self {
        case .debug:
            osLogType = .debug
        case .info:
            osLogType = .info
        case .error:
            osLogType = .error
        @unknown default:
            osLogType = .default
        }
        return osLogType
    }
}
