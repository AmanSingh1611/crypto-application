//
//  HomeStatisticView.swift
//  crypto-application
//
//  Created by Aman on 14/11/25.
//

import SwiftUI

struct HomeStatisticView: View {
    @EnvironmentObject private var homeViewModel: HomeViewModel
    @Binding var showPortfolio: Bool

    var body: some View {
       HStack {
           ForEach(homeViewModel.statistics) { stat in
               StatisticView(stat: stat)
                   .frame(width: UIScreen.main.bounds.width / 3)
           }
       }
       .frame(width: UIScreen.main.bounds.width,
              alignment: showPortfolio ? .trailing : .leading
       )
    }
}

struct HomeStatisticView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatisticView(showPortfolio: .constant(false))
            .environmentObject(dev.homeViewModel)
    }
}
