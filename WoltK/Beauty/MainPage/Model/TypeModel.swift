//
//  TypeModel.swift
//  WoltK
//
//  Created by Kairat on 7/29/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import Foundation

enum TypeModel {
    case bestOnSeason
    case sale
    case new
    case popular
    
    var title: String {
        switch self {
        case .bestOnSeason:
            return "Best products"
        case .new:
            return "New things"
        case .sale:
            return "On sale"
        case .popular:
            return "Popular"
        }
    }
}
