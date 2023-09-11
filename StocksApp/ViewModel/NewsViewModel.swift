//
//  NewsViewModel.swift
//  StocksApp
//
//  Created by Snehal Firodia on 08/09/23.
//

import Foundation


struct NewsArticleViewModel {
    
    let article: Article
        
    var title: String {
        return self.article.title
    }
    
    var publication: String {
        return self.article.publication
    }
    
}
