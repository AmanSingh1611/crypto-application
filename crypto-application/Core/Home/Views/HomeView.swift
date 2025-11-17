//
//  HomeView.swift
//  crypto-application
//
//  Created by Aman on 12/11/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var homeViewModel: HomeViewModel
    @State private var showPortfolio: Bool = false
    @State private var showPortfolioView: Bool = false // new sheet
    @State private var showSettingsView: Bool = false // new sheet
    @State private var selectedCoin: CoinModel? = nil
    @State private var showDetailView: Bool = false
    
    var body: some View {
        ZStack {
            //Background Layer
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView, content: {
                    PortfolioView()
                        .environmentObject(homeViewModel)
                })
            
            //Content Layer
            VStack{
                homeHeader
                
                HomeStatisticView(showPortfolio: $showPortfolio)
                SearchBarView(searchText: $homeViewModel.searchText)
                
                columnTitles
                
                if !showPortfolio{
                    allCoinsList
                        .transition(.move(edge: .leading))
                    
                }else{
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0)
                
            }
            .sheet(isPresented: $showSettingsView, content: {
                SettingsView()
            })
            
        }
        .simultaneousGesture(
            DragGesture(minimumDistance: 15)
                .onEnded { value in
                    if abs(value.translation.height) > abs(value.translation.width) { return }
                    withAnimation(.spring()) {
                        if value.translation.width < -80 {
                            showPortfolio = true
                        } else if value.translation.width > 80 {
                            showPortfolio = false
                        }
                    }
                }
        )
        .background(
            NavigationLink(
                destination: DetailLoadingView(coin: $selectedCoin),
                isActive: $showDetailView,
                label: { EmptyView() })
        )
    }
}
extension HomeView{
    private var homeHeader:some View{
        HStack{
            ZStack {
                
                CircleButtonAnimationView(animate: $showPortfolio)
                    .frame(width: 60, height: 60)
                CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                    .animation(.none, value: showPortfolio)
                    .onTapGesture {
                        if showPortfolio {
                            showPortfolioView.toggle()
                        } else {
                            showSettingsView.toggle()
                        }
                    }
            }
                
            Spacer()
            
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.bold)
                .animation(.none)
            
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View{
        List{
            ForEach(homeViewModel.allCoins){ coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .onTapGesture {
                        segue(coin: coin)
                    }
                    .listRowBackground(Color.theme.background)
            }
            .listRowBackground(Color.clear)
        }
        .listStyle(PlainListStyle())
    }
    
    private var portfolioCoinsList: some View{
        List{
            ForEach(homeViewModel.portfolioCoins){ coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .onTapGesture {
                        segue(coin: coin)
                    }
                    .listRowBackground(Color.theme.background)
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private func segue(coin: CoinModel) {
        selectedCoin = coin
        showDetailView.toggle()
    }
    
    private var columnTitles: some View {
            HStack {
                HStack(spacing: 4) {
                    Text("Coin")
                    Image(systemName: "chevron.down")
                        .opacity((homeViewModel.sortOption == .rank || homeViewModel.sortOption == .rankReversed) ? 1.0 : 0.0)
                        .rotationEffect(Angle(degrees: homeViewModel.sortOption == .rank ? 0 : 180))
                }
                .onTapGesture {
                    withAnimation(.default) {
                        homeViewModel.sortOption = homeViewModel.sortOption == .rank ? .rankReversed : .rank
                    }
                }
                
                Spacer()
                if showPortfolio {
                    HStack(spacing: 4) {
                        Text("Holdings")
                        Image(systemName: "chevron.down")
                            .opacity((homeViewModel.sortOption == .holdings || homeViewModel.sortOption == .holdingsReversed) ? 1.0 : 0.0)
                            .rotationEffect(Angle(degrees: homeViewModel.sortOption == .holdings ? 0 : 180))
                    }
                    .onTapGesture {
                        withAnimation(.default) {
                            homeViewModel.sortOption = homeViewModel.sortOption == .holdings ? .holdingsReversed : .holdings
                        }
                    }
                }
                HStack(spacing: 4) {
                    Text("Price")
                    Image(systemName: "chevron.down")
                        .opacity((homeViewModel.sortOption == .price || homeViewModel.sortOption == .priceReversed) ? 1.0 : 0.0)
                        .rotationEffect(Angle(degrees: homeViewModel.sortOption == .price ? 0 : 180))
                }
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
                .onTapGesture {
                    withAnimation(.default) {
                        homeViewModel.sortOption = homeViewModel.sortOption == .price ? .priceReversed : .price
                    }
                }
                
                Button(action: {
                    withAnimation(.linear(duration: 2.0)) {
                        homeViewModel.reloadData()
                    }
                }, label: {
                    Image(systemName: "goforward")
                })
                .rotationEffect(Angle(degrees: homeViewModel.isLoading ? 360 : 0), anchor: .center)
            }
            .font(.caption)
            .foregroundColor(Color.theme.secondaryText)
            .padding(.horizontal)
        }
}
#Preview {
    NavigationView{
        HomeView()
            .navigationBarBackButtonHidden()
    }
    .environmentObject(DeveloperPreview.instance.homeViewModel)
}
