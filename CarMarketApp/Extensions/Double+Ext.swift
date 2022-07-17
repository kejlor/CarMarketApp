//
//  Double+Ext.swift
//  CarMarketApp
//
//  Created by Bartosz Wojtkowiak on 17/07/2022.
//

import Foundation

extension Double {
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
}
