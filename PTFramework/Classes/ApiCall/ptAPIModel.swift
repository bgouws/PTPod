//
//  ptAPIModel.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/04/05.
//

import Foundation

public struct Quote: Decodable {
    var firstName: String
    var lastName: String
    var quote: String
}
