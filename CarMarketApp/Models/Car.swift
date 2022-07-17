//
//  Car.swift
//  CarMarketApp
//
//  Created by Bartosz Wojtkowiak on 17/07/2022.
//

import Foundation

struct Car: Codable {
    let id: Int
    let carId: Int
    let mark: String
    let model: String
    let color: String
    let productionDate: Int
    let vin: String
    let priceInUsd: Double
    let priceInPln: Double
    let availability: Int
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, mark, model, color, vin
        case carId = "car_id"
        case availability
        case productionDate = "production_date"
        case priceInUsd = "price_in_usd"
        case priceInPln = "price_in_pln"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
