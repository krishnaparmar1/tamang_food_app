import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import for SharedPreferences
import 'package:tamang_food_app/Screens/appBar/custom_appbar.dart';
import 'package:tamang_food_app/Screens/auth/login_screen.dart';
import 'package:tamang_food_app/Screens/auth/signin_screen.dart';
import 'package:tamang_food_app/appColor/colors.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', _usernameController.text);
      await prefs.setString('email', _emailController.text);
      await prefs.setString('password', _passwordController.text);

      print("save name in sign up screen == ${_usernameController.text}");
      print("save name in sign up screen == ${_emailController.text}");
      print("save name in sign up screen == ${_passwordController.text}");

      Get.to(SignIn());
      // Navigator.pushReplacementNamed(context, '/login');
    }
  }

  String? name;
  String? email;
  String? password;
  bool _isEmailValid = false;
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _validateEmail(String value) {
    setState(() {
      _isEmailValid = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value);
    });
  }

  void _handleSignIn() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Handle sign in logic here, like making an API call to authenticate the user
      print('Name: $name');
      print('Email: $email');
      print('Password: $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Forgot Password'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Create Account',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: 'Enter your Name, Email and Password \nfor sign up.',
                    style: TextStyle(fontSize: 15, color: Colors.black45),
                  ),
                  WidgetSpan(
                    child: SizedBox(width: 10),
                  ),
                  TextSpan(
                    text: 'Already have account?',
                    style: TextStyle(fontSize: 15, color: AppColor.buttonColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(SignIn());
                      },
                  ),
                ]),
              ),
              SizedBox(height: 20),
              Text(
                'FULL NAME',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Please enter your Name',
                    suffixIcon: name != null
                        ? Icon(
                      Icons.check,
                      color: AppColor.buttonColor,
                    )
                        : null,
                  ),
                  onChanged: (value) {
                    setState(() {
                      name = value.isNotEmpty ? value : null;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  }),
              SizedBox(height: 20),
              Text(
                'EMAIL ADDRESS',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Please enter your email',
                  suffixIcon: _isEmailValid
                      ? Icon(
                    Icons.check,
                    color: Color(0xffEEA734),
                  )
                      : null,
                ),
                autofillHints: [AutofillHints.email],
                onChanged: _validateEmail,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value;
                },
              ),
              SizedBox(height: 20),
              Text(
                'PASSWORD',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ?
                      Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.black45,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                obscureText: _obscureText,
                autofillHints: [AutofillHints.password],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return 'Password must contain at least one uppercase letter';
                  }
                  if (!RegExp(r'[a-z]').hasMatch(value)) {
                    return 'Password must contain at least one lowercase letter';
                  }
                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Password must contain at least one digit';
                  }
                  if (!RegExp(r'[!@#%^&*(),.?":{}|<>]').hasMatch(value)) {
                    return 'Password must contain at least one special character';
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 300,
                  child: ElevatedButton(
                    onPressed:
                    _signUp, // Ensure the sign-up method is called here
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: AppColor.buttonColor,
                    ),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'By Signing up you agree to our Terms \nConditions & Privacy Policy.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Or',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.facebook,
                  ),
                  height: 40,
                  width: 300,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Icon(
                          Icons.facebook_outlined,
                          color: AppColor.facebook,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          'CONNECT WITH FACEBOOK',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 18),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.Google,
                  ),
                  height: 40,
                  width: 300,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        margin: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.asset('assets/icons/google.png',
                              fit: BoxFit.contain),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          'CONNECT WITH GOOGLE',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
