import 'package:e_commerce/widgets/customBtn.dart';
import 'package:e_commerce/widgets/custom_inputField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _registerFormLoading = false;

  // Default alert dialog for show errors
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(error),
          actions: [
            FlatButton(onPressed: () {
              Navigator.of(context).pop();
            },
              child: Text('close'),
          )
        ],
      );
    });
  }

  // create a new user account
  Future<String> _createAccount() async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerEmail, password: _registerPassword);
      return null;
    }on FirebaseAuthException catch(e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak';
      }else if(e.code == 'email-already-in-use') {
        return 'The account already exists for that email';
      }
      return e.message;
    }catch(e) {
      return e.toString();
    }
  }

  // submit register form for new account
  void _submitForm() async {
    // Set the form to Loading
    setState(() {
      _registerFormLoading = true;
    });

    // Run the create account and show alert dialog if null or error exists
    String _createAccountFeedback = await _createAccount();
    if (_createAccountFeedback != null) {
      _alertDialogBuilder(_createAccountFeedback);

      // Set the form to regular state [not loading]
      setState(() {
        _registerFormLoading = false;
      });
    }else{
      Navigator.of(context).pop();
    }
  }

  // Form input fields values
  String _registerEmail = '';
  String _registerPassword = '';

  // Focus node for input fields
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text('Create New Account',
                      textAlign: TextAlign.center,
                      style: Constants.boldHeading,),
                  ),
                  Column(
                      children: [
                        Container(
                            margin: EdgeInsets.all(30.0),
                            height: 150.0,
                            width: 150.0,
                            child: SvgPicture.asset('assets/login_image/login_background.svg')),
                        CustomInputField(
                          hintText: 'Username',
                          onChanged: (value) {
                            _registerEmail = value;
                          },
                          onSubmitted: (value) {
                            _passwordFocusNode.requestFocus();
                          },
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 10.0),
                        CustomInputField(
                          hintText: 'Password',
                          onChanged: (value) {
                            _registerPassword = value;
                          },
                          onSubmitted: (value) {
                            _submitForm();
                          },
                          focusNode: _passwordFocusNode,
                          isPasswordField: true,
                        ),
                        SizedBox(height: 20.0,),
                        CustomBtn(text: 'Register',
                          onPressed: () {
                            _submitForm();
                          },
                          outlineBtn: false,
                          isLoading: _registerFormLoading,
                        )
                      ]
                  ),
                  SizedBox(height: 30.0,),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50.0),
                    child: CustomBtn(text: 'Back to Login',
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      outlineBtn: true,
                    ),
                  ),
                ],
              ),
            ],
          ),

        )
    );
  }
}
