//
//  BuildConfigurationList.swift
//  xcconfig-extractor
//
//  Created by Toshihiro Suzuki on 2017/04/27.
//  Copyright © 2017 Toshihiro Suzuki. All rights reserved.
//

import Foundation
import AsciiPlistParser

public class BuildConfigurationList: IsaObject, ObjectsReferencing {
    enum ObjectsReferencingArrayField {
        case buildConfigurations
    }
    enum OptionalStringField: String {
        case defaultConfigurationName
    }
    enum StringField: String {
        case defaultConfigurationIsVisible
    }
    public let object: Object
    public let objects: Object
    public init(object: Object, objects: Object) {
        self.object = object
        self.objects = objects
    }
}

public class BuildConfiguration: IsaObject, ObjectsReferencing {
    enum StringField: String {
        case name
    }
    enum OptionalFileReferencingField: String {
        case baseConfigurationReference
    }
    enum ObjectField: String {
        case buildSettings
    }
    public let object: Object
    public let objects: Object
    public init(object: Object, objects: Object) {
        self.object = object
        self.objects = objects
    }
}
