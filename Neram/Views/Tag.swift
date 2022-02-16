//
//  Tag.swift
//  Neram
//
//  Created by Selvarajan on 27/12/21.
//

import SwiftUI

//model
struct Tag: Identifiable, Hashable {
    var id = UUID().uuidString
    var text: String
    var size: CGFloat = 0
}
