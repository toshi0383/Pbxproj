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
//    enum AnyIsaObjectReferencingArrayField: String {
//        case files
//    }
    public let object: Object
    public let objects: Object
    public init(object: Object, objects: Object) {
        self.object = object
        self.objects = objects
    }
}

public class AnyIsaObject: IsaObject, ObjectsReferencing {
    public let object: Object
    public let objects: Object
    public init(object: Object, objects: Object) {
        self.object = object
        self.objects = objects
    }
}

//extension BuildPhase {
//    subscript(field: AnyIsaObjectReferencingArrayField) -> [AnyIsaObject] {
//        set(newValue) {
//            let ids = newValue.map { objects }
//            if let keyref = object.keyRef(for: field.rawValue) {
//                let existing = object[keyref] as! ArrayValue
//                existing.value = ids
//                object[keyref] = existing
//            } else {
//                let keyref = KeyRef(value: field.rawValue, annotation: nil)
//                let arrayValue = ArrayValue(value: ids, annotation: nil)
//                object[keyref] = arrayValue
//            }
//        }
//        get {
//            return object.stringArray(for: field.rawValue)!.flatMap { id in
//                guard let o = objects.object(for: id) else {
//                    return nil
//                }
//                return AnyIsaObject(object: o, objects: objects)
//            }
//        }
//    }
//
//    public var files: String {
//        get { return self[.files] }
//        set(newValue) { self[.files] = newValue }
//    }
//}
