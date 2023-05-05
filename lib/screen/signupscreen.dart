import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zest/screen/widget/textfieldwidget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _familyNameController = TextEditingController();
  final TextEditingController _givenNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  void _onSubmit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      setState(() => _isLoading = true);
      Future.delayed(
        const Duration(seconds: 2),
            () => setState(() => {
          _isLoading = false,
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
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const Text("Sign Up", style: TextStyle(color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 40),
                            TextFieldWidget(
                              icon: Icons.person,
                              isLoading: _isLoading,
                              textEditingController: _familyNameController,
                              textInputType: TextInputType.text,
                              hintText: 'Family Name',
                              isEmptyText: 'Please enter your family name',
                              invalidText: 'Please enter a valid family name',
                              isNumericOrAlphabet: false,
                            ),
                            const SizedBox(height: 15),
                            TextFieldWidget(
                              icon: Icons.person_2,
                              isLoading: _isLoading,
                              textEditingController: _givenNameController,
                              textInputType: TextInputType.text,
                              hintText: 'Given Name',
                              isEmptyText: 'Please enter your given name',
                              invalidText: 'Please enter a valid given name',
                              isNumericOrAlphabet: false,
                            ),
                            const SizedBox(height: 15),
                            TextFieldWidget(
                              icon: Icons.phone_iphone,
                              isLoading: _isLoading,
                              textEditingController: _phoneController,
                              textInputType: TextInputType.phone,
                              hintText: 'Phone Number',
                              isEmptyText: 'Please enter your phone number',
                              invalidText: 'Please enter a valid phone number',
                              isNumericOrAlphabet: true,
                            ),
                            const SizedBox(height: 15),
                            TextFieldWidget(
                              icon: Icons.alternate_email,
                              isLoading: _isLoading,
                              textEditingController: _emailController,
                              textInputType: TextInputType.emailAddress,
                              hintText: 'Email Address',
                              isEmptyText: 'Please enter your email address',
                              invalidText: 'Please enter a valid email address',
                              isNumericOrAlphabet: false,
                            ),
                            const SizedBox(height: 25),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(text: 'By signing up, you agree to our '),
                                  TextSpan(
                                    text: 'Terms & Conditions',
                                    style: const TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        await launchUrl(Uri.parse('https://www.apple.com'));
                                      }
                                  ),
                                  const TextSpan(text: ' and '),
                                  TextSpan(
                                    text: 'Privacy Policy.',
                                    style: const TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        await launchUrl(Uri.parse('https://www.youtube.com'));
                                      }
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 25),
                            ElevatedButton.icon(
                              onPressed: _isLoading ? null : _onSubmit,
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(const Size(350, 50)),
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
                                  : const Icon(Icons.arrow_forward, color: Colors.white),
                              label: const Text('Continue', style: TextStyle(color: Colors.white, fontSize: 25)),
                            ),
                            Padding( // this is new
                                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40.0, // Adjust this value to position the button
              left: 10.0, // Adjust this value to position the button
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        )
    );
  }
}
