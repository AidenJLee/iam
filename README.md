# 타인을 평가 하려고만 하지 마세요. 왜 당신의 기준으로 평가를 하나요?
# 토론 아닌 비판은 사양합니다. 남을 배려 하며 삽시다.. 제발
# 아래 내용은 보존만 합니다. 업데이트 하지 않습니다.
# 그럼 안녕히...
==============================================================

# iam

자기 자신에게 하는 질문 - 나를 찾아 가는 여행을 위한 셀프 인터뷰

DripLife의 기능중 Prologue를 담당하는 부분만 떼어내서 하나의 앱으로 제작 중

**Please change a Branch**: Master -> Dev 

# 개발자들을 위한 추가 설명

MVVM+Coordinator구조에서 Coordinator를 FlowController로 대체 함

Model부분을 보려면 Project - Targer - Domain부분을 살펴보면 되며

Networdk부분은 Project - Targer - Network부분을 통해 분리 해 놓음



FlowController부분이 궁금하다면

iam/Common/Protocols 폴더와 iam/Common/Scene/Instructions 폴더 참고



# Requirements

- Swift 4.0 (KetPath부분 변경점으로 인해 4.0으로 제작 + 지금 엑스코드 설정이 4.0....)
- Carthage

Package manager

Carthage 사용 설치방법은 링크 참고 (Homebrew 이용시 'brew install carthage'로 설치 가능)

Homebrew: You can use Homebrew and install the carthage tool on your system simply by running brew update and brew install carthage. (note: if you previously installed the binary version of Carthage, you should delete /Library/Frameworks/CarthageKit.framework).'



Carthage 설치 후 터미널에서 아래 명령어 실행 (iOS용만 빌드)

    $ carthage update --platform iOS

이후 프로젝트를 열면 실행 가능

- Swift 4.0.0 -> 4.0.2로 변경 됨에 따라서 Carthage에 빌드 된 파일을 인식할 수 없는 오류가 났을경우에는

    $ carthage update --platform iOS --no-use-binaries

명령어로 재빌드 후 클린 - 실행하면 해결 됨

# Architecture

 Clean Architecture에 대한 유명한 다이어그램에서는 주로 네가지 섹션을 제시 하였다.

- 도메인 로직
- 비즈니스 규칙
- 인터페이스 어댑터
- 프레임워크/드라이버/UI



