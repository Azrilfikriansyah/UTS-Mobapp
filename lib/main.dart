import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('lib/asset/azril.jpg', width: 200, height: 200),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
              },
              child: Text('Forgot Password'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: Text('Sign Up'),
            ),
            ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;
                if (password == "4083") {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => BiodataPage(username)));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Password salah!'),
                  ));
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();

  bool isPasswordMatch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextField(
              controller: confirmedPasswordController,
              decoration: InputDecoration(labelText: 'Confirmed Password'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back),
            ),
            ElevatedButton(
              onPressed: () {
                String password = passwordController.text;
                String confirmedPassword = confirmedPasswordController.text;
                if (password == confirmedPassword) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                } else {
                  setState(() {
                    isPasswordMatch = false;
                  });
                }
              },
              child: Text('Submit'),
            ),
            if (!isPasswordMatch)
              Text(
                'Password and Confirm Password not match!',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();

  bool isPasswordMatch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: nimController,
              decoration: InputDecoration(labelText: 'NIM'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextField(
              controller: confirmedPasswordController,
              decoration: InputDecoration(labelText: 'Confirmed Password'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back),
            ),
            ElevatedButton(
              onPressed: () {
                String password = passwordController.text;
                String confirmedPassword = confirmedPasswordController.text;
                if (password == confirmedPassword) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                } else {
                  setState(() {
                    isPasswordMatch = false;
                  });
                }
              },
              child: Text('Submit'),
            ),
            if (!isPasswordMatch)
              Text(
                'Password and Confirm Password not match!',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}

class BiodataPage extends StatelessWidget {
  final String username;

  BiodataPage(this.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Biodata Page')),
      body: Center(
        child: Column(
          children: [
            Text('Username: $username'),
            Text('NIM: 1101204083'), 
            Text('Email: fkrazril@gmail.com'),
            Image.asset('lib/asset/azril.jpg', width: 160, height: 160), 
            Container(
              color: Colors.red, 
              height: 100, 
              width: double.infinity, 
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalculatorPage()));
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}


class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String out_angka = '0';
  double num1 = 0;
  double num2 = 0;
  String out = '';

  void button(String x) {
    setState(() {
      if (x == '7') {
        out_angka = "7";
      } else if (x == '8') {
        out_angka = "8";
      } else if (x == '9') {
        out_angka = "9";
      } else if (x == '4') {
        out_angka = "4";
      } else if (x == '5') {
        out_angka = "5";
      } else if (x == '6') {
        out_angka = "6";
      } else if (x == '1') {
        out_angka = "1";
      } else if (x == '2') {
        out_angka = "2";
      } else if (x == '3') {
        out_angka = "3";
      } else if (x == 'C') {
        out_angka = "0";
      } else if (x == 'x') {
        num1 = double.parse(out_angka);
        out = x;
      } else if (x == '-') {
        num1 = double.parse(out_angka);
        out = x;
      } else if (x == '+') {
        num1 = double.parse(out_angka);
        out = x;
      } else if (x == '÷') {
        num1 = double.parse(out_angka);
        out = x;
      } else if (x == '=') {
        num2 = double.parse(out_angka);
        if (out == '+') {
          out_angka = (num1 + num2).toString();
        } else if (out == '-') {
          out_angka = (num1 - num2).toString();
        } else if (out == 'x') {
          out_angka = (num1 * num2).toString();
        } else if (out == '÷') {
          out_angka = (num1 / num2).toString();
        }
      }
    });
  }
  

  Widget tombol(String x, Color y) {
    return SizedBox(
      width: 95,
      height: 90,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: y),
        onPressed: () => button(x),
        child: Text(x, style: TextStyle(fontSize: 60)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator Page')),
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Text(
                out_angka,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      tombol("7", Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                      tombol("8", Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                      tombol("9", Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                      tombol("x", Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      tombol("4", Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                      tombol("5", Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                      tombol("6", Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                      tombol("-", Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      tombol("1", Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                      tombol("2", Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                      tombol("3", Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                      tombol("+", Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      tombol("C", Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                      tombol("0", Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                      tombol("=", Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                      tombol("÷", Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                    ],
                  ),
                  SizedBox(
                    width: 500,
                    height: 50,
                    child: Text(
                      "Azril_1101204083",
                      style: TextStyle(fontSize: 40, backgroundColor: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BiodataPage(out_angka)));
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
