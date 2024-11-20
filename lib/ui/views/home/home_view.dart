import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'package:tots_stacked_app/ui/views/home/home_view.form.dart';
import 'package:tots_stacked_app/ui/common/_common.dart';
import 'package:tots_stacked_app/ui/widgets/_widget.dart';

import 'home_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: ksSearchLabelText, initialValue: ''),
])
class HomeView extends StackedView<HomeViewModel> with $HomeView {
  const HomeView({Key? key}) : super(key: key);

  //   @override
  // void onViewModelReady(HomeView viewModel) {
  //   syncFormWithViewModel(viewModel);
  // }

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
                          Text(ksHomeTitleText, style: UiStyle.textStyle20Bold),
                        ],
                      ),
                      verticalSpaceMedium,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              onChanged: (string) {
                                viewModel.searchListClient(string);
                              },
                              decoration: InputDecoration(
                                hintText: ksSearchHintText,
                                isDense: true,
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
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
                              label: ksAddNewClienteButtonText,
                              onPressed: () {
                                viewModel.showDialogCreateClient();
                              },
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
                            itemCount: viewModel.listClients.length,
                            itemBuilder: (context, index) {
                              final client = viewModel.data![index];
                              return CardHome(
                                client: client,
                               
                              );

                             
                            },
                          ),
                  ),

                  // Load More button

                  Custombutton(
                    label: ksLoadMoreClientButtonText,
                    onPressed: () async {
                      await viewModel.getClients();
                    },
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
