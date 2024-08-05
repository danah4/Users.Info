import 'package:flutter/material.dart';
import '../../api/api.dart';
import '../../models/user.dart';

class UserProvider extends ChangeNotifier {
  List<User> users = [];
  bool isLoading = false;
  String? errorMessage;

  final Api _api = Api();

  Future<void> fetchUsers() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      users = await _api.getUsers();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
