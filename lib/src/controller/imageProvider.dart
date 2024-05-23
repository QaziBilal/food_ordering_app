import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends ChangeNotifier {
  File? _selectedImage;

  File? get selectedImage => _selectedImage;

  set selectedImage(File? image) {
    _selectedImage = image;
    notifyListeners();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
    }
  }
}
