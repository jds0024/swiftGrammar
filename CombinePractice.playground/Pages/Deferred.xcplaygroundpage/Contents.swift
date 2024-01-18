import Foundation
import Combine

//Deferred(struct)는 새로운 Subcriber를 만들기 위해 제공된 클로저를 싱행하기 전에 Subscription을 기다리는 Publisher
// createPublisher는 Publisher가 subscribe 됐을 때 실행할 클로저
// init에서 받은 클로저는 subscribe(_:)가 호출될때 실행

struct PinguPublisher: Publisher {
    typealias Output = String
    typealias Failure = Never
    
    func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, String == S.Input {
        subscriber.receive("안녕 나는 pinguPublisher")
        subscriber.receive(completion: .finished)
    }
}

print("deferred publisher가 만들어짐")
let deferred = Deferred { () -> PinguPublisher in
    print("pinguPublisher가 만들어짐\n")
    return PinguPublisher()
}

deferred
    .sink(receiveCompletion: { print($0) },
          receiveValue: { print($0) })
//Deferred가 만들어졌을때 PinguPublihser는 만들어지지 않았고 , 이후에 sink를 통해 subscribe했을때 Deferred를 생성할 때 구현한 클로저에서 만들어진다
//lazy와 비슷하게 Publisher가 실제로 사용될때 Publihser를 생성 -> 메모리 효율 증가
