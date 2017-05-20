import Foundation
import AsciiPlistParser

extension Object {
    public var isa: IsaType? {
        get {
            guard let isa = string(for: "isa") else {
                return nil
            }
            return IsaType(rawValue: isa)
        }
    }
}
