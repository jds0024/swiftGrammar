//
//  EnviromentValue.swift
//  Blog
//
//  Created by 정다산 on 1/8/24.
//

import SwiftUI
//SwiftUI에서는 뷰를 구성하는 데 필요한 각종 환경 설정과 관련된 정보를 EnvironmentValues타입이 관리합니다
//colorScheme, timeZone, locale, calendar, layoutDirection, sizeCategory, undoManager등 기존에는 UITraitCollection을 비롯해 다양한 클래스에서 나뉘어 사용하고 관리되던 속성들을 이제 EnvironmentValues 하나에 모두 담아서 쉽게 접근하고 관리할 수 있습니다.

//enviroment는 프레임워크에서 별도로 관리 -> 어떤 뷰에서든 접근 가능
//이때 얻게 되는 값은 상위 계층의 뷰가 가진 환경요소를 그대로 상속
//단 하위뷰가 별도로 다른 환경을 구성했다면 적용 x
//https://seons-dev.tistory.com/176
struct Theme {
    static func myBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        let lightColor = Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        
        let darckColor = Color.black
        
        switch scheme {
        case .light : return lightColor
        case .dark : return darckColor
        
        @unknown default: return lightColor
        }
    }
}

struct EnviromentValue: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            //1.배경설정
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                //2. 버튼생성
                Button(action: {
                    showingAlert.toggle()
                }, label: {
                    Text("다크모드")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                })
            }
        }
        .alert(isPresented: $showingAlert, content: {
            Alert(title: Text("열심히 공부합시다"),
            message: Text("나태해지지 말자"),
                  dismissButton: .default(Text("닫기"))
            )
        })

    }
}

#Preview {
    EnviromentValue()
}
