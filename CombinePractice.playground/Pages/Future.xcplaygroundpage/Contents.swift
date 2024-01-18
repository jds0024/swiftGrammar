
import Foundation
import Combine

//Future(Class)
//하나의 결과를 비동기로 생성한 뒤 completion event를 보냄
// - Promise는 Future가 값을 내보낼 때 호출되는 클로저
// - init에서 Promise 클로저를 매게 변수로 받는다
//즉 Future는 생성할 때 값을 내보낼때 호출할 클로저를 매개변수로 받아서 값을 한번 내보내면 해당 값을 계속 내보내는 Publisher

var subscriptions = Set<AnyCancellable>()
var emitValue: Int = 0
var delay: TimeInterval = 3

func createFuture() -> Future<Int, Never> {
    return Future<Int, Never> { promise in
        delay -= 1
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            emitValue += 1
            promise(.success(emitValue))
        }
    }
}

let firstFuture = createFuture()
let secondFuture = createFuture()
let thirdFuture = createFuture()

firstFuture
    .sink(receiveCompletion: { print("첫번째 Future Completion: \($0)") },
          receiveValue: { print("첫번째 Future value: \($0)") })
    .store(in: &subscriptions)

secondFuture
    .sink(receiveCompletion: { print("두번째 Future completion: \($0)") },
          receiveValue: { print("두번째 Future value: \($0)") })
    .store(in: &subscriptions)

thirdFuture
    .sink(receiveCompletion: { print("세번째 Future completion: \($0)") },
          receiveValue: { print("세번째 Future value: \($0)") })
    .store(in: &subscriptions)

thirdFuture
    .sink(receiveCompletion: { print("세번째 Future completion2: \($0)") },
          receiveValue: { print("세번째 Future value2: \($0)") })
    .store(in: &subscriptions)




