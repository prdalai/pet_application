import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class YourImagesSection extends StatefulWidget {
  @override
  _YourImagesSectionState createState() => _YourImagesSectionState();
}

class _YourImagesSectionState extends State<YourImagesSection> {
  List<String> uploadedImages = [];

  final ImagePicker _picker = ImagePicker();
  String? _selectedImg;

  void showAlertDialog(BuildContext context, String title, String message) {
    // Implement your custom alert dialog here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showUploadOptions() async {
    await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (context, setState2) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin:
                    EdgeInsets.only(left: 20, top: 15, bottom: 10, right: 20),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            child: Text(
                              'Choose App',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(
                      thickness: 0.5,
                      color: Colors.black38,
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                        var image = await _picker.pickImage(
                          source: ImageSource.camera,
                        );
                        if (image == null) {
                          showAlertDialog(context, 'Error', "No file Selected");
                        } else {
                          setState(() {});
                          var file_name = image.path;
                          uploadedImages.add(file_name);

                          final bytes = await File(file_name).readAsBytes();

                          String img64 = base64Encode(bytes);
                          setState(() {
                            _selectedImg = img64;
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12, top: 12),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: Text(
                                  'From camera',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                        var image = await _picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        if (image == null) {
                          showAlertDialog(context, 'Error', "No file Selected");
                        } else {
                          setState(() {});
                          var file_name = image.path;
                          uploadedImages.add(file_name);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12, top: 12),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.photo_outlined,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: Text(
                                  'From Gallery',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Images Section'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Stack(
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).orientation ==
                    Orientation.landscape
                    ? 3
                    : 2,
                childAspectRatio: 1,
              ),
              itemCount: uploadedImages.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: FileImage(File(uploadedImages[index])),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
            if (uploadedImages.isEmpty)
              Container(
                alignment: Alignment.center,
                child: Text(
                  'You haven\'t added any image of your pet yet.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.010,
              right: MediaQuery.of(context).size.width * 0.38, // 25% of the screen width
              child: ElevatedButton(
                onPressed: showUploadOptions,
                child: const Icon(Icons.upload),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.all(15),
                  elevation: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

