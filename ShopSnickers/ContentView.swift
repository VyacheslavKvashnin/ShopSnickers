//
//  ContentView.swift
//  ShopSnickers
//
//  Created by Вячеслав Квашнин on 07.01.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSelection = 0
    @State private var offsetX = 0
    
    var arrSnicker = ["Nike", "Puma", "Reebok"]
    var arrImageSnicker = ["nike", "puma", "reebok"]
    var arrPrice = ["1000", "2000", "3000"]
    
    var body: some View {
        VStack {
            
            Text("\(arrSnicker[showSelection])")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding()
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    
                    .fill(Color.white)
                    .padding()
                    .shadow(radius: 20)
                    .offset(x: CGFloat(offsetX))
                VStack {
                    Image("\(arrImageSnicker[showSelection])")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .offset(x: CGFloat(offsetX))
                    
                    Text("\(arrPrice[showSelection]) руб.")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .offset(x: CGFloat(offsetX))
                }
            }
            .animation(.spring())
            
            Spacer()
            
            Picker(selection: Binding(get: {
                self.showSelection
            }, set: { newValue in
                self.showSelection = newValue
                self.offsetX = -500
                self.moveBack()
            }), label: Text("")) {
                ForEach(0..<arrSnicker.count) {
                    Text(self.arrSnicker[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer().frame(height: 150)
            
        }
    }
    
    private func moveBack() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.offsetX = 0
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
