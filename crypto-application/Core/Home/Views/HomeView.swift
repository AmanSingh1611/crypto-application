//
//  HomeView.swift
//  crypto-application
//
//  Created by Aman on 12/11/25.
//

import SwiftUI

struct HomeView: View {
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            //Background Layer
            Color.theme.background
                .ignoresSafeArea()
            
            //Content Layer
            VStack{
                homeHeader
                
                Spacer(minLength: 0)
            }
            
        }
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
}
#Preview {
    NavigationView{
        HomeView()
            .navigationBarBackButtonHidden()
    }
}
