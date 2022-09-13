//
//   MIError.swift
//  Vybes (iOS)
//
//  Created by MacBook on 2022-09-13.
//

import Foundation

public struct MIError: Error {
    var status: Int?
    var title: String?
    var message: String
}
