public struct Base2048 {
    /// 11-bit base 2048 word.
    ///
    /// Stored in a 16-bit container, overflow is clamped down.
    public typealias Word = UInt16

    /// Encode array of bytes to base2048 indices.
    public static func encode(_ data: [UInt8]) -> [Word] {
        guard !data.isEmpty else { return [] }
        var words: [Word] = [0]
        var carry: UInt32
        for byte in data {
            carry = UInt32(byte)
            for i in 0 ..< words.count {
                carry += UInt32(words[i]) << 8
                words[i] = Word(carry % 2048)
                carry /= 2048
            }
            while carry > 0 {
                words.append(Word(carry % 2048))
                carry /= 2048
            }
        }
        for i in 0 ..< data.count - 1 {
            guard data[i] == 0 else { break }
            words.append(0)
        }
        return words.reversed()
    }

    /// Decode array of base2048 indices to bytes.
    public static func decode(_ words: [Word]) -> [UInt8] {
        guard !words.isEmpty else { return [] }
        var data: [UInt8] = [0]
        var carry: UInt32
        for word in words {
            carry = UInt32(word > 2047 ? 2047 : word)
            for i in 0 ..< data.count {
                carry += UInt32(data[i]) * 2048
                data[i] = UInt8(carry & 0xFF)
                carry >>= 8
            }
            while carry > 0 {
                data.append(UInt8(carry & 0xFF))
                carry >>= 8
            }
        }
        for i in 0 ..< words.count - 1 {
            guard words[i] == 0 else { break }
            data.append(0)
        }
        return data.reversed()
    }
}
