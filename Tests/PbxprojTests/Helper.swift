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
        let path = "Tests/PbxprojTests/test.pbxproj"
    #endif
    return try! Pbxproj(path: path)
}
