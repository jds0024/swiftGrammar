

import Foundation
import Combine

//UpStream Publihser의 값들을 전달하는 Publihser 이다
//어떤 publihser에서도 ErasePublihser()를 호출하면 AnyPublihser로 래핑된다

let originalPublisher = [1, nil, 3].publisher

let anyPublisher = originalPublisher.eraseToAnyPublisher()
anyPublisher.sink { value in
    print(value)
}

//AnyPublihser는 OPerator를 사용하면서 여려 Publisher 타입이 생성되는 것을 간단하게 처리하기 위해 사용

