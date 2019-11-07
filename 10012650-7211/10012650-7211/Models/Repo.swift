//
//  Repo.swift
//  10012650-7211
//
//  Created by Dayne Game on 6/11/19.
//  Copyright © 2019 Dayne Game. All rights reserved.
//

import Foundation
import SwiftUI

struct Repo: Identifiable, Decodable , Hashable{
    var id: Int
    var name: String
    var description: String
}
extension Repo{
   enum CodingKeys: String, CodingKey {
           case id
           case name
           case description
   }
}
