import 'package:flutter/material.dart';

/// Exception class for handling platform-related errors
class MPlatformException implements Exception{
  final String code;

  MPlatformException(this.code);

  String get message {
    switch (code) {
     case 'INVALID_lOGIN_CREDENTIALS':
       return 'Invalid login credentials. Please double-check your information';
     case 'Too-many-requests':
       return 'Too many requests. Please try again later';
     case 'invalid-argument':
       return 'Invalid argument provided to authentication method';
     case 'invalid-password':
       return 'Incorrect password. Please try again.';
     case 'invalid-phone-number':
       return 'The provided phone number is invalid';
     case 'operation-not-allowed':
       return 'The sign-in provider is disabled for your Firebase project.';
     case 'session-cookie-expired':
       return 'The Firebase session cookie has expired. Please sign in again';
     case 'uid-already-exists':
       return 'The provided user ID is already in use by another user';
     case 'Sign_in_failed':
       return 'Sign in failed. Please try again.';
     case 'network-request-failed':
       return 'Network request failed. Please check your internet connection and try again';
     case 'internal-error':
       return 'internal error. Please try again later.';
     case 'invalid-verification-code':
       return 'invalid verification code. Please enter a valid code.';
     case 'invalid-verification-id':
       return 'invalid verification id. Please request a new verification code.';
     default:
       return 'An unexpected platform error occurred. Please try again.';
    }
  }
}