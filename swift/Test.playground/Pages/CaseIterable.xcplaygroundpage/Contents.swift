

import Foundation

//CaseIterable 프로토콜은 배열 요소를 순회 하듯이 열거형에서 값을 순회할 수 있도록 해주는 프로토콜이다

enum Beverage: CaseIterable{
    case coffe
    case tea
    case juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) bevarages available.")

for bevarage in Beverage.allCases{
    print(bevarage)
}

