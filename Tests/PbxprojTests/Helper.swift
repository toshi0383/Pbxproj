import Foundation

func pathForFixture(fileName: String) -> String {
    #if Xcode
        let name = fileName.components(separatedBy: "/").last!
        return Bundle(for: PbxprojTests.self).path(forResource: name, ofType: nil)!
    #else
        return "Tests/AsciiPlistParserTests/Fixtures/\(fileName)"
    #endif
}
