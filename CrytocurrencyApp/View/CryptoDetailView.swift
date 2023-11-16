//
//  CryptoDetailView.swift
//  CrytocurrencyApp
//
//  Created by Jordan Isac on 16/11/2023.
//

import SwiftUI

struct CryptoDetailView: View {
    //MARK: - Properties
    //@State var currentCoin: String = "BTC"
    @Namespace var animation
    @StateObject var appModel: CryptoViewModel = CryptoViewModel(repository: CrytoRepositoryImplementation(networkManager: NetworkManager()))
   // let coins: [Coin]
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Circle()
                    .fill(.red)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading, spacing: 5){
                    Text("Bitcoin")
                        .font(.callout)
                    Text("BTC")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
          //  CustomControl
            Spacer()
//            LineGraph(datas: samplePlot)
//                .frame(height: 220)
//                .padding()
////            ChartView()
//            Spacer()
            Controls()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    func GraphView()-> some View{
        GeometryReader{_ in
        }
        .padding(.vertical, 30)
        .padding(.bottom, 20)
    }
        
    
    //MARK: - Custom Segmented Control
//    @ViewBuilder
//    func CustomControl(coins: Coin)-> some View{
//        //SAMPLE Data
//       // let coins = ["BTC", "ETH", "BNB"]
//       
//       
//        }
//        .padding(.vertical)
//    }
    
    
    
    
    //MARK: - Controls
    @ViewBuilder
    func Controls()-> some View{
        HStack(spacing: 20){
            Button {
                
            }label: {
                Text("Sell")
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background{
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(.white)
                    }
            }
            
            Button {
                
            }label: {
                Text("Buy")
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background{
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(.cyan)
                    }
            }
        }
    }
}



#Preview {
    CryptoDetailView()
}

extension CryptoDetailView{
    private var CustomControl: some View{
         ScrollView(.horizontal, showsIndicators: false){
             HStack(spacing: 15){
                 
                 
             }
        }
        .background{
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .stroke(Color.white.opacity(0.2), lineWidth: 1)
        }
        .padding(.vertical)
        
    }
}


//HStack(spacing: 15){
//    ForEach(coins){ coin in
//        Text(coin)
//            .foregroundColor(currentCoin == coin ? .white : .gray)
//            .padding(.vertical, 6)
//            .padding(.horizontal, 10)
//            .contentShape(Rectangle())
//            .background{
//                if currentCoin == coin{
//                    Rectangle()
//                        .fill(Color.gray)
//                        .matchedGeometryEffect(id: "SEGMENTEDTAB", in: animation)
//                }
//            }
//            .onTapGesture {
//                withAnimation(){currentCoin = coin}
//            }
//    }
//}
