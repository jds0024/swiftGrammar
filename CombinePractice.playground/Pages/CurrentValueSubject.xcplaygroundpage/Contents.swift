

import Foundation
import Combine

//CurrentValueSubject는 Subjcet를 채택하고있다
//단일 값을 래핑하고 값이 변경될때마다 새로운 값을 내보내는 Subject
//PassthroughSubject와 다르게 가장 최근에 publihsed된 값의 버퍼를 유지
//Send(:_)를 호출하면 현재 값도 업데이트 돼서 값을 직접 업데이트 하는거랑 동일한 효과

let currentValueSubject = CurrentValueSubject<String, Never>("Pingu 첫번째 값")
currentValueSubject
    .sink(receiveCompletion: { print("1 번째 sink completion: \($0)") },
          receiveValue: { print("1 번째 sink value: \($0)") })

currentValueSubject
    .sink(receiveCompletion: { print("2 번째 sink completion: \($0)") },
          receiveValue: { print("2 번째 sink value: \($0)") })
    

currentValueSubject
    .sink(receiveCompletion: { print("3 번째 sink completion: \($0)") },
          receiveValue: { print("3 번째 sink value: \($0)") })

// 현재 Subscriber들에게 모두 보냄
currentValueSubject.send("Pingu 두번째 값")
currentValueSubject.send(completion: .finished)

print(currentValueSubject.value)


//send가 subscriber에 도착하는 순서는 딱히 보장 x

//subscribe하는 모든 subscriber에게 send를 통해서 값을 보낸다는점,
//send메서드를 호출하면 CurrentValueSubject 의 value 프로퍼티도 업데이트 된다 -> 최신 값만 유지
