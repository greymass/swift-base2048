import Base2048
import XCTest

final class Base2048Tests: XCTestCase {
    func testEncode() {
        XCTAssertEqual(Base2048.encode([]), [])
        XCTAssertEqual(Base2048.encode([0]), [0])
        XCTAssertEqual(Base2048.encode([7, 255]), [2047])
        XCTAssertEqual(Base2048.encode([0, 0, 1]), [0, 0, 1])
        XCTAssertEqual(Base2048.encode([0, 0, 0]), [0, 0, 0])
        XCTAssertEqual(Base2048.encode([100, 100, 100]), [1, 1164, 1124])
        XCTAssertEqual(Base2048.encode([255]), [255])
        XCTAssertEqual(Base2048.encode([255, 255]), [31, 2047])
        XCTAssertEqual(
            Base2048.encode([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]),
            [8, 128, 1544, 80, 771, 1056, 289, 523]
        )
        XCTAssertEqual(
            Base2048.encode([
                0x7C, 0x3E, 0x38, 0x8A, 0x47, 0x0A, 0xF6, 0x7D, 0xF0, 0x15, 0xF6,
                0xFA, 0xAE, 0x04, 0x9D, 0x42, 0x22, 0xB1, 0x64, 0xC9, 0xF8, 0x6D,
                0x3E, 0x90, 0x32, 0x72, 0x72, 0x9E, 0x83, 0x23, 0x49, 0x02,
            ]),
            [
                3, 1807, 1137, 164, 901,
                985, 1982, 21, 1975, 1707,
                1033, 468, 273, 709, 1177,
                504, 873, 1956, 100, 1831,
                335, 524, 1129, 258,
            ]
        )
    }

    func testDecode() {
        XCTAssertEqual(Base2048.decode([]), [])
        XCTAssertEqual(Base2048.decode([0]), [0])
        XCTAssertEqual(Base2048.decode([2047]), [7, 255])
        XCTAssertEqual(Base2048.decode([0, 0, 0]), [0, 0, 0])
        XCTAssertEqual(Base2048.decode([0, 0, 1]), [0, 0, 1])
        XCTAssertEqual(Base2048.decode([1, 1164, 1124]), [100, 100, 100])
        XCTAssertEqual(Base2048.decode([255]), [255])
        XCTAssertEqual(Base2048.decode([31, 2047]), [255, 255])
        XCTAssertEqual(Base2048.decode([31, 2054]), [255, 255])
        XCTAssertEqual(Base2048.decode([31, UInt16.max]), [255, 255])
        XCTAssertEqual(
            Base2048.decode([8, 128, 1544, 80, 771, 1056, 289, 523]),
            [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
        )
        XCTAssertEqual(
            Base2048.decode([
                3, 1807, 1137, 164, 901,
                985, 1982, 21, 1975, 1707,
                1033, 468, 273, 709, 1177,
                504, 873, 1956, 100, 1831,
                335, 524, 1129, 258,
            ]),
            [
                0x7C, 0x3E, 0x38, 0x8A, 0x47, 0x0A, 0xF6, 0x7D, 0xF0, 0x15, 0xF6,
                0xFA, 0xAE, 0x04, 0x9D, 0x42, 0x22, 0xB1, 0x64, 0xC9, 0xF8, 0x6D,
                0x3E, 0x90, 0x32, 0x72, 0x72, 0x9E, 0x83, 0x23, 0x49, 0x02,
            ]
        )
    }
}
