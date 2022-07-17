//
//  CarViewModel.swift
//  CarMarketApp
//
//  Created by Bartosz Wojtkowiak on 17/07/2022.
//

import Foundation

struct CarViewModel {
    let car: Car
    
    var id: Int {
        car.id
    }
    
    var carId: Int {
        car.carId
    }
    
    var mark: String {
        car.mark
    }
    
    var model: String {
        car.model
    }
    
    var color: String {
        car.color
    }
    
    var productionDate: Int {
        car.productionDate
    }
    
    var vin: String {
        car.vin
    }
    
    var priceInUsd: Double {
        car.priceInUsd
    }
    
    var priceInPln: Double {
        car.priceInPln
    }
    
    var createdAt: Date {
        car.createdAt
    }
    
    var updatedAt: Date {
        car.updatedAt
    }
}
