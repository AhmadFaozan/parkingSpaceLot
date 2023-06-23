import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? selectedVideo;

  Future<void> uploadVideo() async {
    if (selectedVideo != null) {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://192.168.43.153:5000/detect'),
      );
      request.files.add(await http.MultipartFile.fromPath('video', selectedVideo!.path));

      try {
        var response = await request.send();
        if (response.statusCode == 200) {
          print('Upload successful');
          await downloadDetectedVideo(response);
        } else {
          print('Upload failed');
          // Handle error or display error message
        }
      } catch (e) {
        print('Error occurred during upload: $e');
        // Handle specific error or display generic error message
      }
    }
  }

  Future<void> downloadDetectedVideo(http.StreamedResponse response) async {
    if (await Permission.storage.request().isGranted) {
      final externalDir = await getExternalStorageDirectory();
      final filePath = '${externalDir!.path}/detected_video.mp4';

      final file = File(filePath);
      await response.stream.pipe(file.openWrite());

      print('Download successful');
      print('File location: $filePath'); // Cetak lokasi file

      // Handle downloaded file, e.g., play video or save it to local storage
    } else {
      print('Permission to access storage denied');
      // Handle permission denied scenario
    }
  }

  Future<void> pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['3gp', 'mkv', 'avi', 'mp4'],
    );

    if (result != null) {
      setState(() {
        selectedVideo = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Object Detection'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (selectedVideo != null)
                Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.video_camera_front,
                            size: 24,
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Text(
                              'Selected Video: ${selectedVideo!.path}',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton.icon(
                  onPressed: pickVideo,
                  icon: Icon(Icons.folder_open),
                  label: Text('Choose Video'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton.icon(
                  onPressed: uploadVideo,
                  icon: Icon(Icons.cloud_upload),
                  label: Text('Upload Video'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
