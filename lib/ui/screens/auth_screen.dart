import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repositories/auth_repository.dart';
import 'package:flutter_application_1/ui/screens/home_screen.dart';
import 'package:flutter_application_1/ui/widgets/my_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? errorEmail;
  String? errorPassword;
  String? error;

  final AuthRepository _authRepository = AuthRepository();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        errorEmail = null;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        errorPassword = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Добро пожаловать в приложение",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SizedBox(height: 80),
            MyTextField(
              controller: _emailController,
              labelText: "Почта",
              errorText: errorEmail,
            ),
            SizedBox(height: 20),
            MyTextField(
              controller: _passwordController,
              labelText: "Пароль",
              obscureText: true,
              errorText: errorPassword,
            ),
            if (error != null) ...[
              SizedBox(height: 40),
              Text(
                error ?? "",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onLoginPressed,
              child: Text(
                "Войти",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lime.shade600,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onLoginPressed() {
    final email = _emailController.text;
    final password = _passwordController.text;

    setState(() {
      errorEmail = null;
      errorPassword = null;
      error = null;
    });

    if (email.isEmpty) {
      setState(() {
        errorEmail = "Введите почту";
      });
      return;
    }
    if (password.isEmpty) {
      setState(() {
        errorPassword = "Введите пароль";
      });
      return;
    }

    final user = _authRepository.login(email, password);
    if (user != null) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      setState(() {
        error = "Неверная почта или пароль";
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
