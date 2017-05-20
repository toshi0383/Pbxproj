// Generated using Sourcery 0.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import AsciiPlistParser

// MARK: AnyIsaObject
extension AnyIsaObject {
}
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
                let stringValue = StringValue(value: newValue, annotation: nil)
                object[keyref] = stringValue
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


    public var baseConfigurationReference: FileReference? {
        guard let id = object.string(for: "baseConfigurationReference") else {
            return nil
        }
        return FileReference(object: objects.object(for: id)!, objects: objects)
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
                if let newValue = newValue {
                    object[keyref] = StringValue(value: newValue, annotation: nil)
                } else {
                    object[keyref] = nil
                }
            }
        }
        get {
            return object.string(for: field.rawValue)
        }
    }

    public var defaultConfigurationName: String? {
        get { return self[.defaultConfigurationName] }
        set(newValue) { self[.defaultConfigurationName] = newValue }
    }

    subscript(field: StringField) -> String {
        set(newValue) {
            if let keyref = object.keyRef(for: field.rawValue) {
                let existing = object[keyref] as! StringValue
                existing.value = newValue
                object[keyref] = existing
            } else {
                let keyref = KeyRef(value: field.rawValue, annotation: nil)
                let stringValue = StringValue(value: newValue, annotation: nil)
                object[keyref] = stringValue
            }
        }
        get {
            return object.string(for: field.rawValue)!
        }
    }

    public var defaultConfigurationIsVisible: String {
        get { return self[.defaultConfigurationIsVisible] }
        set(newValue) { self[.defaultConfigurationIsVisible] = newValue }
    }

}
// MARK: BuildFile
extension BuildFile {
    subscript(field: StringField) -> String {
        set(newValue) {
            if let keyref = object.keyRef(for: field.rawValue) {
                let existing = object[keyref] as! StringValue
                existing.value = newValue
                object[keyref] = existing
            } else {
                let keyref = KeyRef(value: field.rawValue, annotation: nil)
                let stringValue = StringValue(value: newValue, annotation: nil)
                object[keyref] = stringValue
            }
        }
        get {
            return object.string(for: field.rawValue)!
        }
    }

    public var fileRef: String {
        get { return self[.fileRef] }
        set(newValue) { self[.fileRef] = newValue }
    }

}
// MARK: BuildPhase
extension BuildPhase {
    subscript(field: StringField) -> String {
        set(newValue) {
            if let keyref = object.keyRef(for: field.rawValue) {
                let existing = object[keyref] as! StringValue
                existing.value = newValue
                object[keyref] = existing
            } else {
                let keyref = KeyRef(value: field.rawValue, annotation: nil)
                let stringValue = StringValue(value: newValue, annotation: nil)
                object[keyref] = stringValue
            }
        }
        get {
            return object.string(for: field.rawValue)!
        }
    }

    public var buildActionMask: String {
        get { return self[.buildActionMask] }
        set(newValue) { self[.buildActionMask] = newValue }
    }
    public var runOnlyForDeploymentPostprocessing: String {
        get { return self[.runOnlyForDeploymentPostprocessing] }
        set(newValue) { self[.runOnlyForDeploymentPostprocessing] = newValue }
    }

    subscript(field: ArrayField) -> [StringValue] {
        set(newValue) {
            if let keyref = object.keyRef(for: field.rawValue) {
                let existing = object[keyref] as! ArrayValue
                existing.value = newValue
                object[keyref] = existing
            } else {
                let keyref = KeyRef(value: field.rawValue, annotation: nil)
                object[keyref] = ArrayValue(value: newValue)
            }
        }
        get {
            return object.arrayValue(for: field.rawValue)!.value
        }
    }

    public var files: [StringValue] {
        get { return self[.files] }
        set(newValue) { self[.files] = newValue }
    }

}
// MARK: FileReference
extension FileReference {
    subscript(field: OptionalFileTypeField) -> FileType? {
        set(newValue) {
            if let keyref = object.keyRef(for: field.rawValue) {
                if let rawValue = newValue?.rawValue {
                    let existing = object[keyref] as! StringValue
                    existing.value = rawValue
                    object[keyref] = existing
                } else {
                    object[keyref] = nil
                }
            } else {
                if let rawValue = newValue?.rawValue {
                    let keyref = KeyRef(value: field.rawValue, annotation: nil)
                    object[keyref] = StringValue(value: rawValue, annotation: nil)
                }
            }
        }
        get {
            guard let rawValue = object.string(for: field.rawValue) else {
                return nil
            }
            return FileType(rawValue: rawValue)
        }
    }
    public var lastKnownFileType: FileType? {
        return self[.lastKnownFileType]
    }
    public var explicitFileType: FileType? {
        return self[.explicitFileType]
    }


