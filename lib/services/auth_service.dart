import '../models/user.dart';
import '../utils/mock_data.dart';

class AuthService {
  static User? _currentUser;

  static User? get currentUser => _currentUser;

  static bool login(String email, String password) {
    final user = MockData.users.firstWhere(
      (u) => u.email == email && u.password == password,
      orElse: () => User(
        id: '',
        name: '',
        email: '',
        password: '',
        type: UserType.student,
        memberSince: DateTime.now(),
      ),
    );

    if (user.id.isNotEmpty) {
      _currentUser = user;
      return true;
    }
    return false;
  }

  static void logout() {
    _currentUser = null;
  }

  static bool register(String name, String email, String password) {
    final newUser = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      password: password,
      type: UserType.student,
      memberSince: DateTime.now(),
    );

    MockData.users.add(newUser);
    _currentUser = newUser;
    return true;
  }
}
