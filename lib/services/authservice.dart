import 'package:amemais/Screens/Home/home_screen.dart';
import 'package:amemais/Screens/Welcome/welcome_screen.dart';
import 'package:amemais/Screens/aceitacao_termos/aceitacao_termos_screen.dart';
import 'package:amemais/error_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Screens/Login/login_screen.dart';
import 'package:get/get.dart';


class AuthService{

  handleAuth(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder:(BuildContext context, snapshot){
        if(snapshot.hasData){
          return HomeScreen();
          
        }else{
          
          return LoginScreen();
        
        }
      });
     
  }
  //Sign Out
  signOut(){
    FirebaseAuth.instance.signOut();
     Get.to(LoginScreen());
  }
  //Sign In
  signIn(String email, String password, context){

    FirebaseAuth.instance
    .signInWithEmailAndPassword(email: email, password: password)
    .then((val){
      print("Signed in");
      // Navigator.pushNamed(context, HomeScreen.routeName);
      Get.to(HomeScreen());
    }).catchError((e){
        ErrorHandler().errorDialog(context, e);
    });

   
    
  }

  //Signup a new user
  signUp(String email, String password) {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);  
  }
  //Reset Password
  resetPasswordLink(String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

   //Sign In with Google
  
  signInWithGoogle() async {
 
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;


  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
      
  //return await FirebaseAuth.instance.signInWithCredential(credential);
  UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
 
  if (userCredential.additionalUserInfo.isNewUser) {
  
    print("New User!");
    Get.to(AceitacaoTermosScreen());
  }else{
    Get.to(HomeScreen());
  }
}


  //Facebook Sign In
  fbSignIn() async {
    final fb = FacebookLogin();


    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
      
    ]);
 
    switch (res.status) {
      case FacebookLoginStatus.success:
       
        final FacebookAccessToken accessToken = res.accessToken;
        final AuthCredential authCredential =
            FacebookAuthProvider.credential(accessToken.token);
        

         UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(authCredential);
 
        if (userCredential.additionalUserInfo.isNewUser) {
          print("New User!");
          Get.to(AceitacaoTermosScreen());
        }else{
  //return await FirebaseAuth.instance.signInWithCredential(authCredential);
          Get.to(HomeScreen());
        }
        
         

        // Get profile data
        final profile = await fb.getUserProfile();
        print('Hello, ${profile.name}! You ID: ${profile.userId}');

        // Get user profile image url
        final imageUrl = await fb.getProfileImageUrl(width: 100);
        print('Your profile image: $imageUrl');

        // Get email (since we request email permission)
        final email = await fb.getUserEmail();
        // But user can decline permission
        if (email != null) print('And your email is $email');

        break;
      case FacebookLoginStatus.cancel:
        // User cancel log in
        break;
      case FacebookLoginStatus.error:
        // Log in failed
        print('Error while log in: ${res.error}');
        break;
    }
    
  }

}
