# wlog
Easy logging system for ios applications

```swift
let log = SyncLog(
        OsLog(subsystem: "123",
              category: "123")
)
        
log.debug("Starting app")
```
