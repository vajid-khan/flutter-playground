import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'dictionary_store.g.dart';

class DictionaryStore = DictionaryStoreBase with _$DictionaryStore;

abstract class DictionaryStoreBase with Store {
  @observable
  bool isLoading = false;


  @observable
  dynamic data = {};

  @computed
  dynamic get posts => data;


  @action
  void setData(dynamic wordData) {
    data = wordData;
  }

	@action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  Future<bool> getData(String word) async {
    try {
      setLoading(true);

print(word);
      final response = await http.get(
        Uri.parse(
          'https://api.dictionaryapi.dev/api/v2/entries/en/$word',
        ),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
       setData(jsonDecode(response.body)[0]);
			//  print(jsonDecode(response.body)[0]['word'].toString());
        return true;
      } else {
        // Handle error response
        final error = jsonDecode(response.body);
        throw Exception(error['message'] ?? 'Server Error');
      }
    } catch (e) {
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
          'https://qa-bbreleased01.hz1.developbb.dev/wp-json/wp/v2/users/$userId',
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
