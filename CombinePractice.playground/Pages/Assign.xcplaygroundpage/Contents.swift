import Foundation
import Combine

/*
 Assign(class):KeyPath로 표시된 프로퍼티에 수신된 값을 할당하는 Subscriber
 
 final public class Assign<Root, Input> : Subscriber, Cancellable, CustomStringConvertible,
 CustomReflectable, CustomPlaygroundDisplayConvertible {
     public typealias Failure = Never
     final public var object: Root? { get }
     final public let keyPath: ReferenceWritableKeyPath<Root, Input>
     
     public init(object: Root, keyPath: ReferenceWritableKeyPath<Root, Input>)

     final public func receive(subscription: Subscription)
     final public func receive(_ value: Input) -> Subscribers.Demand
     final public func receive(completion: Subscribers.Completion<Never>)
     
     final public func cancel()
 }

 - object : 
 */
