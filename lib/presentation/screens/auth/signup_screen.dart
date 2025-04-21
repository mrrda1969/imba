import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/core/providers/auth_provider.dart';
import 'package:imba/data/models/user.dart';
import 'package:imba/presentation/widgets/form/dropdown_form_field.dart';
import 'package:imba/presentation/widgets/form/input_text_field.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _verificationCodeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  var _selectedRole = UserRole.landlord;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _verificationCodeController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility(String? _) {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility(String? _) {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  Future<void> _getVerificationCode() async {
    // TODO: Implement verification code logic
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Verification code sent!')));
  }

  Future<void> _signup() async {
    if (!_formKey.currentState!.validate()) return;

    await ref
        .read(authProvider.notifier)
        .signup(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          phone: _phoneController.text,
          role: _selectedRole,
        );

    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 648),
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: InputTextField(
                            label: 'First Name',
                            controller: _firstNameController,
                            keyboardType: TextInputType.name,
                            validator:
                                (value) =>
                                    value?.isEmpty == true ? 'Required' : null,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: InputTextField(
                            controller: _lastNameController,
                            label: 'Last Name',
                            keyboardType: TextInputType.name,
                            filled: true,
                            validator:
                                (value) =>
                                    value?.isEmpty == true ? 'Required' : null,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    InputTextField(
                      label: 'Email',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                      filled: true,
                      validator: (value) {
                        if (value?.isEmpty == true) return 'Required';
                        if (!value!.contains('@')) return 'Invalid email';
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    InputTextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      label: 'Phone Number',
                      prefixIcon: const Icon(Icons.phone_outlined),
                      filled: true,
                      validator:
                          (value) => value?.isEmpty == true ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: InputTextField(
                            controller: _verificationCodeController,
                            label: 'Verification Code',
                            prefixIcon: Icon(Icons.security),
                            filled: true,
                            validator:
                                (value) =>
                                    value?.isEmpty == true ? 'Required' : null,
                          ),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: _getVerificationCode,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                          ),
                          child: const Text('Get Code'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    DropdownFormField(
                      label: 'Role',
                      items:
                          UserRole.values
                              .map((role) => role.name)
                              .toList(), // Convert to List<String>
                      value:
                          _selectedRole
                              .name, // Use the name property for the selected value
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selectedRole = UserRole.values.firstWhere(
                              (role) => role.name == value,
                            );
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    InputTextField(
                      controller: _passwordController,
                      isPassword: _obscurePassword,
                      label: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onButtonPressed: _togglePasswordVisibility,
                      filled: true,
                      validator: (value) {
                        if (value?.isEmpty == true) return 'Required';
                        if (value!.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    InputTextField(
                      controller: _confirmPasswordController,
                      isPassword: _obscureConfirmPassword,
                      label: 'Confirm Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onButtonPressed: _toggleConfirmPasswordVisibility,

                      filled: true,
                      validator: (value) {
                        if (value?.isEmpty == true) return 'Required';
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: _signup,
                      style: Theme.of(context).elevatedButtonTheme.style,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Already have an account? Login',
                        style: TextStyle(color: Colors.purple, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // padding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}
