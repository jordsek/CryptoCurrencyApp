//
//  CoinDetailView.swift
//  CrytocurrencyApp
//
//  Created by Jordan Isac on 07/11/2023.
//

import SwiftUI

struct CoinDetailView: View {
    //MARK: - Properties
   // @State var currentCoin: String = "BTC"
    //@Namespace var animation
    let coin : Coin
    var columns = [GridItem(.flexible()),GridItem(.flexible())]
    let spacing: CGFloat = 30
    var body: some View {
        ScrollView{
            VStack {
                SymbolHeaderView
                
                Spacer()
                ChartView(coin: coin)
                Spacer()
                
                OverviewDetails
                
                Divider()
                
                //OverviewDetailsGrid
                OverviewDetailsGrid
       
                //additional details
                AdditionalDetailView
                Divider()
                
                //AdditionalDetailGrid
                AdditionalDetailGridView
                
            }
        }
    }
}
        
   

#Preview {
    CoinDetailView(coin: coinList)
}


//CoinDetailView(viewModel: CryptoViewModel(repository: CrytoRepositoryImplementation(networkManager: NetworkManager())))

extension CoinDetailView {
   private var SymbolHeaderView: some View {
        HStack(spacing: 15) {
            RemoteImage(url: coin.image)
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 5){
                Text(coin.name)
                //.font(.callout)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text(coin.symbol)
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundStyle(.gray)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
    
    private var OverviewDetails: some View{
        Text("Overview")
            .font(.title)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
    }
    
    private var OverviewDetailsGrid: some View{
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            content: {
                VStack{
                    Text("current price")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text("\(coin.currentPrice.toCurrency())")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    HStack(spacing: 4) {
                        
                        Image(systemName: "triangle.fill")
                            .font(.caption2)
                            .rotationEffect(Angle(degrees: (coin.priceChange24H) >= 0 ? 0 : 180))
                        Text(coin.priceChange24H.toPercentString())
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                    }
                    .foregroundStyle(coin.priceChange24H > 0 ? .darkGreen: .lossColor)
                }
                .padding()
                VStack(alignment: .leading, spacing: 4){
                    Text("Market Capitalisation")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    Text("\(Double(coin.marketCap).asNumberString())" + "Bn")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    //.padding()
                    
                    HStack(spacing: 4){
                        Image(systemName: "triangle.fill")
                            .font(.caption2)
                            .rotationEffect(Angle(degrees: (coin.marketCapChange24H) >= 0 ? 0 : 180))
                        Text(coin.marketCapChange24H.toPercentString())
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(coin.marketCapChange24H > 0 ? .darkGreen: .lossColor)
                }
                .padding()
                
                    VStack(alignment: .leading){
                        Text("Rank")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text("\(coin.marketCapRank)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .padding()
                    
                    
                    VStack(alignment: .leading){
                        Text("Volume")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text("\(Double(coin.totalVolume).asNumberString())" + "Bn")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .padding()
        })
        
    }
    
    private var AdditionalDetailView: some View {
        Text("Additional Details")
            .font(.title2)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
    }
    
    private var AdditionalDetailGridView: some View{
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            content: {
                VStack(alignment: .leading){
                    Text("24h High")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text("\(coin.high24H.asNumberString())")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                .padding()
                
                VStack(alignment: .leading){
                    Text("24h Low")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text("\(coin.low24H.asNumberString())")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                .padding()
                
                VStack(alignment: .leading){
                    Text("24h Price Change")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text("$" + "\(coin.priceChange24H.asNumberString())")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                .padding()
                
                VStack(alignment: .trailing){
                    Text("24h Market Cap Change")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text("$" + "\(coin.marketCapChange24H.asNumberString())")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                .padding()
                
               
        })
    }
}
