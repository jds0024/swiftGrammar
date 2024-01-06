
//열거형은 연관된 값들의 집합을 공통된 타입으로 정의 하는것
//열거형은 type-safe하게 코딩할 수 있는 방법이다
//주로 요일과 같이 한정된 경우의 수를 정의할 때 사용

//기본형
enum Name {
    case firstCase
    case secondCase
}

//RawValue
//열거형의 case는 모두 독릭접인 값이지만 내부에 또다른 값 저장 가능 이것이 rawValue

//Asscociated Values(연관값)
//열거형의 case에 rawValue를 저장하는 대신에 연관된 값을 저장가능-
//->rawValue한계 해결
//  rawValue의 한계
//  -모든케이스가 동일한 형식 사용
//  -케이스당 값을 하나밖에 저장못함
//  -원시값 문자열에 숫자가 포함되어 있을겨웅 숫자만 사용하려면 따로 추출해야하는 버거러움
enum action {
    case print(String)
    case sleep(Int)
}
var str = "text"
switch action {
case .print(str)
    print(str)
}
