//
//  FileReferenceTests.swift
//  Pbxproj
//
//  Created by Toshihiro suzuki on 2017/05/16.
//
//

import XCTest

class FileReferenceTests: XCTestCase {

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
        XCTAssertEqual(fileref.sourceTree, "\"<group>\"")
        XCTAssertEqual(fileref.fullPath, "SingleViewApplication/AppDelegate.swift")

        // TODO: Needs proper test
        XCTAssertEqual(
            pbxproj.targets[0].buildConfigurationList.buildConfigurations[0].baseConfigurationReference?.fullPath,
           nil
        )
    }

    func testAddFileReference() {
//        let group: Group = Group.create(path: "hoge/foo", group)
//        group.children.appendChild("Bar.swift")
//        pbxproj.addFileReference(path: "hoge/foo/Bar.swift", group: "model/hage/uge/Bar.swift")
        guard let group = pbxproj.group(named: "SingleViewApplication") else {
            XCTFail()
            return
        }
        group.addFiles(paths: ["hoge/foo/Bar.swift"], copyItemsIfNeeded: false, behaviorForAddedFolders: .createGroups, addToTargets: ["App", "AppTests"], destinationGroup: group)
        let fileref: FileReference = pbxproj.fileReferences(named: "Bar.swift")[0]
        XCTAssertEqual(fileref.isa, .PBXFileReference)
        XCTAssertEqual(fileref.explicitFileType, nil)
        XCTAssertEqual(fileref.lastKnownFileType, .sourcecodeswift)
        XCTAssertEqual(fileref.path, "hoge/foo/Bar.swift")
        XCTAssertEqual(fileref.sourceTree, "\"<group>\"")
        XCTAssertEqual(fileref.fullPath, "SingleViewApplication/AppDelegate.swift")
    }
}
