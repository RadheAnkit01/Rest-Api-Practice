import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class FakeStore extends StatefulWidget {
  const FakeStore({super.key});

  @override
  State<FakeStore> createState() => _FakeStoreState();
}

class _FakeStoreState extends State<FakeStore> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future pickImage() async {
    final pickedImage = await _picker.pickImage(
      source: ImageSource.gallery,
      // imageQuality: 70,
    );

    if (pickedImage != null) {
      image = File(pickedImage.path);
      setState(() {});
    } else {
      print('no image selected');
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });
    var stream = new http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();
    var uri = Uri.parse("https://fakestoreapi.com/products");

    var request = new http.MultipartRequest('POST', uri);
    request.fields["title"] = "Static String";

    var multiport = new http.MultipartFile('image', stream, length);
    var response = await request.send();
    if (response.statusCode == 201) {
      print('Image Uploaded');
      print(response.stream);
      setState(() {
        showSpinner = false;
      });
    } else {
      print(response.statusCode);
      print('Uploaded Failed');
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(title: Text('Store')),
        body: Column(
          children: [
            Center(
              child: Container(
                child: image == null
                    ? TextButton(
                        onPressed: () {
                          pickImage();
                        },
                        child: Text('Pick Image'),
                      )
                    : Container(
                        width: 400,
                        height: 400,
                        child: Image.file(
                          File(image!.path).absolute,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                uploadImage();
              },
              child: Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}
