

import Foundation

//알림을 식벽하는 태그
var name:Notification.Name

//발송자가 옵저버에게 보내려고 하는 객체. 주로 발송자 객체를 전달하늗네 쓰임
var object: Any?

//Notification과 관련된 값 또는 객체의 저장소
var userInfo: [AnyHashable : Any]?


//노티 발송
//등록된 observer에게 노티 전송
//노티 쎈터는 노티를 발송하면 노티쎈터에서 메세지를 전달한 옵저버를 처리할때까지 대기
NotificationCenter.default.post(
    name: NSNotification.Name("TestNotification"), object: nil,
        userInfo: nil
)
//.post가 핵심,Name의 해당자(옵저버)들에게일을 수행하라고 시킴

//옵저버 등록
//addObserver: 관찰자를 대기시킨다
//selector: 관찰자가 수행해야할 업무를 의미

NotificationCenter.default
    .addObserver(
        self,
        selector: #selector(didRecieveTestNotification(_:)),
        name: NSNotification.Name("TestNotification"),
        object: nil
    )

@objc func didRecieveTestNotification(_ notification: Notification) {
         print("Test Notification")
 }
