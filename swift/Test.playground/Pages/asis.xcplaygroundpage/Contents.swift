

import Foundation

//타입 캐스팅은 인스턴스의 타입을 확인 혹은 해당인스턴스를 슈퍼틀래스나 하위 클래스로 취급하는 방법이다
//Swift에서 타입 캐스팅은 is나 as 연산자로 구현

//is (표현식 is Type)
//타입을 체크하는 연산자, 런타임 시점에 실체 체크가 이루어진다
//표현식이 Type과 동일하거나 표현식이 Type의 서브 클래스인 경우 true
//이 외 경우엔 false
//-> is 연산자는 타입을 체크 하는 연산자로 반환값은 bool
//ex)
let char: Character = "A"

char is Character
char is String

let bool: Bool = true

bool is Bool
bool is Character

//서브 클래스인경우
class Human { }
class Teacher: Human { }

let teacher: Teacher = .init()
teacher is Teacher
teacher is Human

//응용
class Human {
    let name: String
    init(name: String) {
        self.name = name
    }
}
class Teacher: Human { }
class Student: Human { }
 
 
let people: [Human] = [//업캐스팅 덕분에 Human타입 배열에 담을 수 있음
    Teacher.init(name: "김선생"),
    Student.init(name: "박제자"),
    Student.init(name: "유제자")
]

for human in people {
    if human is Teacher {
        print("나는야 선생님 : \(human.name)")
    } else if human is Student {
        print("나는야 제자  : \(human.name)")
    }
}

//as
//표현식 as (변활 할)Type
//표현식 as? (변활 할)Type
//표현식 as! (변활 할)Type
//표현식의 타입이 변활할 Type과 호환한다면, 변환할 Type으로 캐스팅된 인스턴스를 리턴한다
//상속 관계인 업캐스팅과 다운캐스팅에서 사용된다
//Any와 AnyObject타입을 사용할 경우, 상속관계가 아니어도 예외적으로 사용가능

//업캐스팅
//서브 클래스 인스터를 "슈퍼크래스 타입"으로 참조한다
//업캐스팅은 항상 성공하낟
//as 연산자를 사용해서 할 수도 있다

//https://babbab2.tistory.com/127
