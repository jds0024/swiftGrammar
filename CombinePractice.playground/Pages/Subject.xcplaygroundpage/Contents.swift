

import Foundation
import Combine

//Subject는 Publisher를 채택한 프로토콜이다
//Subject는 stream에 send(_:) 메서드를 호출해서 값을 주입할 수 있는 Publisher이다
//기존에 Combine을 사용하지 않던 코드에 Combine 모델을 적용하고 싶을 때 유용


