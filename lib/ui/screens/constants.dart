import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

const backgroundColor = Colors.black;

const kButtonColor = Colors.black;

//FIREBASE

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

FirebaseStorage firebaseStorage = FirebaseStorage.instance;
