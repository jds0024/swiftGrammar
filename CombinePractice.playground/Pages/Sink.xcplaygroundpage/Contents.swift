

import Foundation
import Combine

/*
 Sink(class)
 횟수 제한 없이 Subscription을 통해 값을 요청하는 간단한 Subscriber
 
 final public class Sink<Input, Failure> : Subscriber, Cancellable, CustomStringConvertible,
                                             CustomReflectable, CustomPlaygroundDisplayConvertible
 where Failure : Error {
     final public var receiveValue: (Input) -> Void { get }
     final public var receiveCompletion: (Subscribers.Completion<Failure>) -> Void { get }
     
     final public var description: String { get }
     final public var customMirror: Mirror { get }
     final public var playgroundDescription: Any { get }
     
     public init(receiveCompletion: @escaping ((Subscribers.Completion<Failure>) -> Void),
                 receiveValue: @escaping ((Input) -> Void))
     
     final public func cancel()
     
     // Subscriber 프로토콜의 필수요소들
     final public func receive(subscription: Subscription)
     final public func receive(_ value: Input) -> Subscribers.Demand
     final public func receive(completion: Subscribers.Completion<Failure>)
 }
 
 - receiveValue : 값을 받았을때 실행될 클로저
 
 - receiveCompletion : Completion을 받았을 때 실행될 클로저
 
 - cancel : subscription을 취소 ,Cancellable프로토콜을 채택하기 때문에 구현
 */

let intArrayPublisher = [1,2,3,4,5].publisher
        
let sink = Subscribers.Sink<Int, Never>(receiveCompletion: { print("completion: \($0)") },
                                        receiveValue: { print("value: \($0)")})

intArrayPublisher.subscribe(sink)

//위 방식 보단 Publihser의 extention에 구현된 sink Operator를 사용하낟
let intArrayPublisher = [1,2,3,4,5].publisher

intArrayPublisher
    .sink(receiveCompletion: { print("completion: \($0)") },
          receiveValue: { print("value: \($0)")})




