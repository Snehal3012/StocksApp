//
//  NewsArticleView.swift
//  StocksApp
//
//  Created by Snehal Firodia on 08/09/23.
//

import Foundation
import SwiftUI

fileprivate enum Constants {
    static let radius: CGFloat = 16
    static let indicatorHeight: CGFloat = 6
    static let indicatorWidth: CGFloat = 60
    static let snapRatio: CGFloat = 0.25
    static let minHeightRatio: CGFloat = 0.3
}

struct NewsArticleView: View {
    
    let newsArticles: [NewsArticleViewModel]

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Top News")
                            .foregroundStyle(.black)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .gesture(DragGesture())
                        
                        Text("From News")
                            .foregroundStyle(.gray)
                            .font(.body)
                            .fontWeight(.bold)
                    }
                    Spacer()
                }
                .padding([.leading, .top], 20)
            }
            Spacer().frame(height: 20)
            
            List(self.newsArticles, id: \.title) { news in
                VStack(alignment: .leading) {
                    Text(news.publication)
                        .dynamicTypeSize(.large)
                        .foregroundColor(Color.black)
                    Text(news.title)
                        .foregroundColor(Color.black)
                        .dynamicTypeSize(.xxxLarge)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        
        let article = Article(title: "News Title", publication: "The WallStreet Journal")
        
        return NewsArticleView(newsArticles: [NewsArticleViewModel(article: article)])
    }
}
