import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'user_store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isLoggedIn = false;

  @observable
  dynamic _auth = {};

  @computed
  dynamic get auth => _auth;

  @action
  void setAuth(dynamic authData) {
    _auth = authData;
  }

  @observable
  dynamic _user = {};

  @computed
  dynamic get user => _user;

  @action
  void setUser(dynamic userData) {
    _user = userData;
  }

  @action
  void setLoggedIn(bool value) {
    isLoggedIn = value;
  }

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

	@action
  void logout() {
    setAuth({});
    setUser({});
    setLoggedIn(false);
    setLoading(false);
  }

  @action
  Future<bool> login(String username, String password) async {
    try {
      setLoading(true);

      final response = await http.post(
        Uri.parse(
          'https://qa-bbapp-qa03.hz1.developbb.dev/wp-json/buddyboss-app/auth/v2/jwt/login',
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'app_id': '3c560e',
        }),
      );

      if (response.statusCode == 200) {
        final auth = jsonDecode(response.body);
				final member = await getMember(auth['user_id'], auth['access_token']);
				setAuth(auth);
        setUser(member);
        setLoggedIn(true);
        setLoading(false);
        return true;
      } else {
        // Handle error response
        final error = jsonDecode(response.body);
        throw Exception(error['message'] ?? 'Login failed');
      }
    } catch (e) {
      setLoggedIn(false);
      rethrow;
    } finally {
      setLoading(false);
    }
  }

	@action
  Future<dynamic> getMember(String userId, String accessToken) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://qa-bbapp-qa03.hz1.developbb.dev/wp-json/wp/v2/users/$userId',
        ),
        headers: {
          'Content-Type': 'application/json',
          'accesstoken': accessToken,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        // Handle error response
        final error = jsonDecode(response.body);
        throw Exception(error['message'] ?? 'Failed to fetch user data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
