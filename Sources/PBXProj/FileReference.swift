//
//  FileReference.swift
//  xcconfig-extractor
//
//  Created by Toshihiro Suzuki on 2017/04/30.
//  Copyright © 2017 Toshihiro Suzuki. All rights reserved.
//

import Foundation
import AsciiPlistParser

public enum FileType: String {
    case xcconfig = "text.xcconfig"
}

typealias LastKnownFileType = FileType

final public class FileReference: IsaObject, ObjectsReferencing {
    enum RawRepresentableField: String {
        case lastKnownFileType
    }
    enum StringField: String {
        case path
        case sourceTree
    }
    public let object: Object
    public let objects: Object
    public init(object: Object, objects: Object) {
        self.object = object
        self.objects = objects
    }
}

extension FileReference {
    public var fullPath: String {
        let path =  findPaths(to: self, objects: objects) + [self.path]
        return path.joined(separator: "/")
    }
}
