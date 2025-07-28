import 'package:flutter/material.dart';
import 'package:project/diohelper/diohelper.dart';
import 'package:project/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:project/reusableWidget/textformfield.dart';
import 'forgetpassword.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool isLoading = false;

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      try {
        await DioHelper().login(
          username: usernameController.text.trim(),
          password: passwordController.text.trim(),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => BottomNavBar()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString().replaceAll("Exception: ", "")),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.canPop(context) ? BackButton(color: Colors.black) : null,
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
                Center(child: Text("Welcome Back!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500))),
                SizedBox(height: 8),
                Center(child: Text("Log in to continue", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300))),
                SizedBox(height: 50),

                Text("Username", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                SizedBox(height: 10),
                customTextFormField(
                  label: "Enter your username",
                  prefixIcon: Icons.person,
                  controller: usernameController,
                  validator: (value) => value == null || value.isEmpty ? 'Please enter your username' : null,
                ),

                SizedBox(height: 20),
                Text("Password", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                customTextFormField(
                  label: "Enter your password",
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                  validator: (value) => value == null || value.isEmpty ? 'Please enter your password' : null,
                ),

                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ForgetPasswordPage())),
                  child: Text("Forgot Password?", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
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
                      onPressed: isLoading ? null : _handleLogin,
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text("Login", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
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
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Signup())),
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
