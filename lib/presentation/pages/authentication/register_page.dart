import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/bloc.dart';
import '../../widgets/common/neo_textfield.dart';
import '../../widgets/common/neo_white_btn.dart';
import '../../widgets/widgets.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  final genderNotifier = ValueNotifier<GenderTypes>(GenderTypes.Male);
  String? email, password, phoneNo, gender, firsName, lastName;

  final _formKey = GlobalKey<FormState>();

  Widget buildBody(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => sl<AuthBloc>(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 15),
        child: Center(
          child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
            if (state is AuthRegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('User Registered Successfully!'),
                ),
              );
            } else if (state is AuthRegisterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          }, builder: (context, state) {
            if (state is AuthLoginProgress) {
              return LoadingWidget();
            } else {
              return Container(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'NeoSTORE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      NeoTextField(
                        hint: 'First Name',
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
                          firsName = val!;
                        },
                      ),
                      sizedBox18(),
                      NeoTextField(
                        hint: 'Last Name',
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
                          lastName = val!;
                        },
                      ),
                      sizedBox18(),
                      NeoTextField(
                        hint: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
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
                      sizedBox18(),
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
                      sizedBox18(),
                      NeoTextField(
                        hint: 'Confirm Password',
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
                      sizedBox18(),
                      buildGenderRadios(),
                      sizedBox18(),
                      NeoTextField(
                        hint: 'Phone',
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        validatorFn: (val) {
                          if (val != null && val.isEmpty) {
                            return 'Please enter something!';
                          }
                        },
                        onSavedFn: (val) {
                          phoneNo = val!;
                        },
                      ),
                      sizedBox18(),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: true,
                              checkColor: Colors.red,
                              activeColor: Colors.white,
                              onChanged: (value) {},
                            ),
                            Text('I agree the Terms & Conditions',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16))
                          ],
                        ),
                      ),
                      sizedBox18(),
                      NeoWhiteBtn(
                        text: 'Register',
                        onPressed: () async {
                          var validated = _formKey.currentState?.validate();
                          if (validated!) {
                            _formKey.currentState!.save();
                            context.read<AuthBloc>().add(RegisterRequested(
                                email: email!,
                                confirmPassword: password!,
                                password: password!,
                                firstName: firsName!,
                                lastName: lastName!,
                                gender: genderNotifier.value.toString(),
                                phoneNo: phoneNo!));
                          }
                        },
                      ),
                      SizedBox(
                        height: 22,
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
        ),
      ),
    );
  }

  Widget buildGenderRadios() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Gender', style: TextStyle(color: Colors.white, fontSize: 18)),
        SizedBox(width: 20),
        Flexible(
          child: ValueListenableBuilder<GenderTypes>(
              valueListenable: genderNotifier,
              builder: (context, value, _) {
                return RadioListTile<GenderTypes>(
                  value: GenderTypes.Male,
                  groupValue: value,
                  onChanged: (value) {
                    if (value != null) genderNotifier.value = value;
                  },
                  title: Text('Male',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  contentPadding: const EdgeInsets.all(0),
                  activeColor: Colors.white,
                  dense: true,
                );
              }),
        ),
        Flexible(
          child: ValueListenableBuilder<GenderTypes>(
              valueListenable: genderNotifier,
              builder: (context, value, _) {
                return RadioListTile<GenderTypes>(
                  value: GenderTypes.Female,
                  groupValue: value,
                  onChanged: (value) {
                    if (value != null) genderNotifier.value = value;
                  },
                  title: Text('Female',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  contentPadding: const EdgeInsets.all(0),
                  activeColor: Colors.white,
                  dense: true,
                );
              }),
        ),
      ],
    );
  }

  SizedBox sizedBox18() {
    return SizedBox(
      height: 18,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Register'),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios),
      ),
      backgroundColor: Colors.red,
      body: buildBody(context),
    );
  }
}

enum GenderTypes { Male, Female }
