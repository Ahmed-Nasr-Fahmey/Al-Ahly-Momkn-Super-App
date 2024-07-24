import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/snackbar_message.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_app_bar.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_circular_progress_indicator.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/main_layout.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/presentation/bloc/bloc/products_bloc.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/presentation/screens/categories_screen.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/presentation/widgets/catalog_category_card.dart';

class CatalogsScreen extends StatelessWidget {
  const CatalogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductsBloc>().add(const GetCatalogsCategoriesSubCategoriesEvent());
    return MainLayout(
        body: Column(
      children: [
        CustomAppBar(
          title: Image.asset(
            "assets/logo.png",
            height: context.screenAspectRatio * 25,
            fit: BoxFit.fill,
          ),
          showBackCursor: true,
        ),

        Center(
          child: Text(
            "Catalogs",
            style: TextStyle(fontSize: AppTheme.fontSize24(context), fontWeight: AppTheme.fontWeight700, color: AppTheme.primaryGreenColor),
          ),
        ),
        SizedBox(
          height: context.screenAspectRatio * 10,
        ),
        BlocConsumer<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is GetCatalogsCategoriesSubCategoriesLoadingState) {
              return const CustomCircularProgressIndicator(
                color: AppTheme.primaryGreenColor,
              );
            } else if (state is GetCatalogsCategoriesSubCategoriesSuccessState) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: state.catalogs.length,
                itemBuilder: (context, index) {
                  final catalog = state.catalogs[index];
                  return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CategoriesScreen(catalog: catalog),
                        ));
                      },
                      child: CatalogCategoryCardWidget(title: catalog.catalogName, imgUrl: "assets/product2.png"));
                },
              );
            } else {
              return const SizedBox();
            }
          },
          listener: (context, state) {
            if (state is GetCatalogsCategoriesSubCategoriesErrorState) {
              SnackBarMessage.showErrorSnackBar(message: state.message, context: context);
            }
          },
        ),
        // GridView(
        //   physics: NeverScrollableScrollPhysics(),
        //   padding: EdgeInsets.zero,
        //   shrinkWrap: true,
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        //   children: [
        //     CatalogCategoryCardWidget(title: "نسيج القطن", imgUrl: "assets/product2.png"),
        //     CatalogCategoryCardWidget(title: "نسيج القطن", imgUrl: "assets/product2.png"),
        //     CatalogCategoryCardWidget(title: "نسيج القطن", imgUrl: "assets/product2.png"),
        //     CatalogCategoryCardWidget(title: "نسيج القطن", imgUrl: "assets/product2.png"),
        //     CatalogCategoryCardWidget(title: "نسيج القطن", imgUrl: "assets/product2.png"),
        //     CatalogCategoryCardWidget(title: "نسيج القطن", imgUrl: "assets/product2.png"),
        //     CatalogCategoryCardWidget(title: "نسيج القطن", imgUrl: "assets/product2.png"),
        //     CatalogCategoryCardWidget(title: "نسيج القطن", imgUrl: "assets/product2.png"),
        //     CatalogCategoryCardWidget(title: "نسيج القطن", imgUrl: "assets/product2.png"),
        //     CatalogCategoryCardWidget(title: "نسيج القطن", imgUrl: "assets/product2.png"),
        //   ],
        // )
      ],
    ));
  }
}
