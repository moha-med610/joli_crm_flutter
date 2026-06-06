import 'dart:convert';

import 'package:dio/dio.dart';

/// A Dio interceptor that logs the full details of every
/// request, response, and error.
/// Usage:
///   final dio = Dio();
///   dio.interceptors.add(LoggerInterceptor());
class LoggerInterceptor implements Interceptor {
  final bool logHeaders;
  final bool logBody;
  final bool prettyPrintJson;
  final Set<String> _sensitiveHeaders;
  final Set<String> _sensitiveBodyKeys;

  LoggerInterceptor({
    this.logHeaders = true,
    this.logBody = true,
    this.prettyPrintJson = true,
  }) : _sensitiveHeaders = {
         'authorization',
         'cookie',
         'set-cookie',
         'x-api-key',
         'x-auth-token',
         'proxy-authorization',
       },
       _sensitiveBodyKeys = {
         'password',
         'confirmPassword',
         'currentPassword',
         'newPassword',
         'token',
         'accessToken',
         'refreshToken',
         'secret',
         'apiKey',
         'creditCard',
         'cardNumber',
         'cvv',
         'ssn',
       };

  // ── REQUEST ──────────────────────────────────────────────────────────────────

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final buffer = StringBuffer();
    buffer.writeln(_divider('REQUEST'));
    buffer.writeln('➡️  [${options.method}] ${options.uri}');
    buffer.writeln('🕐 Timestamp : ${DateTime.now().toIso8601String()}');
    buffer.writeln('🌐 Base URL  : ${options.baseUrl}');
    buffer.writeln('📄 Path      : ${options.path}');

    if (options.queryParameters.isNotEmpty) {
      buffer.writeln('🔍 Query Params:');
      options.queryParameters.forEach((k, v) => buffer.writeln('   $k: $v'));
    }

    if (options.extra.isNotEmpty) {
      buffer.writeln('📦 Extra:');
      options.extra.forEach((k, v) => buffer.writeln('   $k: $v'));
    }

    if (logHeaders && options.headers.isNotEmpty) {
      buffer.writeln('📋 Headers:');
      _sanitizeHeaders(
        options.headers,
      ).forEach((k, v) => buffer.writeln('   $k: $v'));
    }

    if (logBody && options.data != null) {
      buffer.writeln('📨 Body:');
      buffer.writeln(_formatBody(options.data));
    }

    buffer.writeln(_divider());
    _log(buffer.toString());

    handler.next(options);
  }

  // ── RESPONSE ─────────────────────────────────────────────────────────────────

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final buffer = StringBuffer();
    buffer.writeln(_divider('RESPONSE'));
    buffer.writeln(
      '✅ [${response.requestOptions.method}] ${response.requestOptions.uri}',
    );
    buffer.writeln('🕐 Timestamp  : ${DateTime.now().toIso8601String()}');
    buffer.writeln(
      '📊 Status     : ${response.statusCode} ${response.statusMessage ?? ''}',
    );
    buffer.writeln('⏱️  Duration   : ${_duration(response.requestOptions)}');

    buffer.writeln('📩 Body:');
    if (response.data is Map || response.data is List) {
      buffer.writeln(const JsonEncoder.withIndent('  ').convert(response.data));
    } else {
      buffer.writeln(response.data.toString());
    }

    buffer.writeln(_divider());
    _log(buffer.toString());

    handler.next(response);
  }

  // ── ERROR ────────────────────────────────────────────────────────────────────

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final buffer = StringBuffer();
    buffer.writeln(_divider('ERROR'));
    buffer.writeln(
      '❌ [${err.requestOptions.method}] ${err.requestOptions.uri}',
    );
    buffer.writeln('🕐 Timestamp  : ${DateTime.now().toIso8601String()}');
    buffer.writeln('⏱️  Duration   : ${_duration(err.requestOptions)}');
    buffer.writeln('🔴 Type       : ${err.type}');
    buffer.writeln('💬 Message    : ${err.response?.data}');

    if (err.response != null) {
      buffer.writeln(
        '📊 Status     : ${err.response!.statusCode} ${err.response!.statusMessage ?? ''}',
      );

      if (logBody && err.response!.data != null) {
        buffer.writeln('📩 Response Body:');
        buffer.writeln(_formatBody(err.response?.data));
      }
    }

    if (err.error != null) {
      buffer.writeln('🪲 Underlying Error: ${err.error}');
    }

    if (logHeaders && err.requestOptions.headers.isNotEmpty) {
      buffer.writeln('📋 Request Headers:');
      _sanitizeHeaders(
        err.requestOptions.headers,
      ).forEach((k, v) => buffer.writeln('   $k: $v'));
    }

    if (logBody && err.requestOptions.data != null) {
      buffer.writeln('📨 Request Body:');
      buffer.writeln(_formatBody(err.requestOptions.data));
    }

    buffer.writeln(_divider());
    _logError(buffer.toString());

    handler.next(err);
  }

  // ── Helpers ──────────────────────────────────────────────────────────────────

  String _divider([String? label]) {
    const line = '─────────────────────────────────────────────';
    return label == null ? line : '─── $label ${'─' * (40 - label.length)}';
  }

  void _log(String msg) {
    // Replace with your preferred logger (e.g. `logger` package, `print`, etc.)
    // ignore: avoid_print
    print(msg);
  }

  void _logError(String msg) {
    // ignore: avoid_print
    print(msg);
  }

  /// Attempt to calculate the request duration using the [extra] map.
  /// Pair with a request interceptor that stamps [_startTime] if needed.
  String _duration(RequestOptions options) {
    final start = options.extra['_startTime'];
    if (start is DateTime) {
      final ms = DateTime.now().difference(start).inMilliseconds;
      return '${ms}ms';
    }
    return 'N/A';
  }

  /// Redact sensitive header values.
  Map<String, dynamic> _sanitizeHeaders(Map<String, dynamic> headers) {
    return {
      for (final entry in headers.entries)
        entry.key: _sensitiveHeaders.contains(entry.key.toLowerCase())
            ? '[REDACTED]'
            : entry.value,
    };
  }

  /// Recursively redact sensitive fields in the body.
  dynamic _sanitizeBody(dynamic body) {
    if (body is Map) {
      return {
        for (final entry in body.entries)
          entry.key: _sensitiveBodyKeys.contains(entry.key)
              ? '[REDACTED]'
              : _sanitizeBody(entry.value),
      };
    }
    if (body is List) return body.map(_sanitizeBody).toList();
    return body;
  }

  /// Format the body as indented JSON when possible, otherwise toString.
  String _formatBody(dynamic body) {
    try {
      final sanitized = _sanitizeBody(body is String ? jsonDecode(body) : body);
      return prettyPrintJson
          ? const JsonEncoder.withIndent('  ').convert(sanitized)
          : jsonEncode(sanitized);
    } catch (_) {
      return body.toString();
    }
  }
}
