
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wisatacandi/screens/home_screen.dart';

class Signinscreen extends StatefulWidget {
  Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';

  bool isSignedIn = false;

  bool _obscurePassword = true;

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Sign In'),),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                  ),
                ),
                TextFormField(controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  errorText: _errorText.isNotEmpty ? _errorText : null,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        _obscurePassword =!_obscurePassword;
                      });
                    }, 
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  obscureText: _obscurePassword,
                ),
                SizedBox(height: 28),
                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text('Sign In'
                  ),
                ),
                SizedBox(height: 10),
                // TextButton(onPressed: (){},
                // child: Text('Belum Punya Akun ? Daftar Disini'
                //   ),
                // ),
                RichText(text: TextSpan(
                  text: 'Belum Punya Akun?',
                  style: TextStyle(fontSize: 16,color: Colors.indigo[400]),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Daftar Disini !',
                      style: TextStyle(fontSize: 16,
                      color: Colors.cyan[200],
                      decoration: TextDecoration.underline
                       ),  
                      recognizer: TapGestureRecognizer()
                      ),
                   ],
                  ),
               )
            
              ],
             ),
            ),
          ),
        ),
      )
    );
  }
}