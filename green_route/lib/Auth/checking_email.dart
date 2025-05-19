import 'package:firebase_auth/firebase_auth.dart';

Future<bool> checkIfEmailExists(String email) async {
  try {
    
    // ignore: deprecated_member_use
    List<String> signInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

    
    return signInMethods.isNotEmpty;
  } catch (e) {
    print("Error checking email existence: $e");
    return false; 
  }
}