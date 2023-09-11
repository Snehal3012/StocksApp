//
//  ContentView.swift
//  StocksApp
//
//  Created by Snehal Firodia on 08/09/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @ObservedObject private var stockListVM = StocksNewsViewModel.shared
    @State private var isPresented = true
    @State private var selectionDetent = PresentationDetent.height(150)

    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Text(Date.formatDateForTitle())
                            .font(.body)
                            .frame(alignment: .leading)
                            .padding([.leading], 16)
                        Spacer()
                    }
                    StockListView(stocks: self.stockListVM.loadStocks())
                }
            }
            .navigationTitle("Stocks")
            .toolbar{
                Button {
                    
                } label: {
                    VStack {
                        Text("Add Stocks")
                    }
                }

            }
        }
        .sheet(isPresented: $isPresented) {
            NewsArticleView(newsArticles: StocksNewsViewModel.shared.loadArticles())
                .presentationDragIndicator(.visible)
                .presentationDetents([.height(150), .medium, .large], selection: $selectionDetent)
                .presentationBackgroundInteraction(.enabled)
                .interactiveDismissDisabled()
                .safeAreaInset(edge: .bottom) {}
        }
        .gesture(
            DragGesture().onChanged({ _ in
                self.selectionDetent = .height(150)
            }))
                
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
