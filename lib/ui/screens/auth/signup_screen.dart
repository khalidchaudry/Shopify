import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopify/controllers/auth_controller.dart';

import '../constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullNamecontroller = TextEditingController();

  TextEditingController userNamecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();
  bool isLoading = true;

  AuthController authController = AuthController();
  Uint8List? img;
  pickImage() async {
    Uint8List image =
        await authController.imagePicker(source: ImageSource.gallery);
    setState(() {
      img = image;
    });
  }

  signUpUser() async {
    setState(() {
      isLoading = true;
    });
    String checkError = await authController.registerUser(
        image: img!,
        fullName: fullNamecontroller.text,
        username: userNamecontroller.text,
        email: emailcontroller.text,
        password: passwordcontroller.text);
    setState(() {
      isLoading = false;
    });

    if (checkError != 'Success') {
      return showSnackBar(checkError, context);
    } else {
      return showSnackBar(
          'Congratulations! Your account successfully created', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  img != null
                      ? CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.white,
                          backgroundImage: MemoryImage(img!),
                        )
                      : const CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              'https://www.pinclipart.com/picdir/big/157-1578186_isolation-gown-clipart.png'),
                        ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                          onPressed: pickImage,
                          icon: const Icon(
                            Icons.add_a_photo,
                            size: 30,
                          )))
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: fullNamecontroller,
                decoration: const InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    hintText: 'Enter your full name'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: userNamecontroller,
                decoration: const InputDecoration(
                    filled: true,
                    hintText: 'Enter your username',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                    filled: true,
                    hintText: 'Enter your Email',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordcontroller,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Enter your Password',
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    signUpUser();
                    fullNamecontroller.clear();
                    userNamecontroller.clear();
                    emailcontroller.clear();
                    passwordcontroller.clear();
                    img?.clear();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: kButtonColor,
                      minimumSize: const Size(double.infinity, 50)),
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                      : Text(
                          'register'.toUpperCase(),
                          style: const TextStyle(fontSize: 20),
                        )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Login'.toUpperCase()))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
