import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

class AuthService{

  final _auth = FirebaseAuth.instance;
  Future<UserCredential> signInWithCredential(AuthCredential credential)=>
      _auth.signInWithCredential(credential);
      Future<void> logout() => _auth.signOut();
      Stream<User> get currentUser => _auth.authStateChanges();
}

// final AuthService authService = AuthService();