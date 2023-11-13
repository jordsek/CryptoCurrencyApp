//
//  ChartView.swift
//  CrytocurrencyApp
//
//  Created by Jordan Isac on 09/11/2023.
//

import SwiftUI

struct ChartView: View {
    //MARK: -Properties
    
    let data: [Double]
    let maxY: Double
    let minY: Double
    let lineColor: Color
    let startingDate: Date
    let endingDate: Date
    @State private var percentage: CGFloat = 0
    
    init(coin: Coin){
        data = coin.sparklineIn7D.price
        maxY = data.max() ?? 0
        minY = data.min() ?? 0
        
        let priceChange = (data.last ?? 0) - (data.first ?? 0)
        lineColor = priceChange > 0 ? .darkGreen : .lossColor
        
        endingDate = Date(coindateString: coinList.lastUpdated ?? "")
        startingDate = endingDate.addingTimeInterval(-7*24*60*60)
    }
    
    var body: some View {
        VStack{
            chartView
                .frame(height: 200)
                .background(chartBackground)
                .overlay(chartAxis.padding(.horizontal, 4), alignment: .leading)
            
            chartDateLabels
                .padding(.horizontal, 4)
        }
        .font(.caption)
        .foregroundStyle(Color.secondary)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                withAnimation(.linear(duration: 2.0)){
                    percentage = 1.0
                }
            }
        }
    }
}

#Preview {
    ChartView(coin: coinList)
}


extension ChartView{
    private var chartView: some View {
        GeometryReader { geometry in
            Path { path in
                for index in data.indices{
                    let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
                    
                    let yAxis = maxY - minY
                    
                    let yPostion = (1 - CGFloat((data[index] - minY) / yAxis)) * geometry.size.height
                    
                    if index == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPostion))
                    }
                    path.addLine(to: CGPoint(x: xPosition, y: yPostion))
                }
            }
            .trimmedPath(from: 0, to: percentage)
            .stroke(lineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            .shadow(color: lineColor, radius: 10, x: 0.0, y: 10)
            .shadow(color: lineColor.opacity(0.5), radius: 10, x: 0.0, y: 20)
            .shadow(color: lineColor.opacity(0.2), radius: 10, x: 0.0, y: 30)
            .shadow(color: lineColor.opacity(0.1), radius: 10, x: 0.0, y: 40)
        }
    }
    
    private var chartBackground: some View{
        VStack{
            Divider()
            Spacer()
            Divider()
            Spacer()
            Divider()
        }
    }
    
    private var chartAxis: some View{
        VStack{
            Text(maxY.asNumberString())
            Spacer()
            Text(((maxY + minY) / 2).asNumberString())
            Spacer()
            Text(minY.asNumberString())
        }
    }
    
    private var chartDateLabels: some View{
        HStack{
            Text(startingDate.asShortDateString())
            Spacer()
            Text(endingDate.asShortDateString())
        }
    }
}