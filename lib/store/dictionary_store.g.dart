// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DictionaryStore on DictionaryStoreBase, Store {
  Computed<dynamic>? _$postsComputed;

  @override
  dynamic get posts => (_$postsComputed ??= Computed<dynamic>(() => super.posts,
          name: 'DictionaryStoreBase.posts'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: 'DictionaryStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$dataAtom =
      Atom(name: 'DictionaryStoreBase.data', context: context);

  @override
  dynamic get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(dynamic value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('DictionaryStoreBase.getData', context: context);

  @override
  Future<bool> getData(String word) {
    return _$getDataAsyncAction.run(() => super.getData(word));
  }

  late final _$getMemberAsyncAction =
      AsyncAction('DictionaryStoreBase.getMember', context: context);

  @override
  Future<dynamic> getMember(String userId, String accessToken) {
    return _$getMemberAsyncAction
        .run(() => super.getMember(userId, accessToken));
  }

  late final _$DictionaryStoreBaseActionController =
      ActionController(name: 'DictionaryStoreBase', context: context);

  @override
  void setData(dynamic data) {
    final _$actionInfo = _$DictionaryStoreBaseActionController.startAction(
        name: 'DictionaryStoreBase.setData');
    try {
      return super.setData(data);
    } finally {
      _$DictionaryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$DictionaryStoreBaseActionController.startAction(
        name: 'DictionaryStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$DictionaryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
data: ${data},
posts: ${posts}
    ''';
  }
}
