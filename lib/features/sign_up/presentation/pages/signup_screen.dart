// ignore_for_file: avoid_print, unused_field

import 'package:flutter/material.dart';
import 'package:practice_application/features/sign_up/domain/use_cases/register_user_domain.dart';
import 'package:practice_application/features/sign_up/presentation/widgets/constants/helpers.dart';
import 'package:practice_application/features/sign_up/presentation/widgets/custom_button_signup.dart';
import 'package:practice_application/features/sign_up/presentation/widgets/textfield_signup_widget.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  static const String routeName = "/signupscreen";
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Helpers _helpers = Helpers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 150,
                ),
                TextFieldSignupWidget(
                  controller: usernameController,
                  labelText: "Username",
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldSignupWidget(
                  controller: emailController,
                  labelText: "Email",
                  icon: Icons.email_rounded,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldSignupWidget(
                  controller: passwordController,
                  labelText: "Password",
                  icon: Icons.key_rounded,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButtonSignUp(
                    height: _helpers.getHeight(context) * 0.067,
                    width: _helpers.getWidth(context) * 0.5,
                    text: "Sign Up",
                    color: const Color.fromARGB(255, 245, 26, 11),
                    onTap: () async {
                      Map body = {
                        "email": emailController.text,
                        "password": passwordController.text
                      };
                      await RegisterUser().getUserRegister(body).then((value) {
                        usernameController.clear();
                        emailController.clear();
                        passwordController.clear();
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
