import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:smart_electricity_manager/domain/admin.dart';
import 'package:smart_electricity_manager/domain/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseService {
  FirebaseAuth _auth;
  FirebaseDatabase _firebaseDatabase;
  DatabaseService() {
    _auth = FirebaseAuth.instance;
    _firebaseDatabase = FirebaseDatabase.instance;
    print(_firebaseDatabase);
  }

  Future<String> register(Admin admin) async {
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
              email: admin.email, password: admin.password))
          .user;
      await registerInDatabase(admin);
    } catch (e) {
      if (e is PlatformException && e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return 'ERROR_EMAIL_ALREADY_IN_USE';
      } else if (e is PlatformException && e.code == 'ERROR_WEAK_PASSWORD') {
        return 'ERROR_WRONG_PASSWORD';
      } else {
        return 'VALID_USER';
      }
    }
    return 'VALID_USER';
  }

  Future<String> registerUser(AppUser appUser) async {
    try {
      // FirebaseApp tempApp = await Firebase.initializeApp(name: 'temporaryregister', options: Firebase.app().options);
      // FirebaseAuth tempAuth = FirebaseAuth.instance;
      // final User user = (await tempAuth.createUserWithEmailAndPassword(email: appUser.email, password: appUser.password)).user;
      // await FirebaseAuth.instanceFor(app: tempApp).createUserWithEmailAndPassword(
      //     email: appUser.email, password: appUser.password);
      final User user = (await _auth.createUserWithEmailAndPassword(
              email: appUser.email, password: appUser.password))
          .user;
      await registerUserInDatabase(appUser);
      await _auth.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String email = prefs.getString('email');
      String password = prefs.getString('password');
      login(email, password);
      //tempApp.delete();
      print(_auth.currentUser.uid);
    } catch (e) {
      if (e is PlatformException && e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return 'ERROR_EMAIL_ALREADY_IN_USE';
      } else if (e is PlatformException && e.code == 'ERROR_WEAK_PASSWORD') {
        return 'ERROR_WRONG_PASSWORD';
      } else {
        return 'VALID_USER';
      }
    }
    return 'VALID_USER';
  }

  Future<String> login(email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'user-not-found';
      } else if (e.code == 'wrong-password') {
        return 'wrong-password';
      }
    }
    return 'valid_user';
  }

  Future<String> checkUserType() async {
    final uid = _auth.currentUser.uid;
    DataSnapshot dataSnapshot = await _firebaseDatabase
        .reference()
        .child('users')
        .child(uid)
        .child('type')
        .once();
    return dataSnapshot.value;
  }

  void registerInDatabase(Admin admin) async {
    final uid = _auth.currentUser.uid;
    _firebaseDatabase
        .reference()
        .child('users')
        .child(uid)
        .set({'name': admin.name, 'type': 'admin', 'email': admin.email});
  }

  void registerUserInDatabase(AppUser user) async {
    final uid = _auth.currentUser.uid;
    _firebaseDatabase
        .reference()
        .child('users')
        .child(uid)
        .set({'name': user.name, 'type': 'user', 'email': user.email});
  }

  void setAutomaticMode(bool mode) {
    _firebaseDatabase
        .reference()
        .child('automatic_mode')
        .set({'enabled': mode});
  }

  Future<bool> getAutomaticMode() async {
    DataSnapshot dataSnapshot =
        await _firebaseDatabase.reference().child('automatic_mode').once();
    return dataSnapshot.value['enabled'];
  }

  void setLightStatus(bool mode) {
    _firebaseDatabase
        .reference()
        .child('status')
        .child('light')
        .set({'enabled': mode});
  }

  Future<bool> getLightStatus() async {
    DataSnapshot dataSnapshot = await _firebaseDatabase
        .reference()
        .child('status')
        .child('light')
        .once();
    return dataSnapshot.value['enabled'];
  }

  Future<num> getTemperature() async {
    DataSnapshot dataSnapshot =
        await _firebaseDatabase.reference().child('sensors').once();
    return dataSnapshot.value['temperature'];
  }

  Future<String> getLight() async {
    DataSnapshot dataSnapshot =
        await _firebaseDatabase.reference().child('sensors').once();
    return dataSnapshot.value['light'];
  }

  void setFanStatus(bool mode) {
    _firebaseDatabase
        .reference()
        .child('status')
        .child('fan')
        .set({'enabled': mode});
  }

  Future<bool> getFanStatus() async {
    DataSnapshot dataSnapshot =
        await _firebaseDatabase.reference().child('status').child('fan').once();
    return dataSnapshot.value['enabled'];
  }

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    final user = _auth.currentUser;
    bool flag;
    final credential =
        EmailAuthProvider.credential(email: user.email, password: oldPassword);
    final response = await user.reauthenticateWithCredential(credential);
    try {
      await user.updatePassword(newPassword);
      return true;
    } catch (error) {
      return false;
    }
    // user.reauthenticateWithCredential(credential).then((value) => {
    //   user.updatePassword(newPassword).then((_)  {
    //     flag = true;
    //   }).catchError((_) {
    //     flag = false;
    // }).catchError((_) {
    //   flag =  false;
    //   })
    // }).then((_) {
    //   return flag;
    // });
  }

  Future<bool> logout() async {
    await _auth.signOut();
  }

  Future<bool> deleteUser(email) {}

  Future<void> sendPasswordResetEmail(email) {
    return _auth.sendPasswordResetEmail(email: email);
  }
}
