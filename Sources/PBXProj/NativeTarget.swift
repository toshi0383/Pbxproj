//
//  Target.swift
//  xcconfig-extractor
//
//  Created by Toshihiro Suzuki on 2017/04/27.
//  Copyright © 2017 Toshihiro Suzuki. All rights reserved.
//

import Foundation
import AsciiPlistParser

public enum ProductType: String {
    case application = "com.apple.product-type.application"
    case unitTest = "com.apple.product-type.bundle.unit-test"
    case framework = "com.apple.product-type.framework"
    case uiTesting = "com.apple.product-type.bundle.ui-testing"
    case tool = "com.apple.product-type.tool"
}

final public class Target: IsaObject, ObjectsReferencing {
    enum StringField: String {
        case name
        case productName
        case productReference // TODO: FileReferencingField
    }
    enum RawRepresentableField: String {
        case productType
    }
    enum OptionalArrayField: String {
        case buildRules   // TODO: [String] or some object?
    }
    enum ArrayField: String {
        case dependencies // TODO: [FileReferencingField]
    }
    enum ObjectsReferencingField: String {
        case buildConfigurationList
    }
    public let object: Object
    public let objects: Object
    public init(object: Object, objects: Object) {
        self.object = object
        self.objects = objects
    }
}
