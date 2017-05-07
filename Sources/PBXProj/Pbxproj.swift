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
        case rootObject
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

    var object: Object
    public init(path: String) throws {
        let reader = Reader(path: path)
        try reader.parse()
        self.object = reader.object
        //let rootObjectKey =
        //Project(key: rootObjectKey, objects: objects)!
    }
    public func string() -> String {
        return object.string()
    }
    public func write(path: String) throws {
        try! Path(path).write(self.string())
    }
}
