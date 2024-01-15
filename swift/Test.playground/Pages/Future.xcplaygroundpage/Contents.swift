

import Foundation
import Combine

let future = Future<Int, Never> { promise in
    promise(.success(1))
    promise(.success(2))
}

future.sink(
    receiveCompletion: { print("completion\($0)") },
            receiveValue: { print($0) }
)
            
