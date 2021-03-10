//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by melot on 2021/3/10.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if matching.id == self[index].id {
                return index
            }
        }
        return nil
    }
}
