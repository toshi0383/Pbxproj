//
//  Group.swift
//  xcconfig-extractor
//
//  Created by Toshihiro Suzuki on 2017/04/30.
//  Copyright © 2017 Toshihiro Suzuki. All rights reserved.
//

import Foundation
import AsciiPlistParser

final public class Group: IsaObject, ObjectsReferencing {
    enum ArrayField: String {
        case children
    }
    enum StringField: String {
        case sourceTree
    }
    enum OptionalStringField: String {
        case path
        case name
    }
    public let object: Object
    public let objects: Object
    public init(object: Object, objects: Object) {
        self.object = object
        self.objects = objects
    }
}
