# Flutter Text To Speech Improved

The `flutter_tts` plugin (https://github.com/dlutton/flutter_tts) is GREAT! Thanks [@dlutton](https://github.com/dlutton/) for all your hard work on getting it up and running. Now it is time to improve it by allowing for the Utterances API to report the 'progress' of the speech of the Utterance. This is relatively new for Android, only introduced in Android 26. It has been around on iOS for quite some time though, back around iOS 7.0.

My goal with this plugin is to allow everyone in flutter to track where the speech is currently at. This can be used to print words on the screen as they are spoken, highlight words of a paragraph as they are uttered, for timing how long each word takes to say at a given speed, or really any other weird reason you may need it. This API is powerful, and I know people are asking for it, and there is simply not a plugin yet that covers it. Surprise! Now there is. You are welcome.

## Features

- [x] Android & iOS
  - [x] speak
  - [x] stop
  - [x] get languages
  - [x] set language
  - [x] is language available
  - [x] set speech rate
  - [x] set speech volume
  - [x] set speech pitch
  - [x] get voices
  - [x] set voice
	- [x] #NEW track what word is currently being said (on all iOS 7+ and Android 26+)
- [x] Android
  - [x] set Silence

## Usage

## Android

Change the minimum Android sdk version to 21 (or higher) in your `android/app/build.gradle` file.

```java
minSdkVersion 21
```

## iOS

There's a known issue with integrating plugins that use Swift into a Flutter project created with the Objective-C template. [Flutter#16049](https://github.com/flutter/flutter/issues/16049)

[Example](https://github.com/loushou/flutter_tts_improved/blob/master/example/lib/main.dart)

To use this plugin :

- add the dependency to your [pubspec.yaml](https://github.com/loushou/flutter_tts_improved/blob/master/example/pubspec.yaml) file.

```yaml
  dependencies:
    flutter:
      sdk: flutter
    flutter_tts_improved:
```

- instantiate a FlutterTtsImproved instance

```dart
FlutterTtsImproved tts = new FlutterTtsImproved();
```

### speak, stop, getLanguages, setLanguage, setSpeechRate, setVolume, setPitch, isLanguageAvailable

```dart
Future _speak() async{
    var result = await tts.speak("Hello World");
    if (result == 1) setState(() => ttsState = TtsState.playing);
}

Future _stop() async{
    var result = await tts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
}

List<dynamic> languages = await tts.getLanguages;

await tts.setLanguage("en-US");

await tts.setSpeechRate(1.0);

await tts.setVolume(1.0);

await tts.setPitch(1.0);

await tts.isLanguageAvailable("en-US");
```

### Listening for platform calls

```dart
// #NEW
tts.setProgressHandler((String fullPhrase, int wordOffset, int endOfWordOffset, String currentWord) {
  setState(() {
    _wordToDisplay = currentWord;
  });
});

tts.setStartHandler(() {
  setState(() {
    ttsState = TtsState.playing;
  });
});

tts.setCompletionHandler(() {
  setState(() {
    ttsState = TtsState.stopped;
  });
});

tts.setErrorHandler((msg) {
  setState(() {
    ttsState = TtsState.stopped;
  });
});
```

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).
