//
// Created by chchrn on 6/4/20.
// Copyright (c) 2020 chchrn. All rights reserved.
//

import Foundation

@objc public class LogEventError: LogEventWrap {

    @objc public init(level: LogLevel = .error,
                      error: Error,
                      file: String = #file,
                      line: Int = #line) {
        var params: LogEventWithParams.Parameters = [:]
        if let nsError = error as? NSError {
            params = nsError.userInfo
        }

        super.init(
                LogEventWithParams(level: level,
                                   key: error.localizedDescription,
                                   parameters: params)
        )
    }
}
