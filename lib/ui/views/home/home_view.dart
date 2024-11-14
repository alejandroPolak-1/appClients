import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_stacked_app/app/app.locator.dart';
import 'package:tots_stacked_app/ui/common/app_colors.dart';
import 'package:tots_stacked_app/ui/common/ui_helpers.dart';
import 'package:tots_stacked_app/ui/common/ui_style.dart';
import 'package:tots_stacked_app/ui/widgets/common/custombutton/custombutton.dart';
import 'package:tots_stacked_app/ui/widgets/common/home_backgound/home_backgound.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned.fill(child: HomeBackgound()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      verticalSpaceSmall,
                      SizedBox(
                        height: 54,
                        width: 129,
                        child: Image.asset('assets/images/minimal.png'),
                      ),
                      verticalSpaceSmall,
                      const Row(
                        children: [
                          Text("Client", style: UiStyle.textStyle20Bold),
                        ],
                      ),
                      verticalSpaceSmall,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search...',

                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                    color: Colors.black, // Color del borde
                                    width: 1.0, // Ancho del borde
                                  ),
                                ),
                                filled: false,
                                // contentPadding: EdgeInsets.symmetric(vertical: ), // Ajusta la altura
                              ),
                            ),
                          ),
                          horizontalSpaceSmall,
                          Custombutton(
                              label: 'ADD NEW',
                              onPressed: () {},
                              widthFactor: 0.15,
                              height: 40),
                        ],
                      ),
                    ],
                  ),
                  verticalSpaceSmall,
                  // Aquí se asegura que ListView ocupe el espacio disponible
                  Expanded(
                    child: viewModel.isBusy
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: viewModel.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              final client = viewModel.data![index];
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: const BorderSide(
                                    color: Colors.black, // Color del borde
                                    width: 1.0, // Ancho del borde
                                  ),
                                ),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "${client.photo}"), // Cambia esto por la URL real
                                  ),
                                  title: Text("${client.firstname}"),
                                  subtitle: Text("${client.email}"),
                                  trailing: Theme(
                                    data: Theme.of(context).copyWith(
                                      popupMenuTheme: const PopupMenuThemeData(
                                        color:
                                            kcPopupBackgroundColor, // Fondo negro para el popup
                                        textStyle: TextStyle(
                                            color:
                                                kcPopupText), // Texto en blanco
                                      ),
                                    ),
                                    child: PopupMenuButton<String>(
                                      icon: const Icon(Icons.more_vert,
                                          color:
                                              kcPopupBackgroundColor), // Icono en blanco
                                      onSelected: (String value) {
                                        switch (value) {
                                          case "Edit":
                                            viewModel
                                                .showDialogEditClient(client);
                                            break;
                                          default:
                                        }
                                      },
                                      itemBuilder: (BuildContext context) {
                                        return [
                                          const PopupMenuItem<String>(
                                            value: 'Edit',
                                            child: Row(children: [
                                              Icon(
                                                Icons.edit,
                                                color: kcPopupText,
                                              ),
                                              horizontalSpaceTiny,
                                              Text('Edit',
                                                  style: TextStyle(
                                                      color: kcPopupText))
                                            ]),
                                          ),
                                        ];
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),

                  // Load More button

                  Custombutton(
                    label: 'LOAD MORE',
                    onPressed: () {},
                  ),

                  verticalSpaceSmall,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
