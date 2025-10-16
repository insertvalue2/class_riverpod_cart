// class User extends Equatable {
//   final int id;
//   final String name;
//   final String email;
//
//   User(this.id, this.name, this.email);
//
//   @override
//   List<Object> get props => [id, name, email];
//
// // User 클래스를 논리적 동등성으로 비교할 수 있도록 코드를
//   // 재정의 해주세요
//   // @override
//   // bool operator ==(Object other) {
//   //   // 1.객체의 주소값이 같은지 먼저 비교
//   //   if (identical(this, other)) return true;
//   //
//   //   // 논리적인 개념 정의 (개발자 직접 정의)
//   //   return other is User &&
//   //       other.id == id &&
//   //       other.name == name &&
//   //       other.email == email;
//   // }
//   //
//   // // 단짝!
//   // @override
//   // int get hashCode => Object.hash(id, name, email);
// }
//
// void main() {
//   User user1 = User(1, "길수", "a@nate.com");
//   User newUser1 = User(1, "길수", "n@nate.com");
//
//   User user2 = User(1, "길수", "a@nate.com");
//   User user3 = User(1, "길수2", "a@nate.com");
//
//   print(user1 == user2);
//   print(user1 == user3);
// }
