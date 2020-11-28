//
//  Achievement.swift
//  StashCoach
//
//  Created by Amit Biswas on 11/26/20.
//  Copyright © 2020 Amit Biswas. All rights reserved.
//

import Foundation

struct Achievement: Codable {
    
    var id: Int?
    var level: String?
    var progress: Int?
    var total: Int?
    var bgImage: String?
    var accessible: Bool?

}

//enum CodingKeys: String, CodingKey {
//    case bgImage = "bg_image_url"
//    
//}
