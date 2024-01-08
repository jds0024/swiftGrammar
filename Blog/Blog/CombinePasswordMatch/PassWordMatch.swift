//
//  PassWordMatch.swift
//  Blog
//
//  Created by 정다산 on 1/8/24.
//

import SwiftUI
import Combine

class MyViewModel:ObservableObject{
    @Published var password: String = ""
    @Published var passwordCheck: String = ""
    
}


struct PassWordMatch: View {
   @StateObject var myViewModel = MyViewModel()
    var body: some View {
        VStack{
            
            TextField("", text: $myViewModel.password)
                .foregroundColor(.black)
                .textFieldStyle(CommonTextFieldStyle())
                .padding(.horizontal)
            TextField("", text: $myViewModel.passwordCheck)
                .textFieldStyle(CommonTextFieldStyle())
                .padding(.horizontal)
        }
            
    }
    
}
struct CommonTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack{
            Rectangle()
                .foregroundStyle(Color.gray)
                .cornerRadius(10)
                .frame(height: 46)
            
            configuration
                .font(.title)
                .padding()
                
        }
        
    }
}

#Preview {
    PassWordMatch()
}
