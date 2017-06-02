import XCTest
import PathKit
import AsciiPlistParser
@testable import Pbxproj

class BuildConfigurationTests: XCTestCase {
    var pbxproj: Pbxproj!
    override func setUp() {
        super.setUp()
        self.pbxproj = _pbxproj()
    }
    func testMutateBaseConfigurationReference() {
        // prepare files
        let c = pbxproj.rootObject.buildConfigurationList.buildConfigurations[0]
        cleanup(path: "foo")
        createPathAndFiles(path: "foo/Bar.xcconfig")
        // test code
        try! pbxproj.rootObject.mainGroup.addFiles(paths: ["foo"])
        let fileref = pbxproj.fileReferences(named: "Bar.xcconfig")[0]
        c.baseConfigurationReference = fileref
        XCTAssertEqual(c.baseConfigurationReference?.fullPath, "foo/Bar.xcconfig")
        guard let generatedId = pbxproj.objects.key(for: fileref.object) else {
            XCTFail("generatedId iof fileref is not found in pbxproj.objects.")
            return
        }
        XCTAssertEqual(generatedId, c.object.string(for: "baseConfigurationReference"))
    }
}
