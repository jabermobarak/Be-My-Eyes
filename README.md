  # Be My Eyes
### Camera-Based Image Recognition with Spoken Feedback

Be My Eyes is a Flutter prototype designed to help people with visual impairments recognize objects around them. It processes camera frames using MobileNet V1 and reads recognized labels aloud in English.

## Features

- Live camera preview.
- On-device image classification using TensorFlow Lite.
- Spoken feedback through text-to-speech.
- Display of the latest recognized label.
- Large control for toggling the camera preview and recognition.
- Audio feedback when the camera control is tapped.
- In-app privacy policy page.

## How It Works

1. The app requests camera permission and opens the camera.
2. Every tenth camera frame is passed to MobileNet V1.
3. The model returns its highest-ranked classification.
4. Predictions with confidence above 45% are accepted.
5. Each new label is displayed and spoken aloud.

The app remembers previously announced labels during the current scanning session to avoid repeating them.

## Technology

| Component | Technology |
|---|---|
| Application | Flutter and Dart |
| Image classification | MobileNet V1 |
| Model inference | TensorFlow Lite through `tflite_v2` |
| Camera access | `camera` |
| Spoken feedback | `flutter_tts` |
| State management | GetX |
| Permissions | `permission_handler` |
| Audio effects | `audioplayers` |

## Model Assets

The active implementation loads:

- `assets/ai_models/mobilenet_v1.tflite`
- `assets/ai_models/mobilenet_v1.txt`

Tiny YOLOv2 model files are also included in the repository, but the current scanning controller uses MobileNet V1.

## Project Structure

| Path | Purpose |
|---|---|
| `lib/main.dart` | Application entry point and start screen |
| `lib/controller/scan_controller.dart` | Camera processing, inference, and speech |
| `lib/views/camera_view.dart` | Camera preview and recognition interface |
| `lib/views/privacypolicy.dart` | Privacy policy screen |
| `lib/utils/assets_manager.dart` | Asset path definitions |
| `assets/ai_models/` | TensorFlow Lite models and labels |
| `assets/audio/` | Audio feedback files |
| `assets/images/` | Interface images |
| `pubspec.yaml` | Dependencies and asset configuration |

## Getting Started

### Requirements

- Flutter SDK with Dart `>=3.3.0 <4.0.0`.
- Android development tools.
- A physical Android device with a camera is recommended.
- An English text-to-speech voice installed on the device.

### Installation

Clone the repository:

```bash
git clone https://github.com/jabermobarak/Be-My-Eyes.git
cd Be-My-Eyes
```

Install dependencies:

```bash
flutter pub get
```

Check your development environment and connected devices:

```bash
flutter doctor
flutter devices
```

### Camera Configuration

Check that camera permission is declared in
`android/app/src/main/AndroidManifest.xml`, directly inside the `<manifest>` element:

```xml
<uses-permission android:name="android.permission.CAMERA" />
```

The repository includes an iOS project scaffold. Before running on iOS, configure camera usage permission in `ios/Runner/Info.plist` and the required native plugin settings:

```xml
<key>NSCameraUsageDescription</key>
<string>Camera access is used to recognize objects and provide spoken feedback.</string>
```

### Run

```bash
flutter run
```

Native dependency or build configuration updates may be needed when using newer Flutter versions.

## Usage

1. Open the app and tap **Get Started**.
2. Grant camera permission.
3. Point the camera toward an object.
4. Listen for the recognized label and view it on screen.
5. Use the large camera control to pause or resume recognition and the preview.

## Current Limitations

- MobileNet classifies the camera frame; it does not locate multiple objects with bounding boxes.
- Spoken feedback is currently configured for English.
- Labels are announced only once per scanning session.
- Recognition depends on lighting, framing, and the model’s supported classes.
- The camera toggle hides the preview and skips inference; it does not stop the underlying camera stream.
- This repository does not include measured recognition accuracy or performance benchmarks.
- Compatibility across mobile platforms has not been established here.

## Future Improvements

- Object detection with bounding boxes.
- Configurable confidence thresholds.
- Repeat announcements after a suitable delay.
- Additional speech languages.
- Improved camera lifecycle and error handling.
- Accessibility testing with intended users.
- Device-level accuracy and latency evaluation.

## Author

**Jaber Mobarak**

## Report

[Read the project report](Be_My_Eyes_Report.pdf)
[GitHub](https://github.com/jabermobarak)
https://github.com/jabermobarak/Be-My-Eyes/assets/150077156/fdcc68d2-b7b4-4021-8cde-dfd6a15f855e



![Screenshot 2024-05-11 161800](https://github.com/jabermobarak/Be-My-Eyes/assets/150077156/eb6fc284-ce3c-4d4b-b8c2-c4846c9615ed)

![Screenshot 2024-05-11 161814](https://github.com/jabermobarak/Be-My-Eyes/assets/150077156/c70e9657-b972-4ec8-a61a-f98c6e737319)
![Screenshot 2024-05-11 161848](https://github.com/jabermobarak/Be-My-Eyes/assets/150077156/bf230dc1-1e31-49f5-9d68-7566a6d68c59)

