//
//  Task.swift
//  PTFramework
//
//  Created by Brandon Gouws on 2020/03/02.
//

import Foundation
import UIKit

public class PTTask {
    public var title: String
    public var  hour: String
    public var  minute: String
    public var  second: String
    public init(title: String, hour: String, minute: String, second: String) {
        self.title = title
        self.hour = hour
        self.minute = minute
        self.second = second
    }
}


