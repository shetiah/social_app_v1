import 'package:chatappv1/layout/home_layout.dart';
import 'package:chatappv1/modules/register_screen.dart';
import 'package:chatappv1/shared/components/components/my_main_components.dart';
import 'package:chatappv1/shared/cubit/login_cubit/cubit.dart';
import 'package:chatappv1/shared/cubit/login_cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }
        },
        builder: (BuildContext context, LoginStates state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: cubit.formLoginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: cubit.emailLoginController,
                          type: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                          context: context,
                          onSubmit: (value) async {
                            if (cubit.formLoginKey.currentState!.validate()) {
                              // await cubit.userLogin(
                              //   email: cubit.emailLoginController.text,
                              //   password: cubit.passwordLoginController.text,
                              // );
                            }
                            return value;
                          },
                          onChange: (value) {
                            return value;
                          },
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          suffixPressed: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                          controller: cubit.passwordLoginController,
                          type: TextInputType.visiblePassword,
                          suffix: cubit.suffix,
                          onSubmit: (value) async {
                            if (cubit.formLoginKey.currentState!.validate()) {
                              // await cubit.userLogin(
                              //   context: context,
                              //   email: cubit.emailLoginController.text,
                              //   password: cubit.passwordLoginController.text,
                              // );
                            }
                            return value;
                          },
                          isPassword: cubit.isPassword,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                          context: context,
                          onChange: (value) {
                            return value;
                          },
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: (state is! LoginLoadingState),
                          builder: (context) => defaultButton(
                            function: () async {
                              if (cubit.formLoginKey.currentState!.validate()) {
                                await cubit.userLogin(
                                  context: context,
                                  email: cubit.emailLoginController.text,
                                  password: cubit.passwordLoginController.text,
                                );

                              }
                            },
                            text: 'login',
                            isUpperCase: true,
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                            ),
                            defaultTextButton(
                              function: () {
                                navigateAndFinish(
                                  context,
                                  const RegisterScreen(),
                                );
                                return;
                              },
                              text: 'register',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
