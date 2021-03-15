import 'package:flutter/material.dart';
import 'package:tutellus_api_rest/util/respnsive.dart';
import 'package:tutellus_api_rest/widgets/input_text.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email = '', _password = '';
  _submit() {
    final bool isOk = _formKey.currentState.validate();
    if (isOk) {
      //aqui llamo a la API para mandar los datos _email y _password.
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
        bottom: 30,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: responsive.isTablet ? 430 : 360,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                InputText(
                  label: 'EMAIL ADDRESS',
                  onChanged: (text) {
                    _email = text;
                  },
                  validator: (text) {
                    if (!text.contains('@')) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                ),
                SizedBox(
                  height: responsive.dp(2),
                ),
                Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black12,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: InputText(
                            label: 'PASSWORD',
                            onChanged: (text) {
                              _password = text;
                            },
                            validator: (text) {
                              if (text.trim().length == 0) {
                                return 'Invalid password';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            borderEnabled: false,
                            fontSize:
                                responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: responsive
                                  .dp(responsive.isTablet ? 1.2 : 1.4),
                            ),
                          ),
                          onPressed: () {},
                        )
                      ],
                    )),
                SizedBox(
                  height: responsive.dp(5),
                ),
                SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    onPressed: this._submit,
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: responsive.dp(1.5),
                      ),
                    ),
                    color: Colors.pinkAccent,
                  ),
                ),
                SizedBox(
                  height: responsive.dp(2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New to Friendly Desi?',
                      style: TextStyle(
                        fontSize: responsive.dp(1.5),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Sign on',
                        style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: responsive.dp(1.5),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: responsive.dp(10),
                )
              ],
            ),
          ),
        ));
  }
}
