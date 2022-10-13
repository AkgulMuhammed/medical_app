class FakeLoginApi {
  static String username = 'makgul';
  static String password = '12345';

  static fakelogin({required String username, required String password}) {
    if (username == 'makgul' && password == '12345') {
      return true;
    } else {
      return false;
    }
  }
}
