import Foundation
import Combine

// MARK: - Interface

/// Represents a way of encoding a single value.
public struct Decoding<Value> {
    /// A function that uses the provided decoder to decode the given input value
    public var decode: (Decoder) throws -> Value

    public init(decode: @escaping (Decoder) throws -> Value) {
        self.decode = decode
    }
}

// MARK: - Encoder API

fileprivate struct DecodingProxy: Decodable {
    let decoder: Decoder

    init(from decoder: Decoder) throws {
        self.decoder = decoder
    }

    func decode<Output: Decodable>(using decoding: Decoding<Output>) throws -> Output {
        try decoding.decode(decoder)
    }
}

public extension TopLevelDecoder {
    /// Encodes a value `T` using the given encoding.
    ///
    /// - Parameters:
    ///     - value: The value to be encoded.
    ///     - encoding: The encoding used to encode the value.
    ///
    func decode<T: Decodable>(_ input: Input, as decoding: Decoding<T>) throws -> T {
        try decode(DecodingProxy.self, from: input).decode(using: decoding)
    }
}

// MARK: - Build-in decodings

public extension Decoding where Value == UInt16 {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == Int64 {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == Int8 {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == Double {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == String {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == UInt64 {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == UInt8 {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == Float {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == UInt32 {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == UInt {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == Int {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == Int32 {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value == Bool {
    static let singleValue = Self { decoder in
        let container = try decoder.singleValueContainer()
        return try container.decode(Value.self)
    }

    static let unkeyed = Self { decoder in
        var container = try decoder.unkeyedContainer()
        return try container.decode(Value.self)
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }
}

public extension Decoding where Value: Decodable {
    static var singleValue: Self {
        .init { decoder in
            let container = try decoder.singleValueContainer()
            return try container.decode(Value.self)
        }
    }

    static var unkeyed: Self {
        .init { decoder in
            var container = try decoder.unkeyedContainer()
            return try container.decode(Value.self)
        }
    }

    static var optionalUnkeyed: Decoding<Value?> {
        .init { decoder in
            var container = try decoder.unkeyedContainer()
            return try container.decodeIfPresent(Value.self)
        }
    }

    static func withKey<Key: CodingKey>(_ key: Key) -> Self {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decode(Value.self, forKey: key)
        }
    }

    static func optionalWithKey<Key: CodingKey>(_ key: Key) -> Decoding<Value?> {
        .init { decoder in
            let container = try decoder.container(keyedBy: Key.self)
            return try container.decodeIfPresent(Value.self, forKey: key)
        }
    }
}
