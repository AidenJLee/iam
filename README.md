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

# MVVM + FlowController with Storyboard Pattern

각 부분의 역할 정의

이 부분은 이 프로젝트가 추구하는 방향이다.

일반적으로 통용 되는 부분도 있고 개인적인 생각으로 제한하는 부분도 있다.

하지만 언제나 생각(Think)이 먼저다. 방법론 아키텍쳐를 왜 사용하는지 부터 고민하자. 



### 기본적으로 다음의 룰을 따른다

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

ViewModel이 Model을 투영하기 때문에 여기에서 비지니스에 관련 된 데이터 처리를 해서는 안된다.

## ViewModel

### ViewModel이 기본적으로 가져가야 하는 일은 무엇이 있을까?

ViewModel은 View에서 명령을 Input으로 받고, View에 전달할 notification를 output으로 내보낸다.

내부적으로 View에서 표시해야 할 값들을 다 알고 있어야 한다.

비지니스 로직을 가지고 있어야 한다.

### ViewModel이 하지 말아야 할 것이 무엇이 있을까?

ViewModel은 UI에 관한것을 가지고 있으면 안된다.

ViewModel은 다음 네비게이션에 대해서도 알지 못해야 한다. 

이를 구조적으로 막기 위해서 UIKit을 import 하지 않는다. 

하지만 언제나 예외적인 상황은 발생 할 수 있다. 

예를 들면 편의성이나 비지니스적인 요청에 의해서 ViewModel에서 image를 반환해야 하는 경우가 생긴다면

제한 적으로 import UIKit.UIImage를 사용하기를 추천한다.

이는 다른 특수한 상황에서 의도치 않게 UIKit을 사용하는것을 막아준다. 

추가적으로 ViewModel을 구현 시 lifecycle을 항상 명심하시기 바란다.

ViewModel에서 RxSwift의 Dispose를 처리 하지 않는것을 추천한다.

## ViewController

### ViewController가 기본적으로 가져가야 하는 일은 무엇이 있을까?

ViewController는 항상 BindableType(Protocol)을 준수하여 Observable 프로퍼티를 가지고 UI를 바인딩 해야 한다.

UI적인 요소와 View에 대한 초기 설정은 ViewController가 해야할 기본적인 일이다. 

여기에서 초기 설정이라 하면 UI적인 설정 부분과 Observable을 선언하고 이를 통해 ViewModel과 UI를 Binding하는 행위가 포함된다. 

이 핵심적인 부분을 벗어난 것은 extension을 활용하여 하는것이 좋다. 

extension에는 저장가능한 속성이 없으므로 class func을 통해 기.본.적.인 부분만 확장하도록 한다.

AssociatedObject를 가지고 구현하는 케이스가 있는데 추천하지 않는다.

(extension이 저장 가능한 속성을 가지고 있어야 할 이유가 있다면 자료구조로 구현하자. )

### ViewController가 하지 말아야 할 것이 무엇이 있을까?

1. 네트워크를 직접 호출하는 행위 - 이런 행위는 View와 관련된게 아니고 비지니스적인 로직이나 데이터에 관련 된 부분이기 때문에 ViewModel쪽으로 넘겨야 한다.
2. 데이터 처리 - ViewModel을 View의 하위 클래스처럼 쓰는 말아라. VC에서 바인딩을 제외하고 ViewModel의 데이터에 직접 변경 할 일은 없다. (바인딩을 위한 접근은 언제나 가능하다)
3. Helper 구현 - UI에 관한 핼퍼나 데이터 변경 처리 등등.. 다양한 기능을 VC에서 하는 경우가 있는데 이 또한 따로 라이브러리를 만들어 쓰거나 UI에 한정하여 (저장 속성을 사용하지 않는..Property등.. ) extension으로 구현하는것을 추천한다


## Bugs / Feature Requests

Think you’ve found a bug?

Please open a case in issue page.


