//
//  StocksNewsViewModel.swift
//  StocksApp
//
//  Created by Snehal Firodia on 08/09/23.
//

import Foundation
import SwiftUI

class StocksNewsViewModel: ObservableObject {
        
    static let shared = StocksNewsViewModel()
        
    func loadStocks() -> [StockViewModel] {
        if let path = Bundle.main.path(forResource: "Stocks", ofType: "json") {
            do {
                let url = URL(filePath: path)
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Stock].self, from: data)
                return jsonData.map(StockViewModel.init)
            } catch {
                print("error:\(error)")
            }
        }
        return [StockViewModel]()
    }

    func loadArticles() -> [NewsArticleViewModel] {
        if let path = Bundle.main.path(forResource: "Articles", ofType: "json") {
            do {
                let url = URL(filePath: path)
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Article].self, from: data)
                return jsonData.map(NewsArticleViewModel.init)
            } catch {
                print("error:\(error)")
            }
        }
        return [NewsArticleViewModel]()
    }
}
