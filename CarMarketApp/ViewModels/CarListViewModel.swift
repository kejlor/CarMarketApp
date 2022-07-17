//
//  CarListViewModel.swift
//  CarMarketApp
//
//  Created by Bartosz Wojtkowiak on 17/07/2022.
//

import Foundation

class CarListViewModel: ObservableObject {
    @Published var cars: [CarViewModel] = []
    @Published var filteredCars: [CarViewModel] = []
    
    func getCars() {
        guard let url = URL(string: "https://tinuon.net/api/cars") else { return }
        
        Webservice.shared.downloadData(of: [Car].self, from: url) { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let cars):
                DispatchQueue.main.async {
                    self.cars = cars.map(CarViewModel.init)
                    self.filterCars()
                }
            }
        }
    }
    
    func filterCars() {
        filteredCars = []
        
        cars.forEach { car in
            if car.availability {
                filteredCars.append(car)
            }
        }
    }
}
