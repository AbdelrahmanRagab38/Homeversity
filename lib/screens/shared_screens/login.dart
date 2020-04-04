import 'package:fcaihu/constants/constants.dart';
import 'package:fcaihu/screens/shared_screens/signup.dart';
import 'package:fcaihu/services/auth_service.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';

//animation names
class AnimationNames {
  static final String pause = 'static';
  static final String email = 'email';
  static final String password = 'password';
  static final String logoOut = 'logo_out';
  static final String logoIn = 'logo_in';
}

class LoginScreen extends StatefulWidget {
  static final String id = 'loginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form controller key
  final _formKey = GlobalKey<FormState>();

  //text field controllers
  FocusNode emailNode = FocusNode();
  FocusNode passNode = FocusNode();

  //animation controller
  final FlareControls _controls = FlareControls();

  //animation detector
  bool isAnimating = false;

  //user email & password
  String _email;
  String _password;

  //selecting animation
  String animationName = AnimationNames.logoIn;

  //sign in with user email and password
  _submit(BuildContext context) {
    //check if the form filled correctly
    if (_formKey.currentState.validate()) {
      //saving the entered data into variables
      _formKey.currentState.save();
    }

    //login with auth services
    return AuthService.login(
        email: _email, password: _password, context: context);
  }

  @override
  void initState() {
    emailNode.addListener(() async {
      if (emailNode.hasFocus) {
        if (!isAnimating) {
          isAnimating = true;
          setState(() {
            animationName = AnimationNames.email;
          });
        }
      }
    });
    passNode.addListener(() {
      if (passNode.hasFocus) {
        if (!isAnimating) {
          isAnimating = true;
          setState(() {
            animationName = AnimationNames.password;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    emailNode.dispose();
    passNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsScheme.grey,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [ColorsScheme.brightPurple, ColorsScheme.midPurple]),
          ),
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 300,
                    height: 150,
                    child: FlareActor(
                      'assets/sign_In_animation.flr',
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      animation: animationName,
                      callback: (name) {
                        setState(() {
                          isAnimating = false;
                          animationName = AnimationNames.logoIn;
                        });
                      },
                      controller: _controls,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                          child: TextFormField(
                            focusNode: emailNode,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              prefixIcon: Icon(
                                Icons.mail_outline,
                                color: ColorsScheme.purple,
                              ),
                              filled: true,
                              fillColor: ColorsScheme.brightPurple,
                            ),
                            textDirection: TextDirection.ltr,
                            validator: (input) => !input.contains('@')
                                ? 'Please enter valid email'
                                : null,
                            onSaved: (input) =>
                                _email = input.trim().toString(),
                          ),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                          child: TextFormField(
                            focusNode: passNode,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: ColorsScheme.purple,
                              ),
                              filled: true,
                              fillColor: ColorsScheme.brightPurple,
                            ),
                            validator: (input) => input.trim().length < 6
                                ? 'Password must be more than 6 characters'
                                : null,
                            onSaved: (input) => _password = input,
                            obscureText: true,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, SignupScreen.id);
                          },
                          child: Text(
                            'Create a new Account',
                            style: TextStyle(
                              color: ColorsScheme.purple,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FlatButton(
                          onPressed: () async {
                            String result = await _submit(context);
                            if (result != null) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) => Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          height: 200.0,
                                          width: 300.0,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0),
                                                child: Text(
                                                  'Error',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  result,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          ColorsScheme.purple,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: FlatButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('Cancel'),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: FlatButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        Navigator
                                                            .pushReplacementNamed(
                                                                context,
                                                                SignupScreen
                                                                    .id);
                                                      },
                                                      child: Text('SignUp'),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ));
                            } else {
                              Navigator.pop(context);
                            }
                          },
                          color: ColorsScheme.purple,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40.0,
                              vertical: 15,
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Color(0xfff2f2f2),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
