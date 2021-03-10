//
//  Array+Only.swift
//  Memorize
//
//  Created by melot on 2021/3/10.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
