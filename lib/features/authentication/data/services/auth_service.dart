import 'dart:developer';

import 'package:ps_shakib/core/models/result.dart';
import 'package:ps_shakib/core/services/network_caller.dart';
import 'package:ps_shakib/features/authentication/data/models/user_model.dart';

class AuthService {
  final NetworkCaller _networkCaller = NetworkCaller();

  Future<Result<UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final body = {'email': email, 'password': password};

      final result = await _networkCaller.postRequest<UserModel>(
        'https://api.waize.space/api/v1/auth/login',
        body: body,
        fromJsonT: (json) => UserModel.fromJson(json),
      );
      log(result.data.toString());
      return result;
    } catch (e) {
      return Result.failure(
        message: 'Login failed: ${e.toString()}',
        statusCode: 500,
      );
    }
  }

  /// Register user
  Future<Result<UserModel>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final body = {'name': name, 'email': email, 'password': password};

      final result = await _networkCaller.postRequest<UserModel>(
        '/auth/register', // Your register endpoint
        body: body,
        fromJsonT: (json) => UserModel.fromJson(json),
      );

      return result;
    } catch (e) {
      return Result.failure(
        message: 'Registration failed: ${e.toString()}',
        statusCode: 500,
      );
    }
  }
}
