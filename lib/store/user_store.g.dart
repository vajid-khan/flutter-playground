// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on UserStoreBase, Store {
  Computed<dynamic>? _$authComputed;

  @override
  dynamic get auth => (_$authComputed ??=
          Computed<dynamic>(() => super.auth, name: 'UserStoreBase.auth'))
      .value;
  Computed<dynamic>? _$userComputed;

  @override
  dynamic get user => (_$userComputed ??=
          Computed<dynamic>(() => super.user, name: 'UserStoreBase.user'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: 'UserStoreBase.isLoading', context: context);

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

  late final _$isLoggedInAtom =
      Atom(name: 'UserStoreBase.isLoggedIn', context: context);

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$_authAtom = Atom(name: 'UserStoreBase._auth', context: context);

  @override
  dynamic get _auth {
    _$_authAtom.reportRead();
    return super._auth;
  }

  @override
  set _auth(dynamic value) {
    _$_authAtom.reportWrite(value, super._auth, () {
      super._auth = value;
    });
  }

  late final _$_userAtom = Atom(name: 'UserStoreBase._user', context: context);

  @override
  dynamic get _user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  set _user(dynamic value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('UserStoreBase.login', context: context);

  @override
  Future<bool> login(String username, String password) {
    return _$loginAsyncAction.run(() => super.login(username, password));
  }

  late final _$getMemberAsyncAction =
      AsyncAction('UserStoreBase.getMember', context: context);

  @override
  Future<dynamic> getMember(String userId, String accessToken) {
    return _$getMemberAsyncAction
        .run(() => super.getMember(userId, accessToken));
  }

  late final _$UserStoreBaseActionController =
      ActionController(name: 'UserStoreBase', context: context);

  @override
  void setAuth(dynamic authData) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.setAuth');
    try {
      return super.setAuth(authData);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(dynamic userData) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.setUser');
    try {
      return super.setUser(userData);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoggedIn(bool value) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.setLoggedIn');
    try {
      return super.setLoggedIn(value);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logout() {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.logout');
    try {
      return super.logout();
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLoggedIn: ${isLoggedIn},
auth: ${auth},
user: ${user}
    ''';
  }
}
