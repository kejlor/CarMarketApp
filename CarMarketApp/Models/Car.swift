//
//  Car.swift
//  CarMarketApp
//
//  Created by Bartosz Wojtkowiak on 17/07/2022.
//

import Foundation

struct Car: Codable {
    var id: Int
    let carId: Int
    let mark: String
    let model: String
    let color: String
    let productionDate: Int
    let vin: String
    let priceInUsd: Double
    let priceInPln: Date
    let avaibility: Bool
    let createdAt: Date
    let updatedAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id, carId, mark, model, color, vin, avaibility
        case productionDate = "production_date"
        case priceInUsd = "price_in_usd"
        case priceInPln = "price_in_pln"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
