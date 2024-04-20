import "package:testproject/model/user.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:testproject/service/user_service.dart";

part 'user_provider.g.dart';

@riverpod
Future<List<User>> user(UserRef ref) async {
  List<User> jsonList = await ApiClient().getUser();
  return jsonList;
}