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
    public init?(filename: String) {
        guard let ext = Path(filename).extension else {
            return nil
        }
        switch ext {
        case "xcconfig":
            self = .xcconfig
        case "swift":
            self = .sourcecodeswift
        case "storyboard":
            self = .filestoryboard
        case "xcassets":
            self = .folderassetcatalog
        case "xcdatamodeld":
            self = .wrapperxcdatamodel
        case "plist":
            self = .textplistxml
        case "bundle":
            self = .wrappercfbundle
        case "app":
            self = .wrapperapplication
        default:
            return nil
        }
    }
}

public enum SourceTree: String {
    case group = "\"<group>\""
    case builtProductsDir = "BUILT_PRODUCTS_DIR"
}

final public class FileReference: IsaObject, ObjectsReferencing {
    enum OptionalFileTypeField: String {
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
        case fileEncoding
    }
    public let object: Object
    public let objects: Object
    public init(object: Object, objects: Object) {
        self.object = object
        self.objects = objects
    }
}

extension FileReference {
    static func create(path: Path) -> FileReference {
        let fileref = FileReference(object: [:], objects: [:])
        fileref[.lastKnownFileType] = FileType(filename: path.lastComponent)!
        fileref[.sourceTree] = .group
        fileref[.fileEncoding] = "4"
        let filename = path.components.last!
        fileref[.name] = filename
        fileref[.path] = path.string
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
