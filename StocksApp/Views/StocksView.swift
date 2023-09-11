//
//  StocksView.swift
//  StocksApp
//
//  Created by Snehal Firodia on 08/09/23.
//

import Foundation
import SwiftUI

struct StockListView: View {
    
    let stocks: [StockViewModel]
    
    var body: some View {
        List(self.stocks, id: \.symbol) { stock in
            StockCell(stock: stock)
        }
        .listStyle(PlainListStyle())
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let stock = Stock(symbol: "GOOG", description: "Google Stocks", price: 1200, change: "+0.23")
        return StockListView(stocks: [StockViewModel(stock: stock)])
    }
}

struct StockCell: View {
    
    let stock: StockViewModel
    
    var body: some View {
        return HStack {
            VStack(alignment: .leading) {
                Text(stock.symbol)
                    .dynamicTypeSize(.xxxLarge)
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                Text(stock.description)
                    .dynamicTypeSize(.xxxLarge)
                    .foregroundColor(Color.gray)
            }
            Spacer()
            VStack {
                Text("\(stock.price)")
                    .foregroundColor(Color.gray)
                    .dynamicTypeSize(.xxLarge)
                Text(stock.change)
                .frame(width: 75)
                .padding(5)
                .background(Double(stock.change) ?? 0 > 0 ? Color.green : Color.red)
                .foregroundColor(Color.white)
                .cornerRadius(6)
            }
        }
    }
}
