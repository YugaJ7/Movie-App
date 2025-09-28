import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'exceptions/api_exception.dart';
import 'exceptions/network_exception.dart';

class NetworkClient {
  final String baseUrl;
  final Map<String, String> defaultHeaders;

  NetworkClient({
    required this.baseUrl,
    this.defaultHeaders = const {},
  });

  Future<dynamic> get(
    String endpoint, {
    Map<String, String>? headers,
    Duration timeout = const Duration(seconds: 10),
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    final mergedHeaders = {...defaultHeaders, ...?headers};

    try {
      final response = await http.get(uri, headers: mergedHeaders).timeout(timeout);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(response.body);
      } else {
        _handleError(response);
      }
    } on SocketException {
      throw NetworkException('No internet connection. Please check your network.');
    } on TimeoutException {
      throw NetworkException('Request timed out. Please try again.');
    } on FormatException {
      throw NetworkException('Invalid response format from server.');
    }
  }

  void _handleError(http.Response response) {
    try {
      final body = json.decode(response.body);
      final errorMessage = body['status_message'] ?? 'Unknown error';
      final errorCode = body['status_code'] ?? response.statusCode;

      throw ApiException(
        statusCode: errorCode,
        message: _mapErrorMessage(errorCode, errorMessage),
        details: errorMessage,
      );
    } catch (_) {
      throw ApiException(
        statusCode: response.statusCode,
        message: 'Failed with status code ${response.statusCode}',
      );
    }
  }

  String _mapErrorMessage(int code, String defaultMessage) {
    switch (code) {
      case 401:
        return 'Authentication failed. Please check your API key or token.';
      case 403:
        return 'You don\'t have permission to access this resource.';
      case 404:
        return 'The requested resource was not found.';
      case 422:
        return 'Invalid parameters. Please try again.';
      case 429:
        return 'Too many requests. Please wait and try again later.';
      case 500:
      case 502:
      case 503:
      case 504:
        return 'Server error. Please try again later.';
      default:
        return defaultMessage;
    }
  }
}
