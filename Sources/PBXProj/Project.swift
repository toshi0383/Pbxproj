import Foundation
import AsciiPlistParser

public class Project: IsaObject {
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
        case targets
    }
    enum ObjectField: String {
        case attributes
        case buildConfigurationList
    }
    enum OptionalStringField: String {
        case projectRoot
    }
    public let object: Object
    public required init(object: Object) {
        self.object = object
    }
}
