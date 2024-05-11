import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import '../controller/scan_controller.dart';
import '../utils/assets_manager.dart';
import 'package:camera/camera.dart';

class CameraView extends StatelessWidget {
  CameraView({Key? key}) : super(key: key);

  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playSound(String path) async {
    try {
      await _audioPlayer.play(AssetSource(path));
    } catch (error) {
      print("error $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double cameraHeight = size.height * 3 / 4; // Set to 3/4 of the screen height
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ScanController>(
          init: ScanController(),
          builder: (controller) {
            if (!controller.isCameraInitialized.value) {
              return Container(); // Return an empty container when the camera is not initialized
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3, // 3/4 of the screen height
                  child: SizedBox(
                    height: cameraHeight,
                    child: controller.showCamera
                        ? CameraPreview(controller.cameraController)
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetsManager.noCamera,
                          width: size.width * 0.5, // Set the width to 50% of the screen width
                          fit: BoxFit.contain, // Ensure the image fits within the container
                        ),
                        SizedBox(height: 16), // Adjust vertical spacing as needed
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1, // 1/4 of the screen height
                  child: InkWell(
                    onTap: () async {
                      controller.changeShowCamera(!controller.showCamera);
                      if (controller.showCamera) {
                        await _playSound(AssetsManager.turnOffAudio);
                      } else {
                        await _playSound(AssetsManager.turnOnAudio);
                      }
                    },
                    child: Container(
                      color: const Color(0xFF063970),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 16), // Leave padding above "Turn Camera Off" text
                          if (controller.showCamera) ...[
                            Text(
                              "Turn Camera Off",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            SizedBox(height: 8),
                            Expanded(
                              child: ListView.builder(
                                itemCount: 1, // Only show the last detected label
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Chip(
                                      label: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          controller.detectedLabels.isNotEmpty
                                              ? controller.detectedLabels.last
                                              : "",
                                          style: TextStyle(
                                            color: Colors.black, // Change text color to black
                                            fontFamily: 'Roboto', // Change the font family
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                          if (!controller.showCamera) ...[
                            Text(
                              "Turn Camera On",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
