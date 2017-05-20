//
//  FilesAndGroupsTests.swift
//  Pbxproj
//
//  Created by Toshihiro suzuki on 2017/05/16.
//
//

import XCTest
import PathKit
import AsciiPlistParser
@testable import Pbxproj

class FilesAndGroupsTests: XCTestCase {

    var pbxproj: Pbxproj!
    override func setUp() {
        super.setUp()
        self.pbxproj = _pbxproj()
    }

    func testFileReference() {
        let objects = pbxproj.objects
        let fileref = FileReference(object: pbxproj.objects.object(for: "1F88C5871EB47C3C002A5302")!, objects: objects) // AppDelegate.swift
        XCTAssertEqual(fileref.isa, .PBXFileReference)
        XCTAssertEqual(fileref.explicitFileType, nil)
        XCTAssertEqual(fileref.lastKnownFileType, .sourcecodeswift)
        XCTAssertEqual(fileref.path, "AppDelegate.swift")
        XCTAssertEqual(fileref.sourceTree, .group)
        XCTAssertEqual(fileref.fullPath, "SingleViewApplication/AppDelegate.swift")

        // TODO: Needs proper test
        XCTAssertEqual(
            pbxproj.targets[0].buildConfigurationList.buildConfigurations[0].baseConfigurationReference?.fullPath,
           nil
        )
    }

    func testAddAFile() {
        // mkdir and touch a file
        let dir = Path("hoge/foo")
        try! dir.mkpath()
        let file = dir + "Bar.swift"
        try! file.write("")

        // test code
        let appTarget = pbxproj.target(named: "SingleViewApplication")!
        let group = pbxproj.groups(named: "SingleViewApplication")[0]
        try! group.addFiles(paths: ["./hoge/foo/Bar.swift"], copyItemsIfNeeded: false, behaviorForAddedFolders: .createGroups, addToTargets: [appTarget])
        let fileref: FileReference = pbxproj.fileReferences(named: "hoge/foo/Bar.swift")[0]
        XCTAssertEqual(fileref.isa, .PBXFileReference)
        XCTAssertEqual(fileref.explicitFileType, nil)
        XCTAssertEqual(fileref.lastKnownFileType, .sourcecodeswift)
        XCTAssertEqual(fileref.path, "hoge/foo/Bar.swift")
        XCTAssertEqual(fileref.sourceTree, .group)
        XCTAssertEqual(fileref.fullPath, "SingleViewApplication/hoge/foo/Bar.swift")
        XCTAssert(pbxproj.string().contains("/* Bar.swift */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = sourcecode.swift; name = Bar.swift; path = hoge/foo/Bar.swift; sourceTree = \"<group>\"; };"))
        let fileRefId = pbxproj.objects.key(for: fileref.object)!
        let buildFile: BuildFile = pbxproj.buildFile(named: "Bar.swift")!
        XCTAssertEqual(buildFile.isa, .PBXBuildFile)
        XCTAssertEqual(buildFile.fileRef, fileRefId)
        XCTAssert(pbxproj.string().contains("/* Bar.swift in Sources */ = {isa = PBXBuildFile; fileRef ="))
    }

    func testAddAFolderAsGroup() {
        // mkdir and touch a file
        for path in ["hoge/foo/Bar.xcconfig", "hoge/foo/Foo.xcconfig", "hoge/foo/bar/Age.xcconfig"] {
            createPathAndFiles(path: path)
        }

        // test code
        let g = pbxproj.rootObject.mainGroup
        try! g.addFiles(paths: ["./hoge/foo"], copyItemsIfNeeded: false, behaviorForAddedFolders: .createGroups, addToTargets: [])
        guard let group = pbxproj.groups(named: "hoge/foo").first else {
            XCTFail("groups not found.")
            print(pbxproj.string())
            return
        }
        XCTAssertEqual(group.isa, .PBXGroup)
        XCTAssertEqual(group.path, "hoge/foo")
        XCTAssertEqual(group.children.count, 3)
        XCTAssertEqual(group.sourceTree, .group)
        guard let fileref = pbxproj.fileReferences(named: "Bar.xcconfig").first else {
            XCTFail("fileReferences not found.")
            print(pbxproj.string())
            return
        }
        XCTAssertEqual(fileref.isa, .PBXFileReference)
        XCTAssertEqual(fileref.explicitFileType, nil)
        XCTAssertEqual(fileref.lastKnownFileType, .xcconfig)
        XCTAssertEqual(fileref.path, "Bar.xcconfig")
        XCTAssertEqual(fileref.sourceTree, .group)
        XCTAssertEqual(fileref.fullPath, "hoge/foo/Bar.xcconfig")
        let expected = "/* Bar.xcconfig */ = {isa = PBXFileReference; fileEncoding = 4; lastKnownFileType = text.xcconfig; name = Bar.xcconfig; path = Bar.xcconfig; sourceTree = \"<group>\"; };"
        if pbxproj.string().contains(expected) == false {
            XCTFail("pbxproj.string() does not contain expected string. \(expected)")
            print(pbxproj.string())
        }
        guard let agefileref = pbxproj.fileReferences(named: "Age.xcconfig").first else {
            XCTFail("fileReferences not found.")
            print(pbxproj.string())
            return
        }
        XCTAssertEqual(agefileref.fullPath, "hoge/foo/bar/Age.xcconfig")
    }

}
