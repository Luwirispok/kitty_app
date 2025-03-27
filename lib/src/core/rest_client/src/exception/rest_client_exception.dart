import 'package:meta/meta.dart';

/// Base class for all [RestClient] exceptions

@immutable
sealed class RestClientException implements Exception {
  const RestClientException({
    required this.message,
    this.statusCode,
    this.cause,
  });

  /// Message of the exception
  final String message;

  /// The status code of the response (if any)
  final int? statusCode;

  /// The cause of the exception
  ///
  /// It is the exception that caused this exception to be thrown.
  ///
  /// If the exception is not caused by another exception, this field is `null`.
  final Object? cause;
}

/// [ClientException] is thrown if something went wrong on client side

final class ClientException extends RestClientException {
  const ClientException({
    required super.message,
    super.statusCode,
    super.cause,
  });

  @override
  String toString() =>
      'ClientException('
      'message: $message, '
      'statusCode: $statusCode, '
      'cause: $cause'
      ')';
}

/// Exception that is used for structured backend errors
///
/// [error] is a map that contains the error details
///
/// This exception is raised by [RestClientBase] when the response contains
/// 'error' field like the following:
/// ```json
/// {
///  "error": {
///   "message": "Some error message",
///   "code": 123
/// }
/// ```
///
/// This class exists to make handling of structured errors easier.
/// Basically, in data providers that use [RestClientBase], you can catch
/// this exception and convert it to a system-wide error.
///
/// For example, if backend returns an error with code "not_allowed" that means that the action
/// is not allowed and you can convert this exception to a NotAllowedException
/// and rethrow. This way, the rest of the application does not need to know
/// about the structure of the error and should only handle system-wide
/// exceptions.

final class StructuredBackendException extends RestClientException {
  const StructuredBackendException({required this.error, super.statusCode})
    : super(message: 'Backend returned structured error');

  /// The error returned by the backend
  final Map<String, Object?> error;

  @override
  String toString() =>
      'StructuredBackendException('
      'message: $message, '
      'error: $error, '
      'statusCode: $statusCode, '
      ')';
}

/// [WrongResponseTypeException] is thrown if the response type
/// is not the expected one

final class WrongResponseTypeException extends RestClientException {
  const WrongResponseTypeException({required super.message, super.statusCode});

  @override
  String toString() =>
      'WrongResponseTypeException('
      'message: $message, '
      'statusCode: $statusCode, '
      ')';
}

/// [ConnectionException] is thrown if there are problems with the connection

final class ConnectionException extends RestClientException {
  const ConnectionException({
    required super.message,
    super.statusCode,
    super.cause,
  });

  @override
  String toString() =>
      'ConnectionException('
      'message: $message, '
      'statusCode: $statusCode, '
      'cause: $cause'
      ')';
}

/// If something went wrong on the server side

final class InternalServerException extends RestClientException {
  const InternalServerException({
    required super.message,
    super.statusCode,
    super.cause,
  });

  @override
  String toString() =>
      'InternalServerException('
      'message: $message, '
      'statusCode: $statusCode, '
      'cause: $cause'
      ')';
}
