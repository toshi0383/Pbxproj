//
//  FileReference.swift
//  xcconfig-extractor
//
//  Created by Toshihiro Suzuki on 2017/04/30.
//  Copyright © 2017 Toshihiro Suzuki. All rights reserved.
//

import Foundation

public enum FileType: String {
    case xcconfig = "text.xcconfig"
}

public class FileReference: IsaObject {
    public var key: String
    public var rawObject: [String : Any]
    public var lastKnownFileType: FileType
    public var path: String
    public var sourceTree: String

    // custom property
    public var fullPath: String

    public required init?(key: String, value o: [String : Any], objects: [String : Any]) {
        guard IsaType(object: o) == .PBXFileReference else {
            return nil
        }
        self.key = key
        self.rawObject = o
        self.lastKnownFileType = FileType(rawValue: o["lastKnownFileType"] as! String)!
        self.path = o["path"] as! String
        let fullPath = findPaths(to: key, objects: objects) + [self.path]
        self.fullPath = fullPath.joined(separator: "/")
        self.sourceTree = o["sourceTree"] as! String
    }
}
