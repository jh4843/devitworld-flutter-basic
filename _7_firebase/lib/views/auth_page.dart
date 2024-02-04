import 'package:_7_firebase/views/memo_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   _auth.authStateChanges().listen((user) {
  //     if (user != null) {
  //       _gotoMemoPage();
  //     }
  //   });
  // }

  void _gotoMemoPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MemoPage(),
      ),
    );
  }

  // 이메일/비밀번호로 로그인
  void _signInWithEmail() async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: _idController.text, password: _passwordController.text);
      print("Logged in with email: ${userCredential.user}");
      _gotoMemoPage();
    } catch (e) {
      print(e);
    }
  }

  // 구글로 로그인
  void _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      print("Logged in with Google: ${userCredential.user}");
      _gotoMemoPage();
    } catch (e) {
      print(e);
    }
  }

  // 익명으로 로그인
  void _signInAnonymously() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      print("Logged in anonymously: ${userCredential.user}");
      _gotoMemoPage();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Auth"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  TextFormField(
                    controller: _idController,
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true, // 비밀번호 숨김 처리
                    decoration: const InputDecoration(labelText: "Password"),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () => _signInWithEmail(),
                    child: const Row(
                      children: [
                        Icon(Icons.email, color: Colors.red),
                        SizedBox(width: 10),
                        Text("Sign in with Email"),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _signInWithGoogle,
                    child: const Row(
                      children: [
                        Icon(FontAwesomeIcons.google, color: Colors.red),
                        SizedBox(width: 10),
                        Text("Sign in with Google"),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _signInAnonymously,
                    child: const Row(
                      children: [
                        Icon(Icons.person, color: Colors.red),
                        SizedBox(width: 10),
                        Text("Sign in Anonymously"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
