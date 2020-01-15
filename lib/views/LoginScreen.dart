// In This File, I am creating Login Screen Using Input fild and button.
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/Login_Validation.dart';


class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
  
class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  //`SaffoldState` is a state for a Scaffold.
  // Remember `Scaffold`is a class that implements the basic material design 
  //visual layout structure and derives from the `StatefulWidget`
  final scaffoldKey = GlobalKey<ScaffoldState>();

  //We have two private fields here 
  String email;
  // String password;
  

  // a private method `_submitCommand()`
  void submitCommand() {
    //get state of our Form
    final form = formKey.currentState;

    //`validate()` validates every FormField that is a descendant of this Form,
    // and returns true if there are no errors.
    if (form.validate()) {
      //`save()` Saves every FormField that is a descendant of this Form.
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      loginCommand();
    }
  }

   void loginCommand() {
    // Show login details in snackbar
    final snackbar = SnackBar(
      content: Text('Email: $email'),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Simple Login Validator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              new SizedBox(height: 50.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                hintText: 'Email',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
                validator: (val) => !EmailValidator.validate(val, true)
                    ? 'Please provide a valid email.'
                    : null,
                onSaved: (val) => email = val,
              ),
              // TextFormField(
              //   decoration: InputDecoration(labelText: 'Password'),
              //   validator: (val) =>
              //       val.length < 4 ? 'Your password is too Password too short..' : null,
              //   onSaved: (val) => password = val,
              //   obscureText: true,
              // ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                ),
                onPressed: submitCommand,
                color: Colors.lightBlueAccent,
                padding: EdgeInsets.all(12),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}