import 'package:adatative_layouts/button_widget.dart';
import 'package:adatative_layouts/core/config/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _borderLight = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(15));
  final _bordegreen = OutlineInputBorder(
      borderSide: const BorderSide(
        color: ColorConstants.green,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(15));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Form(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 110.0, vertical: 40),
                        child: Placeholder(
                          fallbackHeight: 120,
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 15, bottom: 25),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 28,
                              color: ColorConstants.black,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      Container(
                        margin: const EdgeInsets.only(left: 15, bottom: 15),
                        alignment: Alignment.centerLeft,
                        child: const Text('Email',
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorConstants.black,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: _userInput(),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        margin: const EdgeInsets.only(left: 15, bottom: 15),
                        alignment: Alignment.centerLeft,
                        child: const Text('Password',
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorConstants.green,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: _passwordInput(),
                      ),
                      GestureDetector(
                        onTap: () => {},
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 15, top: 15, bottom: 15),
                          alignment: Alignment.centerRight,
                          child: const Text('Forgot password ?',
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorConstants.green,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                      _signinButton(),
                      _footer()
                    ],
                  ))),
        ));
  }

  Widget _userInput() {
    return TextField(
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        // controller: bloc.usernameTextContoller,
        decoration: InputDecoration(
          // labelText: 'Email',
          // hintText: 'username',
          filled: true,
          border: _borderLight,
          enabledBorder: _borderLight,
          focusedBorder: _borderLight,
          // hintStyle: GoogleFonts.poppins(
          //     color: FactoryColors.purpleLight,
          // fontSize: 10),
          // suffixIcon:
          //     const Icon(Icons.person_outline, color: ColorConstants.green)),
        ));
  }

  Widget _passwordInput() {
    return TextField(
        // controller: bloc.passwordTextController,
        obscureText: true,
        // maxLength: 40,
        decoration: InputDecoration(
          // filled: true,
          border: _bordegreen,
          enabledBorder: _bordegreen,
          // hintStyle: GoogleFonts.poppins(
          //     color: FactoryColors.purpleLight, fontSize: 10),
          focusedBorder: _bordegreen,
          hintText: 'Password',
          suffixIcon: const Icon(Icons.remove_red_eye_outlined,
              color: ColorConstants.green),
        ));
  }

  /// Renders the sign in button
  Widget _signinButton() {
    // final bool enabled = (_verificationPhoneValid ?? false) &&
    //     (_verificationPasswordValid ?? false);

    // return (_inProgress && usingLocalBiometric)
    // ? Container(height: 60, child: LoadingWidget())
    // :
    return Container(
        // height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: PurpleButton(
            text: 'Login',
            onTap: () => {},
            padding: const EdgeInsets.all(25),
            spread: 7));
  }

  Widget _footer() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By continuing to use the application, you agree to the ',
        style: const TextStyle(color: ColorConstants.black),
        children: <TextSpan>[
          TextSpan(
              text: 'Terms of Use',
              style: const TextStyle(color: ColorConstants.green),
              recognizer: TapGestureRecognizer()..onTap = () {}),
          const TextSpan(text: ' and '),
          TextSpan(
              text: 'Privacy Policy',
              style: new TextStyle(color: ColorConstants.green),
              recognizer: new TapGestureRecognizer()
                ..onTap = () {
                  // launch(
                  //     'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                }),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }
}
