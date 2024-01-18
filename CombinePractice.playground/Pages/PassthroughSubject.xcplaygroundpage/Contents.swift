

import Foundation
import Combine

//PassthroughSubject:Downstream Subscriber에게 값을 전파하는 Subject
//초기 값이 필요하지 않다,최신값을 저장하기 위한 공간도 필요 x -> 이름처럼 값을 스쳐 보낸다
//-> subscriber가 없거나 Demand가 0 이라면 값을 보내더라도 아무 일도 발생 x
let passthroughSubject = PassthroughSubject<String, Never>()

let firstSubscription = passthroughSubject
    .sink(receiveCompletion: { print("1번째 sink completion: \($0)") },
          receiveValue: { print("1번째 sink value: \($0)")}
    )

passthroughSubject.send("PassthroughSubject 1번째 값")

let secondSubscription = passthroughSubject
    .sink(receiveCompletion: { print("2번째 sink completion: \($0)") },
          receiveValue: { print("2번째 sink value: \($0)")}
    )

passthroughSubject.send("PassthroughSubject 2번째 값")


//secondSubscription은 만들어지기전에 send한 첫번째 값을 받지 못한다
//CurrentValueSubject와 의 차이점은 값을 저장하지 못한다는것 하나다
