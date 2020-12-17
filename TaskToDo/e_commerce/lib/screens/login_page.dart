import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/register_page.dart';
import 'package:e_commerce/widgets/customBtn.dart';
import 'package:e_commerce/widgets/custom_inputField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // login form loading
  bool _loginFormLoading = false;

  //Default alert dialog for show errors
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context) {
         return AlertDialog(
          title: Text('Error'),
          content: Text(error),
          actions: [
            FlatButton(
              child: Text('close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
        ],
      );
    });
  }

  // Login account
  Future<String> _loginAccount() async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginEmail, password: _loginPassword);
      return null;
    }on FirebaseAuthException catch(e) {
      if (e.code == 'weak_password') {
        return 'The password provided is too weak';
      }else if(e.code == 'email-already-in-use') {
        return 'The account already exists for that email';
      }
      return e.message;
    }catch (e) {
      return e.toString();
    }
  }

  // submit login form
  void _submitForm() async {
    // set the form to loading state
    setState(() {
      _loginFormLoading = true;
    });

    // run the loginAccount and show alertDialog if error found
    String _loginAccountFeedback = await _loginAccount();
    if (_loginAccountFeedback != null) {
      _alertDialogBuilder(_loginAccountFeedback);

      //set the form to regular state [not loading]
      setState(() {
        _loginFormLoading = false;
      });
    }

  }

  // Form input fields values
  String _loginEmail = '';
  String _loginPassword = '';

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Hello, ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 24.0
                        ),),
                      Text('Login to your account',
                        style:  TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30.0),
                    height: 150.0,
                    width: 150.0,
                    child: SvgPicture.asset('assets/login_image/login_background.svg')),

                CustomInputField(hintText: 'Username',
                  onChanged: (value) {
                    _loginEmail = value;
                  },
                  onSubmitted: (value) {
                    _passwordFocusNode.requestFocus();
                  },
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 10.0,),
                CustomInputField(hintText: 'Password',
                  onChanged: (value) {
                    _loginPassword = value;
                  },
                  onSubmitted: (value) {
                    _submitForm();
                  },
                  focusNode: _passwordFocusNode,
                  isPasswordField: true,
                ),
                SizedBox(height: 10.0,),
                CustomBtn(text: 'Login',
                  onPressed: () {
                    _submitForm();
                  },
                  outlineBtn: false,
                  isLoading: _loginFormLoading,
                ),
                CustomBtn(text: 'Sign in with Google',
                  onPressed: () {},
                  outlineBtn: false,
                  isLoading: false,
                ),
                SizedBox(height: 25.0,),
                CustomBtn(text: 'Create New Account',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => RegisterPage()
                    ));
                  },
                  outlineBtn: true,
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
