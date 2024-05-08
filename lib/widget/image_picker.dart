import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? pickedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      setState(() {
        print(imageFile.path);
        pickedImage = File(imageFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          CircleAvatar(
            backgroundImage: pickedImage!=null?FileImage(pickedImage!):null,
          ),
          TextButton(
          onPressed:(){
            _pickImage();
            print('photo');
          },
          child: Text('Add photo'),
        ),
      ],
    );
  }
}
