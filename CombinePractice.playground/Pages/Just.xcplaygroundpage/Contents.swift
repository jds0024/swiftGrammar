

import Foundation
import Combine
//Just(Struct)
//가장 단순한 형태의 Publisher, 에러 타입은 항상 Never
//자신을 subscribe하는 Subscriber들에게 한번에 값을 내보낸뒤 finish 이벤트를 보내는 publisher
let just = Just("This is Ouptput")
just
    .sink { completion in
        print("received completion: \(completion)")
    } receiveValue: { value in
        print("received value: \(value)")
    }
//Failure type이 never로 설정되어 있어 따로 지정을 안해줘된다
//Never란? 정상적으로 리턴하지 않는 함수의 리턴 타입, 값이 없는 타입"
//Combine에서는 Publisher가 오류를 생성하지 않는 경우 Never타입으로 설정
//이로 봤을때 just는 항상 성공

