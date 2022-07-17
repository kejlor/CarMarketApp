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
        List {
            ForEach(carListVM.cars, id: \.id) { car in
                VStack {
                    Text(car.model)
                    Text(car.mark)
                }
            }
        }
        .onAppear {
            carListVM.getCars()
        }
    }
}

struct CarListView_Previews: PreviewProvider {
    static var previews: some View {
        CarListView()
    }
}
