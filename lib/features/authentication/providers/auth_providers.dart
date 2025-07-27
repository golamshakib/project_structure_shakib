import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ps_shakib/features/authentication/data/models/user_model.dart';
import 'package:ps_shakib/features/authentication/data/services/auth_service.dart';

part 'auth_providers.g.dart';

/// Provider for AuthService - Singleton instance
@riverpod
AuthService authService(Ref ref) {
  return AuthService();
}

/// Provider to check if user is authenticated based on login state
@riverpod
bool isAuthenticated(Ref ref) {
  // This will be connected to your login controller's state
  // For now, we'll create a simple check
  return false; // You can update this based on your needs
}

/// Family provider for checking user permissions
@riverpod
bool hasPermission(
  Ref ref, {
  required UserModel? user,
  required String permission,
}) {
  if (user == null) return false;

  // Permission logic based on user role
  switch (permission) {
    case 'admin':
      return user.role == 'ADMIN';
    case 'user':
      return user.role == 'USER' || user.role == 'ADMIN';
    case 'moderator':
      return user.role == 'MODERATOR' || user.role == 'ADMIN';
    default:
      return false;
  }
}
