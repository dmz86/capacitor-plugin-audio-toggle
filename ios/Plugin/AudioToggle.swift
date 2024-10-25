import Foundation

@objc public class AudioToggle: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
    
    @objc public func enable(_ value: String) -> Void {
        return
    }
    
    @objc public func disable(_ value: String) -> Void {
        return
    }
}
