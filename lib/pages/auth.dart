import 'package:oyoapp/pages/firestore_service.dart';
import 'package:oyoapp/pages/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oyoapp/locator.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(id: user.uid, email: user.email) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  User _currentUser;
  User get currentUser => _currentUser;

  Future loginWithEmail(String email, String password) async {
    try {
      var authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = authResult.user;
      await _populateCurrentUser(authResult.user);
      return user;
      // return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String fname, String lname, String email,
      String number, String password, String confirmpassword) async {
    // Future registerWithEmailAndPassword(
    //     String fname, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      await _firestoreService.createUser(User(
        id: user.uid,
        email: email,
        fname: fname,
        lname: lname,
        number: number,
        password: password,
        confirmpassword: confirmpassword,
      ));
      await _firestoreService.createUser(_currentUser);
      // return result.user != null;
      // return user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _auth.currentUser();
    await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
