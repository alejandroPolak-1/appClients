import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_stacked_app/api_repository/models/client_model.dart';
import 'package:tots_stacked_app/ui/common/app_strings.dart';
import 'package:tots_stacked_app/ui/common/ui_helpers.dart';

import 'card_home_model.dart';

class CardHome extends StackedView<CardHomeModel> {
  final Client client;
  // final Function(String) onEdit;

  const CardHome({
    Key? key,
    required this.client,
    // required this.firstName,
    // required this.lastName,
    // required this.email,
    // this.photoUrl,
    // required this.onEdit,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CardHomeModel viewModel,
    Widget? child,
  ) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 326,
        minHeight: 120,
        maxWidth: MediaQuery.of(context).size.width * 0.85,
      ),
      child: Center(
        child: Card(
          color: Colors.white, // Cambia esto por kcBagroundCardTileColor
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(
              color: Colors.black, // Color del borde
              width: 1.0, // Ancho del borde
            ),
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            leading: CircleAvatar(
              radius: 50,
              backgroundImage: client.photo != null && client.photo!.isNotEmpty
                  ? client.photo!.startsWith("http")
                      ? NetworkImage(client.photo!)
                      : FileImage(File(client.photo!))
                  : null,
              child: client.photo == null || client.photo!.isEmpty
                  ? const Icon(Icons.person,
                      size: 50) // Icono por defecto si no hay imagen
                  : null,
            ),
            title: Text(
              "${client.firstname} ${client.lastname}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              client.email ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Theme(
              data: Theme.of(context).copyWith(
                popupMenuTheme: const PopupMenuThemeData(
                  color: Colors.black, // Cambia esto por kcPopupBackgroundColor
                  textStyle: TextStyle(
                      color: Colors.white), // Cambia esto por kcPopupText
                ),
              ),
              child: PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert,
                    color:
                        Colors.black), // Cambia esto por kcPopupBackgroundColor
                onSelected: (String value) {
                  switch (value) {
                    case ksEditButtonText:
                      viewModel.showDialogCreateClient(client: client);
                      break;
                    case ksDeleteButtonText:
                      viewModel.showSuccessMessage();
                      // viewModel.deleteCLient(client.id!.toString());
                      break;
                    default:

                    // onEdit(client.email!);
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      12.0), // Ajusta el valor para más o menos redondeo
                ),
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem<String>(
                        value: ksDeleteButtonText,
                        child: Row(children: [
                          Icon(Icons.delete, color: Colors.white),
                          horizontalSpaceSmall,
                          Text(ksDeleteButtonText,
                              style: TextStyle(color: Colors.white)),
                        ])), // Cambia esto por kcPopupText
                    const PopupMenuItem<String>(
                      value: ksEditButtonText,
                      child: Row(children: [
                        Icon(Icons.edit,
                            color: Colors.white), // Cambia esto por kcPopupText
                        horizontalSpaceSmall,
                        Text(ksEditButtonText,
                            style: TextStyle(
                                color: Colors
                                    .white)), // Cambia esto por kcPopupText
                      ]),
                    ),
                  ];
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  CardHomeModel viewModelBuilder(
    BuildContext context,
  ) =>
      CardHomeModel();
}
