//
//  Group.swift
//  xcconfig-extractor
//
//  Created by Toshihiro Suzuki on 2017/04/30.
//  Copyright © 2017 Toshihiro Suzuki. All rights reserved.
//

import Foundation
import AsciiPlistParser
import PathKit

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

// MARK: Public API

extension Group {
    public enum BehaviorForAddedFolders {
        case createGroups, createFolderReference
    }

    public func addFiles(paths: [String], copyItemsIfNeeded: Bool = false, behaviorForAddedFolders: BehaviorForAddedFolders = .createGroups, addToTargets targets: [Target] = []) throws {
        for path in paths {
            try addFile(path: Path(path), copyItemsIfNeeded: copyItemsIfNeeded, behaviorForAddedFolders: behaviorForAddedFolders, addToTargets: targets)
        }
    }
    public func addFile(path: Path, copyItemsIfNeeded: Bool = false, behaviorForAddedFolders: BehaviorForAddedFolders = .createGroups, addToTargets targets: [Target] = []) throws {
        if path.isDirectory {
            try _addGroup(path: path, copyItemsIfNeeded: copyItemsIfNeeded, behaviorForAddedFolders: behaviorForAddedFolders, addToTargets: targets)
        } else {
            try _addFileReference(path: path, copyItemsIfNeeded: copyItemsIfNeeded, behaviorForAddedFolders: behaviorForAddedFolders, addToTargets: targets)
        }
    }

    func _addFileReference(path: Path, copyItemsIfNeeded: Bool = false, behaviorForAddedFolders: BehaviorForAddedFolders = .createGroups, addToTargets targets: [Target] = []) throws {
        let fileref = FileReference.create(path: path)
        let filerefId = generateNewId()
        let filename = path.components.last!
        let keyref = KeyRef(value: filerefId, annotation: filename)
        objects[keyref] = fileref.object
        children.append(StringValue(value: filerefId, annotation: filename))
    }
    func _addGroup(path: Path, copyItemsIfNeeded: Bool = false, behaviorForAddedFolders: BehaviorForAddedFolders = .createGroups, addToTargets targets: [Target] = []) throws {
    }
}
