// Generated using Sourcery 0.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import AsciiPlistParser

// MARK: BuildConfiguration
extension BuildConfiguration {
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

    public var name: String {
        get { return self[.name] }
        set(newValue) { self[.name] = newValue }
    }



    subscript(field: ObjectField) -> Object {
        set(newValue) {
            let keyref = object.keyRef(for: field.rawValue)!
            object[keyref] = newValue
        }
        get {
            return object.object(for: field.rawValue)!
        }
    }

    public var buildSettings: Object {
        get { return self[.buildSettings] }
        set(newValue) { self[.buildSettings] = newValue }
    }

}
// MARK: BuildConfigurationList
extension BuildConfigurationList {


}
// MARK: FileReference
extension FileReference {
}
// MARK: Group
extension Group {
}
// MARK: IsaObject
extension IsaObject {
}
// MARK: ObjectsReferencing
extension ObjectsReferencing {
}
// MARK: Pbxproj
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

    public var archiveVersion: String {
        get { return self[.archiveVersion] }
        set(newValue) { self[.archiveVersion] = newValue }
    }
    public var objectVersion: String {
        get { return self[.objectVersion] }
        set(newValue) { self[.objectVersion] = newValue }
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
            let keyref = object.keyRef(for: field.rawValue)!
            object[keyref] = newValue
        }
        get {
            return object.object(for: field.rawValue)!
        }
    }

    public var objects: Object {
        get { return self[.objects] }
        set(newValue) { self[.objects] = newValue }
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

    public var classes: Object? {
        get { return self[.classes] }
        set(newValue) { self[.classes] = newValue }
    }


    public var rootObject: RootObject {
        let id = object.string(for: "rootObject")!
        return RootObject(object: objects.object(for: id)!, objects: objects)
    }

}
// MARK: RootObject
extension RootObject {
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

    public var compatibilityVersion: String {
        get { return self[.compatibilityVersion] }
        set(newValue) { self[.compatibilityVersion] = newValue }
    }
    public var developmentRegion: String {
        get { return self[.developmentRegion] }
        set(newValue) { self[.developmentRegion] = newValue }
    }
    public var hasScannedForEncodings: String {
        get { return self[.hasScannedForEncodings] }
        set(newValue) { self[.hasScannedForEncodings] = newValue }
    }
    public var mainGroup: String {
        get { return self[.mainGroup] }
        set(newValue) { self[.mainGroup] = newValue }
    }
    public var productRefGroup: String {
        get { return self[.productRefGroup] }
        set(newValue) { self[.productRefGroup] = newValue }
    }
    public var projectDirPath: String {
        get { return self[.projectDirPath] }
        set(newValue) { self[.projectDirPath] = newValue }
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

    public var knownRegions: [StringValue] {
        get { return self[.knownRegions] }
        set(newValue) { self[.knownRegions] = newValue }
    }

    subscript(field: ObjectField) -> Object {
        set(newValue) {
            let keyref = object.keyRef(for: field.rawValue)!
            object[keyref] = newValue
        }
        get {
            return object.object(for: field.rawValue)!
        }
    }

    public var attributes: Object {
        get { return self[.attributes] }
        set(newValue) { self[.attributes] = newValue }
    }
    public var buildConfigurationList: Object {
        get { return self[.buildConfigurationList] }
        set(newValue) { self[.buildConfigurationList] = newValue }
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

    public var projectRoot: String? {
        get { return self[.projectRoot] }
        set(newValue) { self[.projectRoot] = newValue }
    }



}
// MARK: Target
extension Target {
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

    public var name: String {
        get { return self[.name] }
        set(newValue) { self[.name] = newValue }
    }
    public var productName: String {
        get { return self[.productName] }
        set(newValue) { self[.productName] = newValue }
    }
    public var productReference: String {
        get { return self[.productReference] }
        set(newValue) { self[.productReference] = newValue }
    }


    subscript(field: RawRepresentableField) -> ProductType {
        set(newValue) {
            if let keyref = object.keyRef(for: field.rawValue) {
                object[keyref] = newValue.rawValue
            } else {
                let keyref = KeyRef(value: field.rawValue, annotation: nil)
                object[keyref] = newValue.rawValue
            }
        }
        get {
            return ProductType(rawValue: object.string(for: field.rawValue)!)!
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

    public var buildRules: [StringValue]? {
        get { return self[.buildRules] }
        set(newValue) { self[.buildRules] = newValue }
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

    public var dependencies: [StringValue] {
        get { return self[.dependencies] }
        set(newValue) { self[.dependencies] = newValue }
    }


    public var buildConfigurationList: BuildConfigurationList {
        let id = object.string(for: "buildConfigurationList")!
        return BuildConfigurationList(object: objects.object(for: id)!, objects: objects)
    }

}
