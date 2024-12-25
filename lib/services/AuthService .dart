import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up with email and password
  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user; // Returns the signed-up user
    } on FirebaseAuthException catch (e) {
      print("Error: ${e.message}");
      return null; // Return null in case of an error
    }
  }

  // Sign in with email and password
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user; // Returns the signed-in user
    } on FirebaseAuthException catch (e) {
      print("Error: ${e.message}");
      return null; // Return null in case of an error
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print("User signed out");
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  // Check if a user is currently signed in
  User? get currentUser {
    return _auth.currentUser;
  }
    // Forget password: Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      print("Password reset email sent to $email");
    } on FirebaseAuthException catch (e) {
      print("Error sending password reset email: ${e.message}");
    }
  }
}
