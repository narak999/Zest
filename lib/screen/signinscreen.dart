import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zest/screen/forgotpasswordscreen.dart';
import 'package:zest/screen/homescreen.dart';
import 'package:zest/screen/signupscreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState ();
}

class _SignInScreenState  extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }

  void _onSubmit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      setState(() => _isLoading = true);
      Future.delayed(
        const Duration(seconds: 2),
            () => setState(() => {
          _isLoading = false,
          Navigator.push(context, _createRoute(const MyHomeScreen(title: 'Zest')))
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Stack(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                reverse: true,
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: SizedBox(
                                width: 150,
                                height: 150,
                                child: Image.asset('assets/logo/png/lemon-29-256.png')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 16,
                                height: 28,
                                child: Icon(Icons.phone_iphone, color: Colors.grey),
                              ),
                              const SizedBox(width: 18),
                              Flexible(
                                  child: TextFormField(
                                    enabled: !_isLoading,
                                    controller: _phoneController,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        hintText: 'Phone Number'
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter your phone number';
                                      }
                                      if (!isNumeric(value)) {
                                        return 'Please enter a valid phone number';
                                      }
                                      return null;
                                    },
                                  ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 16,
                                height: 28,
                                child: Icon(Icons.lock, color: Colors.grey),
                              ),
                              const SizedBox(width: 18),
                              Flexible(
                                child: TextFormField(
                                  enabled: !_isLoading,
                                  obscureText: _obscureText,
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    hintText: 'Password',
                                    suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureText ? Icons.visibility_off : Icons.visibility,
                                          color: Colors.grey,
                                        ),
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      }
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  }
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, _createRoute(const ForgotPasswordScreen()));
                          },
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(color: Colors.blue, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton.icon(
                            onPressed: _isLoading ? null : _onSubmit,
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(const Size(250, 50)),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            icon: _isLoading
                                ? Container(
                                    width: 30,
                                    height: 30,
                                    padding: const EdgeInsets.all(5.0),
                                      child: const CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 3,
                                      ),
                            )
                                : const Icon(Icons.login, color: Colors.white),
                            label: const Text('Sign In', style: TextStyle(color: Colors.white, fontSize: 25)),
                        ),
                        const SizedBox(
                          height: 65,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(context, _createRoute(const SignUpScreen()));
                              },
                              child: const Text(
                                'New User? Create Account',
                                style: TextStyle(color: Colors.blue, fontSize: 18),
                              ),
                              )
                        ),
                        Padding( // this is new
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
                        ),
                      ],
                    ),
                ),
              ),
            )
          ),
        ],
      )
    );
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

bool isNumeric(String str) {
  // Check if the string matches a regular expression that allows only numbers
  return RegExp(r'^[0-9]+$').hasMatch(str);
}