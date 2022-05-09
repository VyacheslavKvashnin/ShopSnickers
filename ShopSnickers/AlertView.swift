//
//  AlertView.swift
//  ShopSnickers
//
//  Created by Вячеслав Квашнин on 07.01.2021.
//

import SwiftUI

struct AlertView: View {
    
    @State private var showAlert = false
    
    var body: some View {
        Button(action: {
            self.showAlert = true
        }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        }).alert(isPresented: $showAlert, content: {
            Alert(title: Text("New test"))
        })
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
