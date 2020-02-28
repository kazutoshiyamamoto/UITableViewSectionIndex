//
//  String+Extensions.swift
//  UITableViewSectionIndex
//
//  Created by home on 2020/02/28.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import Foundation

extension String {
    // ひらがな入力をカタカナに変換
    var toKatakana: String? {
        return self.applyingTransform(.hiraganaToKatakana, reverse: false)
    }
}
