//
//  CoinRowView.swift
//  CrytocurrencyApp
//
//  Created by Jordan Isac on 01/11/2023.
//

import SwiftUI

struct CoinRowView: View {
    let coin: Coin
    var body: some View {
        HStack {
            // market rank
            Text("\(coin.marketCapRank)")
                .font(.caption)
                .foregroundStyle(.gray)
            
           // Image
            RemoteImage(url: coin.image)
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundStyle(.orange)
                .clipShape(Circle())
                .frame(width: 32, height: 32)
                .background(Color(.systemGray5))
            
            //coin name info
            VStack(alignment: .leading, spacing: 4){
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            //coin price info
            VStack(alignment: .trailing, spacing: 4){
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(coin.priceChange24H.toPercentString())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                    .foregroundStyle(coin.priceChange24H > 0 ? .darkGreen: .lossColor)
                
                
           }
            .padding(.leading,2)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    CoinRowView(coin: coinList)
}

