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
    init(object: Object)
}

public protocol IsaObject: class, AutoPbxSubscript {
    var isa: IsaType { get }
}

extension IsaObject {
    public var isa: IsaType {
        get { return IsaType(rawValue: object.string(for: "isa")!)! }
        set(newValue) { object["isa"] = newValue.rawValue }
    }
}
