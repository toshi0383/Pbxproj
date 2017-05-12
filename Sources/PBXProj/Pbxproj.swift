//
//  Pbxproj.swift
//  xcconfig-extractor
//
//  Created by Toshihiro Suzuki on 2017/04/27.
//  Copyright © 2017 Toshihiro Suzuki. All rights reserved.
//

import Foundation
import AsciiPlistParser
import PathKit

public class Pbxproj: AutoPbxSubscript {
    enum StringField: String {
        case archiveVersion
        case objectVersion
    }
    enum ArrayField: String {
        case nop
    }
    enum ObjectField: String {
        case objects
    }
    enum OptionalStringField: String {
        case nop
    }
    enum OptionalArrayField: String {
        case nop
    }
    enum OptionalObjectField: String {
        case classes
    }
    enum ObjectIdField: String {
        case rootObject
    }

    public let object: Object
    public required init(object: Object) {
        self.object = object
    }
    public convenience init(path: String) throws {
        let reader = Reader(path: path)
        try reader.parse()
        self.init(object: reader.object)
    }
    public func string() -> String {
        return object.string()
    }
    public func write(path: String) throws {
        try! Path(path).write(self.string())
    }
}
