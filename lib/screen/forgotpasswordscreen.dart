import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
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
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const Text("Forgot Password?", style: TextStyle(color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        const Text("Don't worry! We can help. Please enter the phone number or email address associated with your account below.", style: TextStyle(color: Colors.grey, fontSize: 20)),
                        const SizedBox(height: 55),
                        TextFormField(
                          enabled: !_isLoading,
                          controller: _phoneController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            labelText: 'Phone Number/Email Address',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your phone number or email address";
                            }
                            if (isPhoneOrEmail(value) == 0) {
                              return "Please enter a valid phone number or email address";
                            }
                            return null;
                          },
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
                              : const Icon(Icons.check, color: Colors.white),
                          label: const Text('Submit', style: TextStyle(color: Colors.white, fontSize: 25)),
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

int isPhoneOrEmail(String input) {
  // Check if input is a phone number
  RegExp phoneRegex = RegExp(r'^\d{10}$');
  if (phoneRegex.hasMatch(input)) {
    return 1;
  }

  // Check if input is an email address
  RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (emailRegex.hasMatch(input)) {
    return 1;
  }

  return 0;
}