[Uncle Bob의 The Clean Architecture를 참고](https://8thlight.com/blog/uncle-bob/2012/08/13/the-clean-architecture.html)



하지만 좋은 아키텍쳐란 개발 맥락에 따라 달라지므로 참고만 하였고 내 환경을 기준으로 재구성하였다.

그 기준은 소규모 환경, 분산 개발, 특정 라이브러리에대한 높은 의존성(RxSwift)을 활용하기 좋은 구조였다.

그 결과물은 아래 그림과 같다.

![JPG](https://github.com/AidenJLee/iam/blob/master/Document/Architecture.jpeg)





도메인 로직: 엔티티와 데이터 모델에 대해 선언

데이터 로직(Worker): UseCase기반으로 데이터를 Local 및 Network에서 처리

어플리케이션 로직:  비즈니스 로직, 인터페이서 어댑터, UI부분으로 나누어서 처리 (MVVM + Router방식)





구조는 변경 되었으나 기본적으로 Clean Architecture의 상위레이어로만 연결 되는 종속성은 동일하다. 

예를 들면 도메인은 데이터나 어플리케이션 로직을 알 수 없어야 하며 데이터는 도메인에 대해서는 알고 있으나 어플리케이션에 대해서는 알 수 없어야한다.



 이 방식이 복잡도를 높인것 처럼 보일 수 있으나 실제 개발 프로세스를 진행해 보면 서로 관심사가 분리되어 진행되기 때문에 개발자 간에 의존성이 줄어서 개발 편리성이 향상 된다. A개발자는 어플리케이션 로직에서 개발을 하며 X화면에서 필요한 정보를 UseCase형식으로 요청하면 B개발자는 데이터 로직에서 UseCaseProvider를 통해 임시로 Dummy데이터를 반환해 준 뒤에 데이터 처리 작업을 진행하면 된다. 서로간에 의존도가 없으며 Target을 통해 분리하였기 때문에 개발 영역이 겹칠 일이 없다.



## Application logic: MVVM + Router

이 부분에서는 비즈니스 로직, 인터페이서 어댑터, UI로 관심사를 나누어서 처리하는 아키텍쳐라면 MVP, MVVM, VIPER....etc..어떤방식으로 처리해도 상관이 없다. 여기에서 MVVM을 선택한 이유는 기존의 MVC방식에서 형식적으로 크게 거부감이 없으며 파일 분리 및 생성작업도 많지 않기 때문에 선택하였다. 선택은 항상 팀과 동료 개발자의 실력에 따라 선택하는것을 추천한다.



### 각 부분의 역할 정의

이 부분은 이 프로젝트가 추구하는 방향이다.

일반적으로 통용 되는 부분도 있고 개인적인 생각으로 제한하는 부분도 있다.

하지만 언제나 생각(Think)이 먼저다. 방법론 아키텍쳐를 왜 사용하는지 부터 고민하자. 



### MVVM은 기본적으로 다음의 룰을 따른다

- 모델은 데이터 변경에 대한 알림을 내보낼 수 있지만 다른 클래스와 직접 대화하지 않습니다.
- ViewModel은 모델과 대화하고 데이터를 ViewController에만 드러냅니다.
- ViewController는 View의 라이프 사이클을 관리하고 UI와 데이터를 Binding합니다.
- View는 오로직 ViewController에게만 이벤트를 발생 합니다.





## Model

### Model이 기본적으로 가져가야 하는 일은 무엇이 있을까?

데이터 구조를 선언 하는것

ViewModel에는 Notification을 통해 변경사항을 전달한다.

이 프로젝트에서는 모델정의를 위해 Domain이라는 타겟을 생성하여 관리 하고 있다.

### Model이 하지 말아야 할 것이 무엇이 있을까?

ViewModel이 Model을 투영하기 때문에 여기에서 비지니스 및 데이터 처리를 해서는 안된다.



## ViewModel

### ViewModel이 기본적으로 가져가야 하는 일은 무엇이 있을까?

ViewModel은 View에서 이벤트를 Input으로 받고아서 비즈니스 로직을 통과해 이벤트를 핸들링 한 후에 그 결과를 output형태를 통해 View에 전달한다. 또한 내부적으로 View에서 표시해야 할 값들을 다 알고 있어야 한다.

### ViewModel이 하지 말아야 할 것이 무엇이 있을까?

ViewModel은 UI에 관한것을 가지고 있으면 안된다.

ViewModel은 다음 네비게이션에 대해서도 알지 못해야 한다. 

이를 구조적으로 막기 위해서 UIKit을 import 하지 않는다. 

하지만 언제나 예외적인 상황은 발생 할 수 있다. 

예를 들면 편의성이나 비지니스적인 요청에 의해서 ViewModel에서 image를 반환해야 하는 경우가 생긴다면

제한 적으로 import UIKit.UIImage를 사용하기를 추천한다.

이는 다른 특수한 상황에서 의도치 않게 UIKit을 사용하는것을 막아준다. 

추가적으로 ViewModel을 구현 시 lifecycle을 항상 명심하시기 바란다.

이 프로젝트에서는 ViewModel에서 RxSwift의 Dispose를 처리 하지 않도록 하였다.



## ViewController

### ViewController가 기본적으로 가져가야 하는 일은 무엇이 있을까?

ViewController는 항상 BindableType(Protocol)을 준수하여 Observable 프로퍼티를 가지고 UI를 바인딩 해야 한다.

UI적인 요소와 View에 대한 초기 설정은 ViewController가 해야할 기본적인 일이다. 여기에서 초기 설정이라 하면 UI적인 설정 부분과 Observable을 선언하고 이를 통해 ViewModel과 UI를 Binding하는 행위가 포함된다.  이 핵심적인 부분을 벗어난 것은 extension을 활용하여 하는것이 좋다. extension에는 저장가능한 속성이 없으므로 class func을 통해 기.본.적.인 부분만 확장하도록 한다. AssociatedObject를 가지고 구현하는 케이스가 있는데 추천하지 않는다.

(extension이 저장 가능한 속성을 가지고 있어야 할 이유가 있다면 자료구조로 구현하자. )

### ViewController가 하지 말아야 할 것이 무엇이 있을까?

1. 네트워크를 직접 호출하는 행위 - 이런 행위는 View와 관련된게 아니고 비지니스적인 로직이나 데이터에 관련 된 부분이기 때문에 ViewModel쪽으로 넘겨야 한다.
2. 데이터 처리 - ViewModel을 View의 하위 클래스처럼 쓰는 말아라. VC에서 바인딩을 제외하고 ViewModel의 데이터에 직접 변경 할 일은 없다.
3. Helper 구현 - UI에 관한 핼퍼나 데이터 변경 처리 등등.. 다양한 기능을 VC에서 하는 경우가 있는데 이 또한 따로 라이브러리를 만들어 쓰거나 UI에 한정하여 (저장 속성을 사용하지 않는..Property등.. ) extension으로 구현하는것을 추천한다


### Router

이 부분은 계속 변경중이다. 

ViewController와 ViewModel을 가지고 있으며 DI를 하는 기능이 메인이다. 

여기에서 고빈은 Coordinator형식으로 네비게이터의 Sequence를 모두 관리 하는 형식으로 진행할지

UIViewController를 상속받아서 네이게이터는 프레임워크를 사용하면서 내부에 Container형식으로 UI를 관리할지 고민이다.

Less code, Less bug도 있고 향후 관리의 필요성이 줄어드는 방식은 후자의 방식이지만 관점의 분리 영역이나 아키텍처로 보면 전자의 방식이 더 좋은 방식이다. (Coordinator는 VIPER의 Route에 DI를 더한 방식이라고 생각하면 된다)

두가지 모두 구현중이므로 결정 후 문서를 업데이트 하겠다.



## Bugs / Feature Requests

Think you’ve found a bug?

Please open a case in issue page.


