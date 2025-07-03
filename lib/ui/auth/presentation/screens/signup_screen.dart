import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/shared/button/form_action_button.dart';
import 'package:imba/ui/shared/form/input_text_field.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final emailController = TextEditingController();
    final List<String> roles = ['Agent', 'Tenant'];
    final String selectedRole = 'Agent';
    final phoneController = TextEditingController();
    final verificationCodeController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 648),
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: InputTextField(
                            label: 'First Name',
                            controller: firstNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your first name";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: InputTextField(
                            label: 'Last Name',
                            controller: lastNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your last name";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    InputTextField(
                      label: 'Email',
                      controller: emailController,
                      prefixIcon: Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return "Please enter a valid email address";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: InputTextField(
                            controller: phoneController,
                            label: "Phone Number",
                            prefixIcon: Icon(Icons.phone),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your phone number";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          child: Text('Get Code'),
                          onPressed: () {
                            // Handle sending verification code
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Verification code sent!'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    InputTextField(
                      controller: verificationCodeController,
                      label: "Verification Code",
                      prefixIcon: Icon(Icons.security),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the verification code";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: selectedRole,
                      items:
                          roles
                              .map(
                                (role) => DropdownMenuItem(
                                  value: role,
                                  child: Text(role),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        // Handle role selection
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Selected role: $value')),
                        );
                      },
                      decoration: const InputDecoration(
                        labelText: "Role",
                        prefixIcon: Icon(Icons.group),
                      ),
                    ),
                    const SizedBox(height: 16),
                    InputTextField(
                      controller: passwordController,
                      isPassword: true,

                      label: "Password",
                      prefixIcon: const Icon(Icons.lock),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        if (value.length < 6) {
                          return "Password must be at least 6 characters long";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    InputTextField(
                      controller: confirmPasswordController,
                      isPassword: true,
                      label: "Confirm Password",
                      prefixIcon: const Icon(Icons.lock),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm your password";
                        }
                        if (value != passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    FormActionButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // Handle sign up logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Sign Up coming soon!'),
                            ),
                          );
                        }
                      },
                      label: 'Sign Up',
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Already have an account? Login"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
