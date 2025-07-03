import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/auth/presentation/providers/auth_providers.dart';
import 'package:imba/ui/shared/button/form_action_button.dart';
import 'package:imba/ui/shared/form/input_text_field.dart';
import 'package:imba/ui/auth/presentation/widgets/wave_clipper.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Method to handle the login process
  Future<void> _login() async {
    // Validate the form fields
    if (_formKey.currentState!.validate()) {
      // Dismiss the keyboard
      FocusScope.of(context).unfocus();

      final email = _emailController.text;
      final password = _passwordController.text;

      // Call the login method from the AuthNotifier
      await ref.read(authProvider.notifier).login(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch the authentication state for UI updates
    final authState = ref.watch(authProvider);

    // Listen for changes in the authentication state for side effects like navigation or error display
    ref.listen<AuthState>(authProvider, (previous, next) {
      // If there's a new error, display a SnackBar
      if (next.error != null && next.error != previous?.error) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.error!)));
        // Clear the error after displaying it to prevent showing it again on rebuilds
        ref.read(authProvider.notifier).clearError();
      }
      // If authentication becomes true, navigate to the home screen
      // Make sure 'previous' is not null and 'isAuthenticated' has changed from false to true
      if (next.isAuthenticated &&
          (previous == null || !previous.isAuthenticated)) {
        // Replace the current route with the home route
        // Assuming '/home' is the route name for your main application screen
        Navigator.of(context).pushReplacementNamed('/');
      }
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: WaveClipper(),
                    child: Image.asset(
                      'assets/images/clipper.png',
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 24.0),
                      InputTextField(
                        controller: _emailController,
                        label: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      InputTextField(
                        controller: _passwordController,
                        label: 'Password',
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      FormActionButton(
                        label: 'Login',
                        isLoading: authState.isLoading,
                        onPressed:
                            _login, // Assign the _login method to the onPressed callback
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?'),
                          TextButton(
                            child: const Text('Sign up now!'),
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
