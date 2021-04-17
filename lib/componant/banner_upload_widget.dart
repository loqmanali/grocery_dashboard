import 'dart:html';

import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/material.dart';
import 'package:grocery_dashboard/services/firebase_services.dart';

import 'custom_text_field.dart';

class BannerUploadWidget extends StatefulWidget {
  @override
  _BannerUploadWidgetState createState() => _BannerUploadWidgetState();
}

class _BannerUploadWidgetState extends State<BannerUploadWidget> {
  FirebaseServices _services = FirebaseServices();
  bool _visible = false;
  final _fileNameTextController = TextEditingController();
  bool _imageSelected = true;
  String _url;

  @override
  Widget build(BuildContext context) {
    ArsProgressDialog progressDialog = ArsProgressDialog(
      context,
      blur: 2.0,
      backgroundColor: Color(0xff84c225).withOpacity(0.9),
      animationDuration: Duration(milliseconds: 500),
    );
    return Container(
      color: Colors.grey[300],
      width: MediaQuery.of(context).size.width,
      height: 80.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Row(
            children: [
              Visibility(
                visible: _visible,
                child: Container(
                  child: Row(
                    children: [
                      AbsorbPointer(
                        absorbing: true,
                        child: SizedBox(
                          width: 300.0,
                          child: CustomTextField(
                            controller: _fileNameTextController,
                            hintText: 'Upload Image',
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          uploadStorage();
                        },
                        child: Text('Upload Image'),
                      ),
                      SizedBox(width: 10.0),
                      AbsorbPointer(
                        absorbing: _imageSelected,
                        child: ElevatedButton(
                          onPressed: () {
                            progressDialog.show();
                            _services
                                .uploadBannerImageToDb(_url)
                                .then((downloadUrl) {
                              if (downloadUrl != null) {
                                progressDialog.dismiss();
                                _services.showMyDialog(
                                  title: 'New Banner Image',
                                  message: 'Saved Banner Image Successfully',
                                  context: context,
                                );
                              }
                            });
                          },
                          child: Text('Save Image'),
                          style: ElevatedButton.styleFrom(
                            primary: _imageSelected
                                ? Colors.black12
                                : Colors.black45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              AbsorbPointer(
                absorbing: _visible ? true : false,
                child: ElevatedButton(
                  onPressed: () {
                    print(_visible);
                    setState(() {
                      _visible = true;
                    });
                  },
                  child: Text('Add New Banner'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void uploadImage({@required Function(File file) onSelected}) {
    InputElement uploadInput = FileUploadInputElement()..accept = 'image/*';
    uploadInput.click();
    uploadInput.onChange.listen((event) {
      final file = uploadInput.files.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        onSelected(file);
      });
    });
  }

  void uploadStorage() {
    /// upload selected image to Firebase Storage

    final dateTime = DateTime.now();
    final path = 'bannerImage/$dateTime';
    uploadImage(onSelected: (file) {
      if (file != null) {
        setState(() {
          _fileNameTextController.text = file.name;
          _imageSelected = false;
          _url = path;
        });
        fb
            .storage()
            .refFromURL('gs://dashboard-f9642.appspot.com')
            .child(path)
            .put(file);
      }
    });
  }
}
