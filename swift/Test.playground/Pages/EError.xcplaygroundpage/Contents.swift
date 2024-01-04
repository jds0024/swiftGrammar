import UIKit
//17

enum MismatchError: Error {
    case nameMismatch
    case numberMismatch
}

//에러를 던지는 메소드
func guessMyName(name input: String) throws {
    print("guessMyName() called")
    
    if input != "쩡대리" {
        print("틀렸다")
        throw MismatchError.nameMismatch
        //return
    }
    print("맞췄다")
}

//try? guessMyName(name: "이대리")
//try? 는 에러를 잡지 않겠다 에러 날라올시 nil

//try! 는 무조건 에러가 없을거다

//에러를 처리하고 싶다면 do catch 블럭 사용
do {
    try guessMyName(name: "이대리")
} catch{
    print("잡은 에러 \(error)")
}


func guessMyNumber(number input: Int) throws -> Bool {
    print("guessMyName() called")
    
    if input != 10 {
        print("틀렸다")
        throw MismatchError.numberMismatch
        //return
    }
    print("맞췄다")
    return true
}
do {
    let receivedVlaue = try guessMyNumber(number: 9)
}catch{
    print("잡은 에러 \(error)")
}
