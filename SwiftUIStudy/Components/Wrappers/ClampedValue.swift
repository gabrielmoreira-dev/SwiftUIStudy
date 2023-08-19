import SwiftUI

@propertyWrapper
struct ClampedValue {
    var storedValue: Int = 0
    let min = 0
    let max = 255

    var wrappedValue: Int {
        get {
            storedValue
        }
        set {
            if newValue < min {
                storedValue = min
            } else if newValue > max {
                storedValue = max
            } else {
                storedValue = newValue
            }
        }
    }

    init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
    }
}
