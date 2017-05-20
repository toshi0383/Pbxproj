//
//  BuildFile.swift
//  Pbxproj
//
//  Created by Toshihiro suzuki on 2017/05/18.
//
//

import Foundation
import AsciiPlistParser
import PathKit

final public class BuildFile: IsaObject, ObjectsReferencing {
    enum StringField: String {
        case fileRef
    }
    public let object: Object
    public let objects: Object
    public init(object: Object, objects: Object) {
        self.object = object
        self.objects = objects
    }
}

extension BuildFile {
    static func create(fileRef: String) -> BuildFile {
        let buildfile = BuildFile(object: [:], objects: [:])
        buildfile[.fileRef] = fileRef
        buildfile.object["isa"] = StringValue(value: IsaType.PBXBuildFile.rawValue, annotation: nil)
        assert(buildfile.isa == .PBXBuildFile)
        return buildfile
    }
}
