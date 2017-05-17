//
//  FileReference.swift
//  xcconfig-extractor
//
//  Created by Toshihiro Suzuki on 2017/04/30.
//  Copyright © 2017 Toshihiro Suzuki. All rights reserved.
//

import Foundation
import AsciiPlistParser
import PathKit

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

public enum SourceTree: String {
    case group = "\"<group>\""
    case builtProductsDir = "BUILT_PRODUCTS_DIR"
}

final public class FileReference: IsaObject, ObjectsReferencing {
    enum OptionalRawRepresentableField: String {
        case lastKnownFileType
        case explicitFileType
    }
    enum RawRepresentableField: String {
        case sourceTree
    }
    enum StringField: String {
        case path
    }
    enum OptionalStringField: String {
        case name
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
                if let rawValue = newValue?.rawValue {
                    let existing = object[keyref] as! StringValue
                    existing.value = rawValue
                    object[keyref] = existing
                } else {
                    object[keyref] = nil
                }
            } else {
                if let rawValue = newValue?.rawValue {
                    let keyref = KeyRef(value: field.rawValue, annotation: nil)
                    object[keyref] = StringValue(value: rawValue, annotation: nil)
                }
            }
        }
        get {
            guard let rawValue = object.string(for: field.rawValue) else {
                return nil
            }
            return FileType(rawValue: rawValue)
        }
    }
    subscript(field: RawRepresentableField) -> SourceTree? {
        set(newValue) {
            if let keyref = object.keyRef(for: field.rawValue) {
                if let rawValue = newValue?.rawValue {
                    let existing = object[keyref] as! StringValue
                    existing.value = rawValue
                    object[keyref] = existing
                } else {
                    object[keyref] = nil
                }
            } else {
                if let rawValue = newValue?.rawValue {
                    let keyref = KeyRef(value: field.rawValue, annotation: nil)
                    object[keyref] = StringValue(value: rawValue, annotation: nil)
                }
            }
        }
        get {
            guard let rawValue = object.string(for: field.rawValue) else {
                return nil
            }
            return SourceTree(rawValue: rawValue)
        }
    }
    public var lastKnownFileType: LastKnownFileType? {
        return self[.lastKnownFileType]
    }
    public var explicitFileType: ExplicitFileType? {
        return self[.explicitFileType]
    }
    public var sourceTree: SourceTree? {
        return self[.sourceTree]
    }
}

extension FileReference {
    static func create(path: Path) -> FileReference {
        let fileref = FileReference(object: [:], objects: [:])
        fileref[.lastKnownFileType] = .sourcecodeswift
        fileref[.sourceTree] = .group
        fileref[.path] = path.normalize().string
        fileref.object["isa"] = StringValue(value: IsaType.PBXFileReference.rawValue, annotation: nil)
        assert(fileref.isa == .PBXFileReference)
        return fileref
    }
}

// MARK: Public API
extension FileReference {
    public var fullPath: String {
        let path = findPaths(to: self, objects: objects) + [self.path]
        return path.joined(separator: "/")
    }
}