    subscript(field: RawRepresentableField) -> SourceTree {
        set(newValue) {
            if let keyref = object.keyRef(for: field.rawValue) {
                let existing = object[keyref] as! StringValue
                existing.value = newValue.rawValue
                object[keyref] = existing
            } else {
                let keyref = KeyRef(value: field.rawValue, annotation: nil)
                object[keyref] = StringValue(value: newValue.rawValue, annotation: nil)
            }
        }
        get {
            let rawValue = object.string(for: field.rawValue)!
            return SourceTree(rawValue: rawValue)!
        }
    }
    public var sourceTree: SourceTree {
        return self[.sourceTree]
    }


    subscript(field: StringField) -> String {
        set(newValue) {
            if let keyref = object.keyRef(for: field.rawValue) {
                let existing = object[keyref] as! StringValue
                existing.value = newValue
                object[keyref] = existing
            } else {
                let keyref = KeyRef(value: field.rawValue, annotation: nil)
                let stringValue = StringValue(value: newValue, annotation: nil)
                object[keyref] = stringValue
            }
        }
        get {
            return object.string(for: field.rawValue)!
        }
    }

    public var path: String {
        get { return self[.path] }
        set(newValue) { self[.path] = newValue }
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
                if let newValue = newValue {
                    object[keyref] = StringValue(value: newValue, annotation: nil)
                } else {
                    object[keyref] = nil
                }
            }
        }
        get {
            return object.string(for: field.rawValue)
        }
    }

    public var name: String? {
        get { return self[.name] }
        set(newValue) { self[.name] = newValue }
    }
    public var fileEncoding: String? {
        get { return self[.fileEncoding] }
        set(newValue) { self[.fileEncoding] = newValue }
    }

}
// MARK: Group
extension Group {
    subscript(field: ArrayField) -> [StringValue] {
        set(newValue) {
            if let keyref = object.keyRef(for: field.rawValue) {
                let existing = object[keyref] as! ArrayValue
                existing.value = newValue
                object[keyref] = existing
            } else {
                let keyref = KeyRef(value: field.rawValue, annotation: nil)
                object[keyref] = ArrayValue(value: newValue)
            }
        }
        get {
            return object.arrayValue(for: field.rawValue)!.value
        }
    }

    public var children: [StringValue] {
        get { return self[.children] }
        set(newValue) { self[.children] = newValue }
    }

    subscript(field: RawRepresentableField) -> SourceTree {
        set(newValue) {
            if let keyref = object.keyRef(for: field.rawValue) {
                let existing = object[keyref] as! StringValue
                existing.value = newValue.rawValue
                object[keyref] = existing
            } else {
                let keyref = KeyRef(value: field.rawValue, annotation: nil)
                object[keyref] = StringValue(value: newValue.rawValue, annotation: nil)
            }
        }
        get {
            let rawValue = object.string(for: field.rawValue)!
            return SourceTree(rawValue: rawValue)!
        }
    }
    public var sourceTree: SourceTree {
        return self[.sourceTree]
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
                if let newValue = newValue {
                    object[keyref] = StringValue(value: newValue, annotation: nil)
                } else {
                    object[keyref] = nil
                }
            }
        }
        get {
            return object.string(for: field.rawValue)
        }
    }

    public var path: String? {
        get { return self[.path] }
        set(newValue) { self[.path] = newValue }
    }
    public var name: String? {
        get { return self[.name] }
        set(newValue) { self[.name] = newValue }
    }

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
                let stringValue = StringValue(value: newValue, annotation: nil)
                object[keyref] = stringValue
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
                object[keyref] = ArrayValue(value: newValue)
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
                if let newValue = newValue {
                    object[keyref] = StringValue(value: newValue, annotation: nil)
                } else {
                    object[keyref] = nil
                }
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
                if let newValue = newValue {
                    object[keyref] = ArrayValue(value: newValue)
                } else {
                    object[keyref] = nil
                }
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
                let stringValue = StringValue(value: newValue, annotation: nil)
                object[keyref] = stringValue
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
                object[keyref] = ArrayValue(value: newValue)
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
                if let newValue = newValue {
                    object[keyref] = StringValue(value: newValue, annotation: nil)
                } else {
                    object[keyref] = nil
                }
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




    public var mainGroup: Group {
        let id = object.string(for: "mainGroup")!
        return Group(object: objects.object(for: id)!, objects: objects)
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
                let stringValue = StringValue(value: newValue, annotation: nil)
                object[keyref] = stringValue
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
                let existing = object[keyref] as! StringValue
                existing.value = newValue.rawValue
                object[keyref] = existing
            } else {
                let keyref = KeyRef(value: field.rawValue, annotation: nil)
                object[keyref] = StringValue(value: newValue.rawValue, annotation: nil)
            }
        }
        get {
            let rawValue = object.string(for: field.rawValue)!
            return ProductType(rawValue: rawValue)!
        }
    }
    public var productType: ProductType {
        return self[.productType]
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
                if let newValue = newValue {
                    object[keyref] = ArrayValue(value: newValue)
                } else {
                    object[keyref] = nil
                }
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
                object[keyref] = ArrayValue(value: newValue)
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
