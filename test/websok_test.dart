/// For HTML:
/// import 'package:websok/io.dart';
///
/// For IO (Flutter, Dart, etc.)
import 'package:websok/io.dart';

/// Testing library.
import 'package:test/test.dart';

/// The received string.
String received;
/// Callback to execute when the function is over.
void onData(dynamic message) => received = message;

void main() {
  test('Performs a test websocket connection', () async {
    /// For HTML: IOWebsok -> HTMLWebsok
    final sok = IOWebsok(host: 'echo.websocket.org', tls: true)
      ..connect()
      ..listen(onData: onData);
    // Assets the connection.
    expect(sok.isActive, true);
    // Send a message.
    final message = 'Hello, world!';
    sok.send(message);
    // Check the message.
    await Future.delayed(Duration(seconds: 1), () => expect(received, message));
    // Close the connection after 1 sec.
    sok.close();
    // Assets the connection.
    expect(sok.isActive, false);
  });
}