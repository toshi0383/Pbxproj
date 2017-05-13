import Foundation
import AsciiPlistParser

public class RootObject: IsaObject, ObjectsReferencing {
    enum StringField: String {
        case compatibilityVersion
        case developmentRegion
        case hasScannedForEncodings
        case mainGroup
        case productRefGroup // Can be represented as Object
        case projectDirPath
    }
    enum ArrayField: String {
        case knownRegions
    }
    enum ObjectField: String {
        case attributes
        case buildConfigurationList
    }
    enum OptionalStringField: String {
        case projectRoot
    }
    enum ObjectsReferencingArrayField {
        case targets
    }
    public let object: Object
    public let objects: Object
    public required init(object: Object, objects: Object) {
        self.object = object
        self.objects = objects
    }
}
