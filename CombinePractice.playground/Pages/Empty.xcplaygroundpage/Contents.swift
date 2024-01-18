import Foundation
import Combine

//아무런 값도 내보내지 않고 즉시 completion 이벤트를 보낼지 선택할 수 있는 Publihser
// init이 두개이다
// - init(completeImmediately: Bool = true)
//         completion이벤트를 바로 보낼지만 결정
// - init(completeImmediately: Bool = true, outputType: Output.Type, failureType: Failure.Type)
//          Empty를 Subscriber나 다른 Publihser에 연결할 때 사용
// - completeImmediately는 Empty가 즉시 completion 되어야 하는지 여부를 나타낸다

let empty = Empty<String,Never>()
empty
    .sink(receiveCompletion: { print("completion: \($0)")}
          , receiveValue: { print("value: \($0)")})



