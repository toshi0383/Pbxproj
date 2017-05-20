import XCTest
import AsciiPlistParser
@testable import Pbxproj

class PbxprojTests: XCTestCase {
    var pbxproj: Pbxproj!
    override func setUp() {
        super.setUp()
        self.pbxproj = _pbxproj()
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
        pbxproj.targets[0].name = "Hello Modified"
        XCTAssertEqual(pbxproj.targets[0].name, "Hello Modified")
        XCTAssert(pbxproj.string().contains("Hello Modified"))
    }

    func testBuildSettings() {
        XCTAssert(pbxproj.string().contains("jp.toshi0383.HelloWorld") == false)
        for target in pbxproj.targets {
            if target.name != "SingleViewApplicationTests" {
                continue
            }
            for configuration in target.buildConfigurationList.buildConfigurations {
                XCTAssertEqual(configuration.buildSettings.string(for: "PRODUCT_BUNDLE_IDENTIFIER")!, "jp.toshi0383.SingleViewApplicationTests")
                configuration.buildSettings["PRODUCT_BUNDLE_IDENTIFIER"] = "jp.toshi0383.HelloWorld"
            }
        }
        XCTAssert(pbxproj.string().contains("jp.toshi0383.HelloWorld"))
    }
}
