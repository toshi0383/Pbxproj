import Foundation
import Pbxproj

func pathForFixture(fileName: String) -> String {
    #if Xcode
        let name = fileName.components(separatedBy: "/").last!
        return Bundle(for: PbxprojTests.self).path(forResource: name, ofType: nil)!
    #else
        return "Tests/AsciiPlistParserTests/Fixtures/\(fileName)"
    #endif
}

func _pbxproj() -> Pbxproj {
    #if Xcode
        let path = pathForFixture(fileName: "test.pbxproj")
    #else
        let path = pathForFixture(fileName: "Xcode/8.3.2/SingleViewApplication/SingleViewApplication.xcodeproj/project.pbxproj")
    #endif
    return try! Pbxproj(path: path)
}
