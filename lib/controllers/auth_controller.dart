import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopify/ui/screens/constants.dart';

class AuthController {
  // Upload Image to Firebase Storage
  uploadImageToStorage(Uint8List image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('ProfilePic')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    String download = await taskSnapshot.ref.getDownloadURL();
    return download;
  }

  // image picker function
  imagePicker({required ImageSource source}) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    } else {
      print('No Image selected');
    }
  }

  // Login Function
  Future registerUser(
      {required String fullName,
      required String username,
      required String email,
      required Uint8List image,
      required String password}) async {
    String checkError = 'Something went wrong';
    try {
      if (fullName.isNotEmpty &&
          username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential userCredential = await firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential.user!.email);
        String url = await uploadImageToStorage(image);
        await firebaseFirestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'full_name': fullName,
          'username': username,
          'email': email,
          'password': password,
          'image': url,
        });
        checkError = 'Successfully';
      } else {
        checkError = 'Please fill  fields';
      }
    } catch (e) {
      checkError = e.toString();
    }
    return checkError;
  }
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
  ));
}
