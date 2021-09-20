import 'dart:developer';

import 'package:clean/features/authentication/presentation/widgets/common/neo_white_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/bloc.dart';
import '../../widgets/common/neo_textfield.dart';
import '../../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  String? email, password;

  final _formKey = GlobalKey<FormState>();

  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: BlocProvider<AuthBloc>(
        create: (context) => sl<AuthBloc>(),
        child: Padding(
          padding: const EdgeInsets.all(33),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 25,
                child: Center(
                  child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                    if (state is AuthLoginLoaded)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Welcome to NeoSTORE ${state.user.firstName!}'),
                        ),
                      );
                    else if (state is AuthLoginError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  }, builder: (context, state) {
                    if (state is AuthLoginLoading) {
                      return LoadingWidget();
                    } else {
                      return Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'NeoSTORE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 49,
                              ),
                              NeoTextField(
                                hint: 'Username',
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                validatorFn: (val) {
                                  if (val != null && val.isEmpty) {
                                    return 'Please enter something!';
                                  }
                                },
                                onSavedFn: (val) {
                                  email = val!;
                                },
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              NeoTextField(
                                hint: 'Password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                validatorFn: (val) {
                                  if (val != null && val.isEmpty) {
                                    return 'Please enter something!';
                                  }
                                },
                                onSavedFn: (val) {
                                  password = val!;
                                },
                              ),
                              SizedBox(
                                height: 33,
                              ),
                              NeoWhiteBtn(
                                text: 'Login',
                                onPressed: () async {
                                  var validated =
                                      _formKey.currentState?.validate();
                                  if (validated!) {
                                    _formKey.currentState!.save();
                                    context
                                        .read<AuthBloc>()
                                        .add(LoginRequested(email!, password!));
                                  }
                                },
                              ),
                              SizedBox(
                                height: 22,
                              ),
                              Text('Forgot Password?'.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  )),
                            ],
                          ),
                        ),
                      );
                    }
                  }),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('DO NOT HAVE AN ACCOUNT?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 36,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Color(0xff9e0100).withOpacity(0.7),
      ),
      body: buildBody(context),
    );
  }
}
