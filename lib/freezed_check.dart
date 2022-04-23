import 'package:practice/user.dart';

void func() {
  User user1 = const User('kazutxt', 30);
  User user2 = const User('kazutxt2', 30);
  User user3 = const User('kazutxt', 30);

  print("check1");
  print(user1);

  print("check2");
  if (user1 == user2) print('user1とuser2は同じ人');
  if (user1 == user1) print('user1とuser3は同じ人');

  print('check3');
  User user4 = user1.copyWith(name: 'Unknown');
  print(user1);
  print(user4);

  print('check4');
  user2 = user3;
  print(user2);
}
