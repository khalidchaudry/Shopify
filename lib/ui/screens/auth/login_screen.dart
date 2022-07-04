import 'package:flutter/material.dart';
import 'package:shopify/ui/screens/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const TextField(
            decoration: InputDecoration(
                filled: true,
                hintText: 'Enter your Email',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ),
          const SizedBox(
            height: 20,
          ),
          const TextField(
            decoration: InputDecoration(
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: kButtonColor,
                  minimumSize: const Size(double.infinity, 50)),
              child: Text(
                'Login'.toUpperCase(),
                style: const TextStyle(fontSize: 20),
              )),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Need an account?'),
              TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/signup'),
                  child: Text('Sign Up'.toUpperCase()))
            ],
          )
        ]),
      ),
    );
  }
}
