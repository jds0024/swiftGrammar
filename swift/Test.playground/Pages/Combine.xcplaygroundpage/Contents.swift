

import Foundation
import Combine

//Just(5).sink{
//    print($0)
//}

//let provider = (1...10).publisher
//
//provider.sink { _ in
//    print("데이터 전달이 끝낱습니다.")
//} receiveValue: { data in
//    print(data)
//}

class CustomSubscrbier: Subscriber{
    
    ///모든 데이터를 받았을때만 호출
    func receive(completion: Subscribers.Completion<Never>) {
        print("모든 데이터의 발행이 완료되었습니다.")
    }

    func receive(subscription: Subscription) {
        print("데이터의 구독을 시작합니다.")
        //구독할 데이터의 개수를 제한하지않습니다.
        subscription.request(.max(2))
    }

    func receive(_ input: String) -> Subscribers.Demand {
        print("데이터를 받았습니다.", input)
        return .unlimited
    }
    
    typealias Input = String //성공타입
    typealias Failure = Never //실패타입
    
}

let publisher = ["A","B","C","D","E","F","G"].publisher

let subscriber = CustomSubscrbier()

publisher.subscribe(subscriber)
//https://medium.com/harrythegreat/swift-combine-%EC%9E%85%EB%AC%B8%EA%B0%80%EC%9D%B4%EB%93%9C2-publisher-subscribe-operator-723ed5d17e70

