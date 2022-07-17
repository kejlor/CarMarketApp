//
//  CarListView.swift
//  CarMarketApp
//
//  Created by Bartosz Wojtkowiak on 17/07/2022.
//

import SwiftUI

struct CarListView: View {
    @StateObject private var carListVM = CarListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                    ForEach(carListVM.filteredCars, id: \.id) { car in
                        VStack {
                            CarCell(car: car)
                        }
                    }
            }
            .listStyle(PlainListStyle())
            .onAppear {
                carListVM.getCars()
            }
            .navigationTitle("Car Market App")
        }
    }
}

struct CarListView_Previews: PreviewProvider {
    static var previews: some View {
        CarListView()
    }
}

struct CarCell: View {
    let car: CarViewModel
    
    var body: some View {
        VStack {
            Text("\(car.mark) \(car.model)")
                .font(.title3)
            Group {
                Text("Price USD: \(car.priceInUsd.asNumberString()) $")
                Text("Price PLN: \(car.priceInPln.asNumberString()) zł")
            }
            .font(.caption)
        }
    }
}
