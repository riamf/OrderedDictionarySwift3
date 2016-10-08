//
//  OrderedDictionary.swift
//  OrderedDictionarySwift3
//
//  Created by Pawel Kowalczuk on 08/10/16.
//  Copyright © 2016 Pawel Kowalczuk. All rights reserved.
//

import Foundation

struct OrderedDictionary<K: Hashable, V>: Sequence, IteratorProtocol {
    var keys: Array<K> = []
    var values: Dictionary<K,V> = [:]
    
    var idx = 0
    mutating func next() -> [K : V]? {
        guard idx < count else { return nil }
        let key = keys[idx]
        guard let value = values[key] else { return nil }
        return [key:value]
    }
    
    var count: Int {
        assert(keys.count == values.count, "Keys and values array out of sync")
        return self.keys.count;
    }
    
    init() {}
    
    subscript(index: Int) -> V? {
        get {
            let key = self.keys[index]
            return self.values[key]
        }
        set(newValue) {
            let key = self.keys[index]
            if (newValue != nil) {
                self.values[key] = newValue
            } else {
                self.values.removeValue(forKey: key)
                self.keys.remove(at: index)
            }
        }
    }
    
    subscript(key: K) -> V? {
        get {
            return self.values[key]
        }
        set(newValue) {
            if newValue == nil {
                self.values.removeValue(forKey: key)
                self.keys = self.keys.filter {$0 != key}
            } else {
                let oldValue = self.values.updateValue(newValue!, forKey: key)
                if oldValue == nil {
                    self.keys.append(key)
                }
            }
        }
    }

    mutating func removeValue(forKey key: K) -> V? {
        guard let index = keys.index(of: key) else { return nil }
        keys.remove(at: index)
        return values.removeValue(forKey: key)
    }

    mutating func removeAll() {
        keys.removeAll()
        values.removeAll()
    }

    func isEmpty() -> Bool {
        return keys.isEmpty
    }

    var description: String {
        var result = "{\n"
        for i in 0..<self.count {
            result += "[\(i)]: \(self.keys[i]) => \(self[i])\n"
        }
        result += "}"
        return result
    }
}
