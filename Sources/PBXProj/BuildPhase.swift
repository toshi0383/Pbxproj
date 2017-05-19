import Foundation
import AsciiPlistParser
import PathKit

public typealias File = Object

final public class BuildPhase: IsaObject, ObjectsReferencing {
    enum StringField: String {
        case buildActionMask
        case runOnlyForDeploymentPostprocessing
    }
    enum ArrayField: String {
        case files
    }
    public let object: Object
    public let objects: Object
    public init(object: Object, objects: Object) {
        self.object = object
        self.objects = objects
    }
}
