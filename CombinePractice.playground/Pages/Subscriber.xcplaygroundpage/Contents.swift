import Foundation
import Combine

/*
 @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
 public protocol Subscriber : CustomCombineIdentifierConvertible {
     associatedtype Input
     associatedtype Failure: Error
     
     func receive(subscription: Subscription)
     func receive(_ input: Self.Input) -> Subscribers.Demand
     func receive(completion: Subscribers.Completion<Self.Failure>
 }
 
 -input : publisher에게 받는 값 타입
 
 -Failure: Publihser에게 받는 Error타입

 -receive(subscription:) : Publihser가 만들어서 주는 subscription을 받는다
 
 -receive(input:) : Publihser가 주는 값을 받는다
                    Demand를 반환하는데 이는 값을 더 원하는지에 대한 여부
 -receive(completion:) : Publisher가 주는 completion event를 받느다
 
 */




