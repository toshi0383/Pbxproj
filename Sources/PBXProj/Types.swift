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

public protocol AutoPbxSubscript {
    var object: Object { get }
}

public protocol ObjectsReferencing: AutoPbxSubscript {
    var objects: Object { get }
    func objectTuple(for id: String) -> (Object, Object)
    var anyIsaObject: AnyIsaObject { get }
}

extension ObjectsReferencing {
    public func objectTuple(for id: String) -> (Object, Object) {
        return (objects.object(for: id)!, objects)
    }
    public var anyIsaObject: AnyIsaObject {
        return AnyIsaObject(object: object, objects: objects)
    }
}

public protocol IsaObject: class, AutoPbxSubscript {
    var isa: IsaType { get set }
}

extension IsaObject {
    public var isa: IsaType {
        get { return IsaType(rawValue: object.string(for: "isa")!)! }
        set(newValue) { object["isa"] = newValue.rawValue }
    }
}
