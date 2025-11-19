import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/components/buttons/main_button.dart';
import 'package:se7ety/components/inputs/custom_text_field.dart';
import 'package:se7ety/components/inputs/password_text_field.dart';
import 'package:se7ety/core/functions/app_regex.dart';
import 'package:se7ety/core/functions/dialogs.dart';
import 'package:se7ety/core/routes/navigation.dart';
import 'package:se7ety/core/routes/routes.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';
import 'package:se7ety/features/auth/models/user_type_enum.dart';
import 'package:se7ety/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:se7ety/features/auth/presentation/cubit/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.userType});
  final UserTypeEnum userType;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String handleUserType() {
    return widget.userType == UserTypeEnum.doctor ? 'دكتور' : 'مريض';
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: const BackButton(color: AppColors.primaryColor),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            showLoadingDialog(context);
          } else if (state is AuthSuccessState) {
            pop(context);
            if (state.role == "doctor") {
              // pushTo(context, Routes.doctorMain);
            } else {
              goToBase(context, Routes.patientMain);
            }
          } else if (state is AuthFailureState) {
            pop(context);
            showMyDialog(context, state.error);
          }
        },
        child: SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: Column(
                children: [
                  const Gap(40),
                  Image.asset('assets/images/logo.png', height: 250),
                  const SizedBox(height: 20),
                  Text(
                    'سجل دخول الان كـ "${handleUserType()}"',
                    style: TextStyles.title.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: cubit.emailController,
                    hintText: 'Clever@example.com',
                    prefixIcon: Icon(Icons.email_rounded),
                    textAlign: TextAlign.end,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'من فضلك ادخل الايميل';
                      } else if (!AppRegex.isEmailValid(value)) {
                        return 'من فضلك ادخل الايميل صحيحا';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 25.0),
                  PasswordTextFormField(
                    controller: cubit.passwordController,
                    hintText: '********',
                    prefixIcon: const Icon(Icons.lock),
                    validator: (value) {
                      if (value!.isEmpty) return 'من فضلك ادخل كلمة السر';
                      return null;
                    },
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsetsDirectional.only(
                      top: 10,
                      start: 10,
                    ),
                    child: Text('نسيت كلمة السر ؟', style: TextStyles.small),
                  ),
                  const Gap(20),
                  MainButton(
                    onPressed: () async {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.login();
                      }
                    },
                    text: "تسجيل الدخول",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ليس لدي حساب ؟',
                          style: TextStyles.body.copyWith(
                            color: AppColors.darkColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            pushWithReplacement(
                              context,
                              Routes.register,
                              extra: widget.userType,
                            );
                          },
                          child: Text(
                            'سجل الان',
                            style: TextStyles.body.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
