import Foundation
import Pbxproj
import PathKit

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

func createPathAndFiles(path: String) {
    let components = path.components(separatedBy: "/")
    let dir = components.dropLast()
    let d = Path(components: dir)
    if d.exists == false {
        try! d.mkpath()
    }
    let file = components.last!
    try! (d + file).write("")
}
