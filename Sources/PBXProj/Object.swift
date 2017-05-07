import Foundation
import AsciiPlistParser

public enum IsaType: String {
    case XCConfigurationList
    case XCBuildConfiguration
    case PBXSourcesBuildPhase
    case PBXShellScriptBuildPhase
    case PBXResourcesBuildPhase
    case PBXProject
    case PBXNativeTarget
    case PBXGroup
    case PBXFrameworksBuildPhase
    case PBXBuildRule
    case PBXBuildFile
    case PBXFileReference
    case PBXContainerItemProxy
    case PBXVariantGroup
    case PBXTargetDependency
    case PBXCopyFilesBuildPhase
    case XCVersionGroup
    init(object: Object) {
        self.init(rawValue: object.string(for: "isa")!)!
    }
}

protocol AutoPbxSubscript { }

//protocol PBXObject {
//    static func decode(_ object: Object) throws -> Self
//}
//
//public class PBXObject: _PBXObject {
//    subscript(field: StringField) -> String {
//        set(newValue) {
//            if let keyref = object.keyRef(for: field.rawValue) {
//                let existing = object[keyref] as! StringValue
//                existing.value = newValue
//                object[keyref] = existing
//            } else {
//                let keyref = KeyRef(value: field.rawValue, annotation: nil)
//                object[keyref] = newValue
//            }
//        }
//        get {
//            return object.string(for: field.rawValue)!
//        }
//    }
//}
//
//public protocol StringFieldType: RawRepresentable { }
//public protocol ArrayFieldType: RawRepresentable { }
//public protocol ObjectFieldType: RawRepresentable { }
//public protocol OptionalStringFieldType: RawRepresentable { }
//public protocol OptionalArrayFieldType: RawRepresentable { }
//public protocol OptionalObjectFieldType: RawRepresentable { }
//
//public protocol IsaObject {
//    var key: String { get }
//    var isa: IsaType { get }
//    init?(key: String, objects: Object)
//}
