

import Foundation
import Combine

//Fail(struct)
//Error를 즉시 보낼 수 있는 Publisher

enum PinguError: Error {
    case itIsNil
}

let fail = Fail<String, PinguError>(error: .itIsNil)

fail.sink(receiveCompletion: { print("receive completion: \($0)") },
          receiveValue: { print("receive value: \($0)") }
)

