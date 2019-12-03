import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tts_improved/flutter_tts_improved.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_tts_improved');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('setSpeechRate', () async {
    FlutterTtsImproved tts = FlutterTtsImproved();
    expect(await tts.setSpeechRate(1), '1');
  });
}
