

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

//class CustomSubscrbier: Subscriber{
//    
//    ///모든 데이터를 받았을때만 호출
//    func receive(completion: Subscribers.Completion<Never>) {
//        print("모든 데이터의 발행이 완료되었습니다.")
//    }
//
//    func receive(subscription: Subscription) {
//        print("데이터의 구독을 시작합니다.")
//        //구독할 데이터의 개수를 제한하지않습니다.
//        subscription.request(.max(2))
//    }
//
//    func receive(_ input: String) -> Subscribers.Demand {
//        print("데이터를 받았습니다.", input)
//        return .unlimited
//    }
//    
//    typealias Input = String //성공타입
//    typealias Failure = Never //실패타입
//    
//}
//
//let formatter = NumberFormatter()
//formatter.numberStyle = .ordinal
//
//let publisher = (1...10).publisher.map{
//    formatter.string(from: NSNumber(integerLiteral: $0)) ?? ""
//}
//let sub = CustomSubscrbier()
//
//publisher.subscribe(sub)
//
//

//subject
//let subject = PassthroughSubject<String, Error>()
//
//subject.sink(receiveCompletion: { completion in
//  //에러가 발생한경우도 receiveCompletion 블록이 호출됩니다.
//  switch completion {
//  case .failure:
//    print("Error가 발생하였습니다.")
//  case .finished:
//    print("데이터의 발행이 끝났습니다.")
//  }
//}, receiveValue: { value in
//  print(value)
//})
//
////데이터를 외부에서 발행할 수 있습니다.
//subject.send("A")
//subject.send("B")
////데이터의 발행을 종료합니다.
//subject.send(completion: .finished)


//current
//let currentStatus = CurrentValueSubject<Bool, Error>(true)
//currentStatus.sink(receiveCompletion: { completion in
//  switch completion {
//  case .failure:
//    print("Error가 발생하였습니다.")
//  case .finished:
//    print("데이터의 발행이 끝났습니다.")
//  }
//}, receiveValue: { value in
//  print(value)
//})
//
////데이터를 외부에서 발행할 수 있습니다.
//print("초기값은 \(currentStatus.value)입니다.")
//currentStatus.send(false) //false 값을 주입합니다.
//
////value값을 변경해도 값이 발행됩니다.
//currentStatus.value = true

//구독취소
//let externalProvider = PassthroughSubject<String, Never>()
//let anyCancleable = externalProvider.sink{ steam in
//        print("전달받은데이터 \(steam)")
//}
//
//
//externalProvider.send("A")
//externalProvider.send("B")
//externalProvider.send("C")
//anyCancleable.cancel() //데이터 발행을 중단합니다.
//externalProvider.send("D")

//Combine으로 API통신
enum HTTPError: LocalizedError {
    case statusCode
    case post
}

struct Post: Codable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

//dataTaskPublsiher는 URLSession에서 제공하는 Publisher입니다.
let cancellable = URLSession.shared.dataTaskPublisher(for: url)
.map { $0.data }
.decode(type: [Post].self, decoder: JSONDecoder()) //전달받은 데이터를 JSON형식으로 Decode합니다.
.replaceError(with: []) //에러가 발생할경우 에러를 전달하지않습니다.
.eraseToAnyPublisher()
.sink(receiveValue: { posts in
    print("전달받은 데이터는 총 \(posts.count)개 입니다.")
})

//이후 cancellable.cancle()을 호출하여 스트림을 중단할 수 있습니다.


