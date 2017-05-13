//
//  NativeTarget.swift
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

final public class NativeTarget: IsaObject {
    enum StringField: String {
        case name
        case productName
        case productReference // TODO: Can be ObjectIdField ?
        case buildConfigurationList
    }
    enum RawRepresentableField: String {
        case productType
    }
    enum OptionalArrayField: String {
        case buildRules   // TODO: Can be ObjectIdField ?
    }
    enum ArrayField: String {
        case dependencies // TODO: Can be ObjectIdField ?
    }
    public let object: Object
    public required init(object: Object) {
        self.object = object
    }
}
