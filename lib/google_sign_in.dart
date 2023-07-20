
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(clientId:"583701085851-ol9p8b6eoi6codi2k7u6o6i9h5uuu19q.apps.googleusercontent.com" );

  Future<void> initializeFirebase() async {
    await _googleSignIn.signInSilently();
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential =
        await _auth.signInWithCredential(authCredential);
        final User? user = userCredential.user;
        return user;
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
















// class GoogleSignInProvider extends ChangeNotifier {
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//
//   GoogleSignInAccount? _user;
//
//   GoogleSignInAccount get user => _user!;
//
//   Future<void> googleLogin() async {
//     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//     if (googleUser == null) return;
//     _user = googleUser;
//
//     final GoogleSignInAuthentication googleAuth =
//     await googleUser.authentication;
//
//     final   credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//
//
//     await FirebaseAuth.instance.signInWithCredential(credential);
//     notifyListeners();
//
//
//   }
//
// }
