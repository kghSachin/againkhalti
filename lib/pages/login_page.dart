import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workshopproject/pages/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var engOrNep = 'Eng';
  bool isTrue = true;
  void _pressed() {
    setState(() {
      engOrNep == "ने" ? engOrNep = "Eng" : engOrNep = "ने";
    });
  }

  Future<void> _launchURL(Uri url) async {
    final Uri uri = Uri(scheme: 'https', host: Uri.encodeFull(url.toString()));
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  late final TextEditingController _phoneNoController;
  late final TextEditingController _passwordController;
  @override
  initState() {
    super.initState();
    _phoneNoController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  dispose() {
    _phoneNoController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: _pressed,
                    child: Container(
                      height: 60,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          engOrNep,
                          style: const TextStyle(
                              color: Colors.deepPurple, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  Constants.headingKhalti,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  Constants.signupstart,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: _phoneNoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    labelText: 'Enter your Phone Number ',
                    hintText: "Phone Number",
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    labelText: 'Enter your Name',
                    hintText: "Full Name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14))),
                      labelText: ' Enter Password ',
                      hintText: "New Password",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isTrue = !isTrue;
                            });
                          },
                          icon: isTrue
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.visibility_off))),
                  obscureText: isTrue ? true : false,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, top: 4),
                child: Text(
                  "Enter 8 charecter password",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () async {
                    final password = _passwordController.text;
                    final phoneNo = _phoneNoController.text;
                    final userCredential =
                        await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: _phoneNoController.text,
                      verificationCompleted:
                          (PhoneAuthCredential credential) async {
                        await FirebaseAuth.instance
                            .signInWithCredential(credential);
                      },
                      verificationFailed: (FirebaseAuthException e) {
                        if (e.code == 'invalid-phone-number') {
                          print('The provided phone number is not valid.');
                        }
                      },
                      codeSent:
                          (String verificationId, int? resendToken) async {
                        final PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                          verificationId: verificationId,
                          smsCode: '123456',
                        );
                        await FirebaseAuth.instance
                            .signInWithCredential(credential);
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      " CREATE KHALTI ACCOUNT ",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Center(
                child: Text(
                  Constants.alreadyHaveAnAcc,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text(Constants.termsAndCondition,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    )),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    _launchURL(Uri.parse("www.khalti.com"));
                  },
                  child: const Text(
                    Constants.likedterm,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
