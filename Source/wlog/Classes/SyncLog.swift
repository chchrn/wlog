//
// Created by chchrn on 6/4/20.
// Copyright (c) 2020 chchrn. All rights reserved.
//

import Foundation

public class SyncLog: Log {
    private let queue: DispatchQueue
    private let wrappedLog: Log

    public required init(_ wrappedLog: Log,
                         queue: DispatchQueue = DispatchQueue(label: "com.wlog.syncLog")) {
        self.queue = queue
        self.wrappedLog = wrappedLog
    }

    public func log(_ event: LogEvent) {
        self.queue.async {
            self.wrappedLog.log(event)
        }
    }
}
