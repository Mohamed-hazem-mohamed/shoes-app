import 'package:flutter/material.dart';
import 'package:project/home/home.dart';
import 'package:project/login_signup/signup.dart';
import 'package:project/reusableWidget/textformfield.dart';

import 'forgetpassword.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.canPop(context)
            ? BackButton(color: Colors.black)
            : null,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Log in to continue",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(height: 50),
                Text("Email Address", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                SizedBox(height: 10),
                customTextFormField(
                  label: "Enter your email",
                  prefixIcon: Icons.email,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter your email';
                    if (!value.contains('@')) return 'Enter a valid email';
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text("Password", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                customTextFormField(
                  label: "Enter your password",
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter your password';
                    if (value.length < 6) return 'Password must be at least 6 characters';
                    return null;
                  },
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ForgetPasswordPage()));
                  },
                  child: Text("Forgot Password?",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
                ),
                SizedBox(height: 40),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 58,
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Home())
                          );
                        }
                      },
                      child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("Assets/google.png", width: 24, height: 24),
                    SizedBox(width: 10),
                    Text("Log in with Google", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => Signup()));
                      },
                      child: Text("Sign up for free", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
