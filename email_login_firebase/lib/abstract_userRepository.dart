import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


abstract class UserRepository<T>{
  Future<T> Register();
  Future<T> SignIn();
  Future<void> SignOut();

}

class EmailUser implements UserRepository{
  final String email;
  final String password;
  EmailUser({required this.email,required this.password});

  @override
  Future<UserCredential> Register() async{
   final auth=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

   return auth;
  }

  @override
  Future<UserCredential> SignIn() async{
   return FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> SignOut() async{
    return await FirebaseAuth.instance.signOut();

  }

}