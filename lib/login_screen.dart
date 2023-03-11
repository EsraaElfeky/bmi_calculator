import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller = TextEditingController();

  var passwordcontroller = TextEditingController();

  String? EmailAddress;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(
                labelText: ('Email Address'),
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value) {
                setState(() {
                  EmailAddress = value;
                });
                print(value);
              },
              onChanged: (String value) {
                print(value);
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                labelText: ('Password'),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onFieldSubmitted: (value) {
                setState(() {
                  password = value;
                });
                {
                  print(value);
                }
                ;
                onChanged:
                (String value) {
                  print(value);
                };
             },
            ),
            SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              color: Colors.purple,
              child: MaterialButton(
                onPressed: () {
                  print(emailcontroller.text);
                  print(passwordcontroller.text);},
                child: Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don/t have an account'),
                TextButton(onPressed: () {}, child: Text('Register Now'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
