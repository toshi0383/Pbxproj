import XCTest
import AsciiPlistParser
@testable import PBXProj

class PbxprojTests: XCTestCase {
    var pbxproj: Pbxproj!
    override func setUp() {
        super.setUp()
        #if Xcode
            let path = pathForFixture(fileName: "test.pbxproj")
        #else
            let path = pathForFixture(fileName: "Xcode/8.3.2/SingleViewApplication/SingleViewApplication.xcodeproj/project.pbxproj")
        #endif
        pbxproj = try! Pbxproj(path: path)
    }
    func testPbxproj() {
        XCTAssertEqual(pbxproj.archiveVersion, "1")
        XCTAssertEqual(pbxproj.objectVersion, "46")
        let exObj: Object = [:]
        XCTAssertEqual(pbxproj.classes!, exObj)
    }
    func testModification() {
        XCTAssertEqual(pbxproj.archiveVersion, "1")
        pbxproj.archiveVersion = "2"
        XCTAssertEqual(pbxproj.archiveVersion, "2")
        XCTAssert(pbxproj.string().contains("archiveVersion = 2"))
        _ = pbxproj.rootObject
        pbxproj.targets[0].name = "Hello Modified"
        XCTAssertEqual(pbxproj.targets[0].name, "Hello Modified")
        XCTAssert(pbxproj.string().contains("Hello Modified"))
    }
}
