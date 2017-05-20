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

public class Pbxproj: AutoPbxSubscript, ObjectsReferencing {
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
    enum ObjectReferencingField: String {
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

// MARK: - Public API

// MARK: Files and Groups API
extension Pbxproj {
    public func buildFiles() -> [BuildFile] {
        return objects.flatMap { $0.1 as? Object }.filter { $0.isa == .PBXBuildFile }.map { BuildFile(object: $0, objects: objects) }
    }

    public func target(named: String) -> Target? {
        return targets.filter { $0.name == named }.first
    }

    public func buildFile(named: String) -> BuildFile? {
        return buildFiles().flatMap {
            guard let o = objects.object(for: $0.fileRef) else {
                return nil
            }
            if o.isa == .PBXFileReference {
                let fileref = FileReference(object: o, objects: objects)
                return (fileref.name == named || fileref.path == named) ? $0 : nil
            } else {
                // TODO: Handle PBXVariantGroup and XCVersionGroup
                return nil
            }
        }.first
    }

    public func fileReferences() -> [FileReference] {
        return objects.flatMap { $0.1 as? Object }.filter { $0.isa == .PBXFileReference }.map { FileReference(object: $0, objects: objects) }
    }

    public func groups() -> [Group] {
        return objects.flatMap { $0.1 as? Object }.filter { $0.isa == .PBXGroup }.map { Group(object: $0, objects: objects) }
    }

    public func fileReferences(named: String) -> [FileReference] {
        return fileReferences().filter { $0.path == named || $0.name == named }
    }

    public func groups(named: String) -> [Group] {
        return groups().filter { $0.path == named || $0.name == named }
    }
}

// MARK: Shorthand Alias API
extension Pbxproj {
    public var targets: [Target] {
        return rootObject.targets
    }
}
