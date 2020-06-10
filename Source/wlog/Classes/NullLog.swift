//
// Created by chchrn on 6/4/20.
// Copyright (c) 2020 chchrn. All rights reserved.
//

import Foundation

public class NullLog: Log {

    public init() {}

    public func log(_ event: LogEvent) {
        // do nothing
    }
}
