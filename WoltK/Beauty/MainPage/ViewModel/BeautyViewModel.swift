//
//  BeautyViewModel.swift
//  WoltK
//
//  Created by Kairat on 7/29/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import Foundation

class BeautyViewModel {
    
    var headerInput: [HeaderModel] = [
        HeaderModel(imageName: "1"),
        HeaderModel(imageName: "2"),
        HeaderModel(imageName: "3")
    ]
    
    var numberOfheader: Int {
        return headerInput.count
    }
    
    let titleTypeSection: [TypeModel] = [.bestOnSeason, .new, .sale, .popular]
    
    let bestOnSeason: [GoodsModel] = [
        GoodsModel(image: "1", type: "bestOnSeason", name: "xzx", price: "12", ratingStatus: true, rating: "9.0", category: .bestOnSeason),
        GoodsModel(image: "2", type: "Cream", name: "sdd", price: "23", ratingStatus: true, rating: "7.0", category: .bestOnSeason),
        GoodsModel(image: "3", type: "Shampoo", name: "wwee", price: "22", ratingStatus: true, rating: "9.0", category: .bestOnSeason),
        GoodsModel(image: "4", type: "Shampoo", name: "s`", price: "33", ratingStatus: true, rating: "9.0", category: .bestOnSeason)
    ]
    let new: [GoodsModel] = [
        GoodsModel(image: "5", type: "new", name: "ff", price: "7", ratingStatus: true, rating: "8.0", category: .new),
        GoodsModel(image: "6", type: "Shampoo", name: "wwq", price: "90", ratingStatus: true, rating: "7.5", category: .new)
    ]
    let sale: [GoodsModel] = [
        GoodsModel(image: "7", type: "sale", name: "zxc", price: "78", ratingStatus: false, rating: "5.0", category: .sale),
        GoodsModel(image: "8", type: "Cream", name: "kkof", price: "12", ratingStatus: false, rating: "3.0", category: .sale),
        GoodsModel(image: "9", type: "Cream", name: "nvbc", price: "34", ratingStatus: true, rating: "9.0", category: .sale)
    ]
    let popular: [GoodsModel] = [
        GoodsModel(image: "1", type: "popular", name: "xzx", price: "12", ratingStatus: true, rating: "9.0", category: .popular),
        GoodsModel(image: "2", type: "Cream", name: "sdd", price: "23", ratingStatus: true, rating: "7.0", category: .popular),
        GoodsModel(image: "3", type: "Shampoo", name: "wwee", price: "22", ratingStatus: true, rating: "9.0", category: .popular),
        GoodsModel(image: "4", type: "Shampoo", name: "s`", price: "33", ratingStatus: true, rating: "9.0", category: .popular),
        GoodsModel(image: "5", type: "Shampoo", name: "ff", price: "7", ratingStatus: true, rating: "8.0", category: .popular),
        GoodsModel(image: "6", type: "Shampoo", name: "wwq", price: "90", ratingStatus: true, rating: "7.5", category: .popular),
        GoodsModel(image: "7", type: "Cream", name: "zxc", price: "78", ratingStatus: false, rating: "5.0", category: .popular),
        GoodsModel(image: "8", type: "Cream", name: "kkof", price: "12", ratingStatus: false, rating: "3.0", category: .popular),
        GoodsModel(image: "9", type: "Cream", name: "nvbc", price: "34", ratingStatus: true, rating: "9.0", category: .popular)
    ]
}


