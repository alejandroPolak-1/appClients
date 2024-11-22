import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_stacked_app/api_repository/models/client_model.dart';
import 'package:tots_stacked_app/ui/common/app_colors.dart';
import 'package:tots_stacked_app/ui/common/app_strings.dart';
import 'package:tots_stacked_app/ui/common/ui_helpers.dart';
import 'package:tots_stacked_app/ui/common/ui_style.dart';
import 'package:tots_stacked_app/ui/widgets/common/avatar/avatar.dart';

import 'card_home_model.dart';

class CardHome extends StackedView<CardHomeModel> {
  final Client client;

  const CardHome({
    Key? key,
    required this.client,
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
          color: kcBagroundCardTileColor,
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          child: ListTile(
            // dense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 12),

            leading: Avatar(
              urlImage: client.photo,
              whitoutBorder: true,
            ),

            title: Text("${client.firstname} ${client.lastname}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    UiStyle.base(14)),
            subtitle: Text(
              client.email ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: UiStyle.base(14),
            ),
            trailing: Theme(
              data: Theme.of(context).copyWith(
                popupMenuTheme: PopupMenuThemeData(
                  color: kcPopupBackgroundColor,
                  textStyle: UiStyle.base(14,color: kcPopupText),
                ),
              ),
              child: PopupMenuButton<String>(
                icon:
                    const Icon(Icons.more_vert, color: kcPopupBackgroundColor),
                onSelected: (String value) {
                  switch (value) {
                    case ksEditButtonText:
                      viewModel.showDialogCreateClient(client: client);
                      break;
                    case ksDeleteButtonText:
                      viewModel.showSuccessMessage();
                      break;
                    default:

                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                itemBuilder: (BuildContext context) {
                  return [
                   
                     PopupMenuItem<String>(
                      value: ksEditButtonText,
                      child: Row(children: [
                        const Icon(Icons.edit, color: kcPopupIcon),
                        horizontalSpaceSmall,
                        Text(ksEditButtonText,
                            style: UiStyle.base(14,color: kcPopupText)),
                      ]),
                    ),

                     PopupMenuItem<String>(
                        value: ksDeleteButtonText,
                        child: Row(children: [
                          const Icon(Icons.delete, color: kcPopupIcon),
                          horizontalSpaceSmall,
                          Text(ksDeleteButtonText,
                              style: UiStyle.base(14,color: kcPopupText)),
                        ])), 

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
