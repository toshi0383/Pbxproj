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
    case sourcecodeswift = "sourcecode.swift"
    case filestoryboard = "file.storyboard"
    case folderassetcatalog = "folder.assetcatalog"
    case wrapperxcdatamodel = "wrapper.xcdatamodel"
    case wrappercfbundle = "wrapper.cfbundle"
    case textplistxml = "text.plist.xml"
    case wrapperapplication = "wrapper.application"
}

final public class FileReference: IsaObject, ObjectsReferencing {
    enum OptionalRawRepresentableField: String {
        case lastKnownFileType
        case explicitFileType
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

public typealias LastKnownFileType = FileType
public typealias ExplicitFileType = FileType

extension FileReference {
    subscript(field: OptionalRawRepresentableField) -> FileType? {
        set(newValue) {
            if let keyref = object.keyRef(for: field.rawValue) {
                object[keyref] = newValue?.rawValue
            } else {
                let keyref = KeyRef(value: field.rawValue, annotation: nil)
                object[keyref] = newValue?.rawValue
            }
        }
        get {
            guard let rawValue = object.string(for: field.rawValue) else {
                return nil
            }
            return FileType(rawValue: rawValue)
        }
    }
    public var lastKnownFileType: LastKnownFileType? {
        return self[.lastKnownFileType]
    }
    public var explicitFileType: ExplicitFileType? {
        return self[.explicitFileType]
    }
}

// MARK: Useful API
extension FileReference {
    public var fullPath: String {
        let path = findPaths(to: self, objects: objects) + [self.path]
        return path.joined(separator: "/")
    }
}
