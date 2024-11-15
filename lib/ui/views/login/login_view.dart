import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_stacked_app/ui/common/app_colors.dart';
import 'package:tots_stacked_app/ui/common/app_strings.dart';
import 'package:tots_stacked_app/ui/common/ui_helpers.dart';
import 'package:tots_stacked_app/ui/common/ui_style.dart';

import 'package:tots_stacked_app/ui/views/login/login_view.form.dart';
import 'package:tots_stacked_app/ui/widgets/common/custombutton/custombutton.dart';
import 'package:tots_stacked_app/ui/widgets/common/login_background/login_background.dart';
import 'package:tots_stacked_app/utils/validators/text_input_validators.dart';

import 'login_viewmodel.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(
      name: ksLoginLabelMail, validator: TextInputValidators.validateMailText),
  FormTextField(
      name: ksLoginLabelPassword,
      validator: TextInputValidators.validatePasswordText),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  static const _textFormStyle = UiStyle.textFormStyle;

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: LoginBackground()),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      verticalSpaceMassive,
                      Center(
                        child: Image.asset('assets/images/minimal.png'),
                      ),
                      verticalSpaceMedium,
                      const Center(
                          child: Text(
                        ksLoginTitle,
                        style: UiStyle.textStyle12Bold,
                      )),
                      verticalSpaceSmall,
                      TextFormField(
                        style: _textFormStyle,
                        controller: mailController,
                        // onChanged: (value) =>
                        //     viewModel.setMailValidationMessage(null),
                        decoration: InputDecoration(
                          labelText: ksLoginLabelMail,
                          labelStyle: UiStyle.textFormStyle,
                          errorText: viewModel.firstLogin
                              ? null
                              : viewModel.mailValidationMessage,
                        ),
                      ),
                      verticalSpaceSmall,
                      TextFormField(
                        style: UiStyle.textFormStyle,
                        controller: passwordController,
                        obscureText: viewModel.isObscurePassword ? true : false,
                        // onChanged: (value) =>
                        //     viewModel.setPasswordValidationMessage(null),
                        decoration: InputDecoration(
                          labelText: ksLoginLabelPassword,
                          labelStyle: _textFormStyle,
                          errorText: viewModel.firstLogin
                              ? null
                              : viewModel.passwordValidationMessage,
                          suffixIcon: IconButton(
                            icon: viewModel.isObscurePassword
                                ? Icon(Icons.visibility,
                                    color: kcMediumGrey.withOpacity(0.38))
                                : Icon(Icons.visibility_off,
                                    color: kcMediumGrey.withOpacity(0.38)),
                            onPressed: viewModel.toggle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpaceLarge,
                Custombutton(
                  label: ksLoginButton,
                  onPressed: () async {
                    viewModel.validateForm();
                    await viewModel.login(
                      email: mailController.text,
                      password: passwordController.text,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
