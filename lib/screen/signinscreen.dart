import 'package:flutter/material.dart';
import 'package:zest/screen/forgotpasswordscreen.dart';
import 'package:zest/screen/homescreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState ();
}

class _SignInScreenState  extends State<SignInScreen> {
  var _isLoading = false;

  void _onSubmit() {
    setState(() => _isLoading = true);
    Future.delayed(
      const Duration(seconds: 2),
          () => setState(() => {
            _isLoading = false,
            Navigator.push(context, _createRoute(const MyHomeScreen(title: 'Zest')))
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100.0, bottom: 10),
                child: Center(
                  child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset('assets/logo/png/lemon-29-256.png')),
                ),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  enabled: !_isLoading,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter a Valid Email Address'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  enabled: !_isLoading,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter a Secure Password'),
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
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                  onPressed: _isLoading ? null : _onSubmit,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue ,padding: const EdgeInsets.all(16.0)),
                  icon: _isLoading
                      ? Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.all(2.0),
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                            ),
                  )
                      : const Icon(Icons.login),
                  label: const Text('Sign In'),
              ),
              const SizedBox(
                height: 65,
              ),
              const Text('New User? Create Account'),
              Padding( // this is new
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
              ),
            ],
          ),
        ),
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