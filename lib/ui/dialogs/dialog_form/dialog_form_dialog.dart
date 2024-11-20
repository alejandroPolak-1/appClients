import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_stacked_app/api_repository/_api_repository.dart';

import 'package:tots_stacked_app/ui/dialogs/dialog_form/dialog_form_dialog.form.dart';
import 'package:tots_stacked_app/ui/common/_common.dart';
import 'package:tots_stacked_app/ui/widgets/_widget.dart';

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

  const DialogFormDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  static const _textFormStyle = UiStyle.textFormStyle;

  @override
  void onViewModelReady(DialogFormDialogModel viewModel) {
    // Si hay datos en la solicitud, sincroniza el formulario
    if (request.data != null) {
      final data = request.data;
      viewModel.idClient = request.data["id"];
      viewModel.photo = request.data["photo"];

      firstNameController.text =
          data[ksLabelFirstNameClient] ?? ''; //"firstName"
      lastNameController.text = data[ksLabelLastNameClient] ?? ''; //"lastNam e"
      emailAddressController.text =
          data[ksLabelEmailAdressClient] ?? ''; // "email"
    }
    syncFormWithViewModel(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    DialogFormDialogModel viewModel,
    Widget? child,
  ) {
    bool isCreatingForm = request.data["id"] == null;

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
                  Text(
                    isCreatingForm
                        ? ksAddNewClientTextModal
                        : ksEditClientTextModal,
                    style: UiStyle.textStyle12Bold,
                  ),
                  verticalSpaceSmall,
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: viewModel.takeAPhoto,
                          child: CircleAvatar(
                            radius: 50,

                            backgroundImage: viewModel.photo != null
                                ? viewModel.photo!.startsWith("http")
                                    ? NetworkImage(viewModel.photo!)
                                    : FileImage(File(viewModel.photo!))
                                : null,
                            child: viewModel.photo == null
                                ? const Icon(Icons.photo_camera_outlined,
                                    size:
                                        50) // Icono por defecto si no hay imagen
                                : null,

                            //   : null,
                            // child: _selectedFile == null
                            //   ? const Icon(Icons.person, size: 50)
                            //   : null,
                          ),
                        ),
                        verticalSpaceSmall
                        // Otras opciones o botones si los necesitas
                      ],
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
                        helperMaxLines: 1,
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

                    var itsNewData = isCreatingForm
                        ? await viewModel.createClient(ClientBody(
                            firstname: firstNameController.text,
                            lastname: lastNameController.text,
                            email: emailAddressController.text,
                            photo: viewModel.image?.path))
                        : await viewModel.updateClient(
                            ClientParams(
                                id: viewModel.idClient.toString(),
                                body: ClientBody(
                                    firstname: firstNameController.text,
                                    lastname: lastNameController.text,
                                    email: emailAddressController.text,
                                    photo: viewModel.image?.path)),
                          );

                    if (itsNewData == true) {
                      viewModel.navigateHome();
                    } else if (itsNewData == false) {
                      viewModel.getBack();
                    }

                    //   email: mailController.text,
                    //   password: passwordController.text,
                    // );
                  },
                ),
              ],
            )
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
