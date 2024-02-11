import 'package:chatappv1/modules/login_screen.dart';
import 'package:chatappv1/shared/components/components/my_main_components.dart';
import 'package:chatappv1/shared/cubit/register_cubit/cubit.dart';
import 'package:chatappv1/shared/cubit/register_cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) async {
          if (state is RegisterErrorState) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }
          if (state is UserCreationErrorState) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: cubit.formRegisterKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        Text(
                          'Register now to browse our hot offers',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: cubit.nameRegisterController,
                          type: TextInputType.name,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your name';
                            }
                          },
                          label: 'User Name',
                          prefix: Icons.person,
                          onSubmit: (value) {
                            if (cubit.formRegisterKey.currentState!
                                .validate()) {}
                            return value;
                          },
                          onChange: (v) {
                            return v;
                          },
                          onTap: () {},
                          context: context,
                        ),
                       const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          onSubmit: (value) {
                            if (cubit.formRegisterKey.currentState!
                                .validate()) {}
                            return value;
                          },
                          onChange: (v) {
                            return v;
                          },
                          onTap: () {},
                          context: context,
                          controller: cubit.emailRegisterController,
                          type: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                       const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          onSubmit: (value) {
                            if (cubit.formRegisterKey.currentState!
                                .validate()) {}
                            return value;
                          },
                          onChange: (v) {
                            return v;
                          },
                          onTap: () {},
                          context: context,
                          controller: cubit.passwordRegisterController,
                          type: TextInputType.visiblePassword,
                          suffix: RegisterCubit.get(context).suffix,
                          isPassword: RegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                            RegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          onSubmit: (value) {
                            if (cubit.formRegisterKey.currentState!
                                .validate()) {}
                            return value;
                          },
                          onChange: (v) {
                            return v;
                          },
                          onTap: () {},
                          context: context,
                          controller: cubit.phoneRegisterController,
                          type: TextInputType.number,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your phone number';
                            }
                          },
                          label: 'Phone',
                          prefix: Icons.phone,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: (state is! RegisterLoadingState),
                          builder: (context) => defaultButton(
                            function: () {
                              if (cubit.formRegisterKey.currentState!
                                  .validate()) {
                                RegisterCubit.get(context).userRegister(
                                  name: cubit.nameRegisterController.text,
                                  email: cubit.emailRegisterController.text,
                                  password:
                                      cubit.passwordRegisterController.text,
                                  phone: cubit.phoneRegisterController.text,
                                  context: context,
                                );
                              }
                            },
                            text: 'register',
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
                              'already have an account?',
                            ),
                            defaultTextButton(
                              function: () {
                                navigateAndFinish(
                                  context,
                                  const LoginScreen(),
                                );
                                return;
                              },
                              text: 'login',
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
