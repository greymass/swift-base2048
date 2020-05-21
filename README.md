# swift-base2048

Base2048 encoder & decoder, only does indices so bring your own character map or word list. 


## Install

```swift
let package = Package(
    // ...
    dependencies: [
        .package(url: "https://github.com/greymass/swift-base2048.git", from: "1.0.0"),
    ]
    // ..
)
```


## Usage

```swift
// data to be encoded
let data: [UInt8] = [161, 33, 49, 146]
// word list
let listUrl = "https://raw.githubusercontent.com/bitcoin/bips/master/bip-0039/italian.txt"
let wordList = try! String(contentsOf: URL(string: listUrl)!).split(separator: "\n")
assert(wordList.count >= 2048)
let wordLookup = Dictionary(uniqueKeysWithValues: wordList.enumerated().map { ($0.element, Base2048.Word($0.offset)) })
// encode
let words = Base2048.encode(data).map { wordList[Int($0)] }
print(words.joined(separator: "-")) // fermento-muffa-corpo
// decode
let decoded = Base2048.decode(words.map { wordLookup[$0] ?? 0 })
print(decoded) // [161, 33, 49, 146]
```
