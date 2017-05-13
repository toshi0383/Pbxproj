# Pbxproj
Read and Modify Xcode's pbxproj.
`pbxproj` format (a.k.a. ascii plist format) is a bit complicated. This library provides useful shorthand APIs.

# Why
Currently Apple does not provide any interfaces to write pbxproj files.  
Simple read tools are still provided by Apple, so you can go on and use them if you don't need write feature.  
e.g. `plutil` or `/usr/libexec/PlistBuddy` from CLI, `PropertyListSerialization` in Foundation.

# Requirements
## pbxproj version
Xcode8+ is officially supported, but should work against old ones, too.

## Development
Swift3.1

# Examples
## Update every targets' buildSettings
```swift
let path = "App.xcodeproj/project.pbxproj"
let pbxproj = try! Pbxproj(path: path)

for target in pbxproj.targets {
    for configuration in target.buildConfigurationList.buildConfigurations {
        configuration.buildSettings["ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES"] = "YES"
    }
}

try! pbxproj.write(path: path)
```

## Interact with underlying Object
Pbxproj uses [toshi0383/AsciiPlistParser](https://github.com/toshi0383/AsciiPlistParser) to parse/serialize ascii plist.  
You can interact with underlying Object directly. This way you can even deal with unknown objects in future, without waiting for this library to be updated.  

```swift
for target in pbxproj.targets {
    let object: Object = target.object // returns AsciiPlistParser.Object
    let value: String? = object.string(for: "someUnknownField")
}
```

See [toshi0383/AsciiPlistParser](https://github.com/toshi0383/AsciiPlistParser) for detail.

# TODOs
A lot of fundamental features are still work-in-progress.  

- [ ] parse all kind of objects
- [ ] add useful features like sort
- [ ] provide CLI interface
- [ ] add more tests

Contribution is welcomed.

# Development
- Run `make bootstrap` to checkout and build dependencies.
- Run `make sourcery` to update auto generated source code.

`.build/debug/sourcery` may fail. Clone and Build Sourcery from source code if it doesn't work, then run following.

```
SOURCERY=your-path-to/sourcery make sourcery
```

# License
MIT

