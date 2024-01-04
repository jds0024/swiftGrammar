import UIKit

// DispatchQueue

// DispatchQueue는 작업 항목의 실행을 관리하는 클래스
// 보통 서버에서 데이터를 받고 이미지,동영상을 위부에서 다운로드 및 처리할때 CPU사용량이 많아
// 처리를 Main Thread가 아닌 별도의 Thread에서 처리한뒤 MainTread로 결과만을 전달하여
// 화면에 표시하도록 하여 CPU를 관리 할 수 있습니다

//DisapatchQueue의 종류 : Seral / Concurrent

//Seral
//이전 작업이 끝나면 다음 작업을 순차적으로 실행하는 직렬 형태의 Queue,하나의 작업을 실행하고 그 실해잉 끝날때까지 대기열에 있는 다른 작업을 잠시 미루고 있다가 직전의 잡업이 끝나면 실행
//Concurrent
//이전 작업이 끝날때 까지 기다리지 않고 병렬 형태로 동시에 실행되는 Queue, 즉 대기열에 있는 작업을 동시의 별도의 Thread를 사용하여 실행


//Main(serial)
//MainTread에서 처리되는 형태이며 Xcode의 UIKIT및 SwiftUI의 모든 요소들은 MainQueue에서 수행되어야함
//Global(concurrent)
//시스템 전체에 공유되는 concurrentQueue.
//병렬적으로 동시에 실해잉 되긴하지만 Qos를 통해 우선순위를 결정해 줄 수 있다

//DispatchQueue.global(qos: .userInteractive).async{
//    for item in 1...10{
//        print("async(1) : \(item)")
//    }
//}
//DispatchQueue.global(qos: .background).async{
//    for item in 30...40{
//        print("async(2) : \(item)")
//    }
//}
//for item in 50...60{
//    print(item)
//}
let queue = DispatchQueue.global()


queue.async{
    print(Date())
    sleep(1)
    print("1초\(Date())")
}
queue.async{
    print(Date())
    sleep(2)
    print("2초\(Date())")
}
queue.async{
    print(Date())
    sleep(3)
    print("3초\(Date())")
}
//async : 다른 쓰레드로 작업을 넘긴후 기다리지 않고 다음 작업 실행
//sync : 다른 쓰레드로 작업을 넘긴후 끄나기를 기다린후 다음 작업 실행

//queue에 넣은후 GCD혹은 Operation은 serial(직렬) Concurrent(동시)로 처리 할지 고민한다
//serial(main)은 메인스레드가 아닌 다른스레드에 몰아주는것이데 작업순서가 중요한 작업일 경우 이렇게 처리한다. 작업들이 끝나는 순서 파악가능
//concurrent(global)는 큐에담긴 작업들을 여러개의 스레드로 분배 한다. 작업들이  끝나는 순서는 알 수 없다
//https://sujinnaljin.medium.com/ios-%EC%B0%A8%EA%B7%BC%EC%B0%A8%EA%B7%BC-%EC%8B%9C%EC%9E%91%ED%95%98%EB%8A%94-gcd-7-4d9dbe901835
