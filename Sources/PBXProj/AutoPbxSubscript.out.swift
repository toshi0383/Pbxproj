// Generated using Sourcery 0.5.8 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import AsciiPlistParser

extension Pbxproj {
    subscript(field: StringField) -> String {
        set(newValue) {
            if let keyref = object.keyRef(for: field.rawValue) {
                let existing = object[keyref] as! StringValue
                existing.value = newValue
                object[keyref] = existing
            } else {
                let keyref = KeyRef(value: field.rawValue, annotation: nil)
                object[keyref] = newValue
            }
        }
        get {
            return object.string(for: field.rawValue)!
        }
    }
    subscript(field: ArrayField) -> [StringValue] {
        set(newValue) {
            if let keyref = object.keyRef(for: field.rawValue) {
                let existing = object[keyref] as! ArrayValue
                existing.value = newValue
                object[keyref] = existing
            } else {
                let keyref = KeyRef(value: field.rawValue, annotation: nil)
                object[keyref] = newValue
            }
        }
        get {
            return object.arrayValue(for: field.rawValue)!.value
        }
    }
    subscript(field: ObjectField) -> Object {
        set(newValue) {
            if let keyref = object.keyRef(for: field.rawValue) {
                object[keyref] = newValue
            } else {
                let keyref = KeyRef(value: field.rawValue, annotation: nil)
                object[keyref] = newValue
            }
        }
        get {
            return object.object(for: field.rawValue)!
        }
    }
    subscript(field: OptionalStringField) -> String? {
        set(newValue) {
            if let keyref = object.keyRef(for: field.rawValue) {
                if let newValue = newValue {
                    let existing = object[keyref] as! StringValue
                    existing.value = newValue
                    object[keyref] = existing
                } else {
                    object[keyref] = nil
                }
            } else {
                let keyref = KeyRef(value: field.rawValue, annotation: nil)
                object[keyref] = newValue
            }
        }
        get {
            return object.string(for: field.rawValue)
        }
    }
    subscript(field: OptionalArrayField) -> [StringValue]? {
        set(newValue) {
            if let keyref = object.keyRef(for: field.rawValue) {
                if let newValue = newValue {
                    let existing = object[keyref] as! ArrayValue
                    existing.value = newValue
                    object[keyref] = existing
                } else {
                    object[keyref] = nil
                }
            } else {
                let keyref = KeyRef(value: field.rawValue, annotation: nil)
                object[keyref] = newValue
            }
        }
        get {
            return object.arrayValue(for: field.rawValue)?.value
        }
    }
    subscript(field: OptionalObjectField) -> Object? {
        set(newValue) {
            if let keyref = object.keyRef(for: field.rawValue) {
                object[keyref] = newValue
            } else {
                let keyref = KeyRef(value: field.rawValue, annotation: nil)
                object[keyref] = newValue
            }
        }
        get {
            return object.object(for: field.rawValue)
        }
    }
}
