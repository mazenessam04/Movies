import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0f0f0f),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const SizedBox(height: 20),

              /// ---------- HEADER IMAGES ----------
              SizedBox(
                height: 220,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // left small
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Transform.scale(
                        scale: 0.75,
                        child: Image.asset(
                          "assets/images/gamer (1) (1).png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // right small
                    Align(
                      alignment: Alignment.centerRight,
                      child: Transform.scale(
                        scale: 0.75,
                        child: Image.asset(
                          "assets/images/gamer (1) (2).png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // center big
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/gamer (1).png",
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: Text(
                  "Create Account",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// ---------- NAME ----------
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name can't be empty";
                  }
                  if (value.trim().length < 3) {
                    return "Name must be at least 3 chars";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white10,
                  prefixIcon:
                  const Icon(Icons.person, color: Colors.white70),
                  hintText: "Full Name",
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),

              const SizedBox(height: 22),

              /// ---------- EMAIL ----------
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email can't be empty";
                  }
                  if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                      .hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white10,
                  prefixIcon:
                  const Icon(Icons.email, color: Colors.white70),
                  hintText: "Email",
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),

              const SizedBox(height: 22),

              /// ---------- PASSWORD ----------
              TextFormField(
                controller: passwordController,
                obscureText: !passwordVisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password can't be empty";
                  }
                  if (!RegExp(
                    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)'
                    r'(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                  ).hasMatch(value)) {
                    return "Use strong password (Aa1@... min 8 chars)";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white10,
                  prefixIcon:
                  const Icon(Icons.lock, color: Colors.white70),
                  hintText: "Password",
                  hintStyle: const TextStyle(color: Colors.white54),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    child: Icon(
                      passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white70,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),

              const SizedBox(height: 22),

              /// ---------- CONFIRM PASSWORD ----------
              TextFormField(
                controller: confirmPasswordController,
                obscureText: !confirmPasswordVisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Confirm password can't be empty";
                  }
                  if (value != passwordController.text) {
                    return "Passwords don't match";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white10,
                  prefixIcon:
                  const Icon(Icons.lock_outline, color: Colors.white70),
                  hintText: "Confirm Password",
                  hintStyle: const TextStyle(color: Colors.white54),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        confirmPasswordVisible = !confirmPasswordVisible;
                      });
                    },
                    child: Icon(
                      confirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white70,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),

              const SizedBox(height: 28),

              /// ---------- CREATE ACCOUNT BUTTON ----------
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // UI  - لسه هنوصل بالـ ViewModel بعدين
                    if (formKey.currentState!.validate()) {
                      // TODO: call viewModel.register()
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              /// ---------- ALREADY HAVE ACCOUNT ----------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white70),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigator.pop() أو goToLogin()
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}