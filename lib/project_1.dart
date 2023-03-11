import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  String? emailAdress;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: [
              SizedBox(
              height: 50,
            ),
              Center(
                  child: Image.asset(
                'asset/images/mosh.jpg',
                width: 50,
                height: 30,
              )),
              SizedBox(
                height: 20),
              Text(
                'اهلا بك',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Container( alignment: Alignment.bottomRight,
                child: Text(
                  'اسم المستخدم',
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    labelText: ('ادخل اسم المستخدم'),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {
                      emailAdress = value;
                    });
                    print(emailAdress);
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(alignment: Alignment.bottomRight,
                child: Text(
                  'كلمه المرور',
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    labelText: ('ادخل كلمه المرور'),
                    border:OutlineInputBorder(),
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                    print(password);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(onPressed: () {
                  },
                     child: Text('نسيت كلمه المرور؟')
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    print(emailcontroller.text);
                    print(passwordcontroller.text);
                  },
                  child: Text(
                    'تسجيل دخول',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
