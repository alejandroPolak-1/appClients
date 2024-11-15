import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:tots_stacked_app/ui/common/app_colors.dart';
import 'package:tots_stacked_app/ui/common/app_strings.dart';
import 'package:tots_stacked_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_stacked_app/ui/common/ui_style.dart';
import 'package:tots_stacked_app/ui/dialogs/dialog_form/dialog_form_dialog.form.dart';
import 'package:tots_stacked_app/ui/widgets/common/custombutton/custombutton.dart';
import 'package:tots_stacked_app/ui/common/enums.dart';

import 'dialog_form_dialog_model.dart';

@FormView(fields: [
  FormTextField(name: ksLabelFirstNameClient, initialValue: ''),
  FormTextField(name: ksLabelLastNameClient, initialValue: ''),
  FormTextField(name: ksLabelEmailAdressClient, initialValue: ''),
])
class DialogFormDialog extends StackedView<DialogFormDialogModel>
    with $DialogFormDialog {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  // final String? firstName;
  // final String? lastName;
  // final String? email;
  // final String? urlImage;

  const DialogFormDialog({
    Key? key,
    required this.request,
    required this.completer,
    // this.firstName,
    // this.lastName,
    // this.email,
    // this.urlImage,
  }) : super(key: key);

  static const _textFormStyle = UiStyle.textFormStyle;

  @override
  void onViewModelReady(DialogFormDialogModel viewModel) {
    // Si hay datos en la solicitud, sincroniza el formulario
    if (request.data != null) {
      final data = request.data;
      // viewModel.setInitialValues(
      firstNameController.text = data[ksLabelFirstNameClient] ?? ''; //"firstName"
      lastNameController.text = data[ksLabelLastNameClient] ?? '';   //"lastNam e"
      emailAddressController.text = data[ksLabelEmailAdressClient] ?? '';// "email"
      // );
    }
    syncFormWithViewModel(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    DialogFormDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: kcBagroundModalColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    ksEditClientTextModal,
                    style: UiStyle.textStyle12Bold,
                  ),
                  verticalSpaceSmall,
                  Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey[300],
                      
                      // backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                      // child: _imageFile == null ? Icon(Icons.person, size: 60) : null,
                    ),
                  ),
                  verticalSpaceSmall,
                  TextFormField(
                    style: _textFormStyle,
                    controller: firstNameController,
                    // onChanged: (value) =>
                    //     viewModel.setMailValidationMessage(null),
                    decoration: InputDecoration(
                      labelText: ksLabelFirstNameClient,
                      labelStyle: UiStyle.textFormStyle,
                      errorText: viewModel.firstNameValidationMessage,
                    ),
                  ),
                  verticalSpaceSmall,
                  TextFormField(
                    style: UiStyle.textFormStyle,
                    controller: lastNameController,
                    decoration: InputDecoration(
                      labelText: ksLabelLastNameClient,
                      labelStyle: _textFormStyle,
                      errorText: viewModel.lastNameValidationMessage,
                    ),
                  ),
                  verticalSpaceSmall,
                  TextFormField(
                    style: UiStyle.textFormStyle,
                    controller: emailAddressController,
                    decoration: InputDecoration(
                        labelText: ksLabelEmailAdressClient,
                        labelStyle: _textFormStyle,
                        errorText: viewModel.emailAddressValidationMessage),
                  ),
                ],
              ),
            ),

            //
            verticalSpaceMedium,

            Row(
              children: [
                Custombutton(
                  label: ksCancelButtonText,
                  buttonType: ButtonType.text,
                  textColor: kcPrimaryColorText,
                  widthFactor: 0.4,
                  onPressed: () async {
                    viewModel.getBack();
                    // await viewModel.login(
                    //   email: mailController.text,
                    //   password: passwordController.text,
                    // );
                  },
                ),
                Custombutton(
                  label: ksSaveButtonText,
                  buttonType: ButtonType.primary,
                  widthFactor: 0.3,
                  onPressed: () async {
                    viewModel.validateForm();
                    // await viewModel.login(
                    //   email: mailController.text,
                    //   password: passwordController.text,
                    // );
                  },
                ),
              ],
            )
            // GestureDetector(
            //   onTap: () => completer(DialogResponse(confirmed: true)),
            //   child: Container(
            //     height: 50,
            //     width: double.infinity,
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //       color: Colors.black,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: const Text(
            //       'Got it',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(DialogFormDialogModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  DialogFormDialogModel viewModelBuilder(BuildContext context) =>
      DialogFormDialogModel();
}
