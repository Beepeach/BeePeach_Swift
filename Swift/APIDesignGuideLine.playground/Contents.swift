import UIKit

// 코드는 명확한 것이 간결한 것보다 중요하다!

// 타입으로 네이밍하지말고 역할로 네이밍하자


// MARK: - Func
// 함수를 네이밍을 할때 ArgumentLabel을 잘 활용하자. (전치사의 활용)
// 함수는 영어 문장처럼 읽히도록 네이밍하자.
// 기존 메서드와 같이 원본이 변경(side - effect 발생)이 되면 동사형, 원본이 변경되지않고 리턴해준다면 완료, 진행형, 명사로 네이밍하자.
// Bool을 리턴하는 메서드는 is~~로 작성하자.
// argumentLabel을 전치사로 쓰는경우도 있지만 같은 추상화라면 이름 마지막에 전치사를 붙이는게 좋다.


// MARK: - Init
// 생성자에서는 영어 문장처럼 네이밍하지말자.
// 메서드와 차별점을 주기위해서.
// 값이 유지되면서 타입만 변경된다면 첫 argumentLabel을 생략해야한다.
// 값의 범위가 줄어드는 경우라면 label을 생략하지않고 truncating과 같이 설명해주면 좋다.


// MARK: - Protocol
// 무언가를 가능하게 하는 프로토콜은 albe, ible, ing접미사를 사용하자.


// MARK: - Tuple
// Label을 달아주는게 좋다.


// MARK: - General Convention

// Computed Property의 Time Complexity가 O(1)이 아니라면 주석으로 남겨야한다.

// Type은 UpperCamelCase로 네이밍해야한다.
// 나머지는 lowerCamelCase로 해야한다.
// 약어의 경우 맨처음에 lowerCamel일때 모두 소문자로 중간에는 모두 대문자로 해준다.

// Default Parameter가 있다면 순서를 뒤로 빼야한다.
