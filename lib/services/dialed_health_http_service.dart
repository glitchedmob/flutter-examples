import 'dart:io';

import 'package:http/http.dart' as http;


// example usage
// final _http = GetIt.I.get<DialedHealthHttpService>();
// final res = await _http.post('/api/some-url');

class DialedHealthHttpService extends http.BaseClient {
  // Find some way to get this, maybe a public method that sets it's value
  // that the auth service can use
  String? _authToken;
  final String _urlPrefix = 'https://some-base-url';
  final http.Client _inner = http.Client();

  String get _authHeader => _authToken == null ? '' : 'Bearer $_authToken';

  @override
  Future<http.StreamedResponse> send(http.BaseRequest incoming) {
    final request = incoming as http.Request;

    final modifiedRequest = http.Request(
      request.method,
      Uri.parse('$_urlPrefix${request.url.toString()}'),
    );

    modifiedRequest.headers.addAll(request.headers);
    modifiedRequest.encoding = request.encoding;
    modifiedRequest.bodyBytes = request.bodyBytes.toList();

    if (_authHeader != '') {
      modifiedRequest.headers[HttpHeaders.authorizationHeader] = _authHeader;
    }

    return _inner.send(modifiedRequest);
  }
}
