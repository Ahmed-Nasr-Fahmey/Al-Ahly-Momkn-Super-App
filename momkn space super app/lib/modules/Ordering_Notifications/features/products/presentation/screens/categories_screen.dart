import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_app_bar.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/main_layout.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/catalog_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/presentation/screens/sub_categories_screen.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/presentation/widgets/catalog_category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.catalog});
  final CatalogEntity catalog;

  @override
  Widget build(BuildContext context) {
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
            catalog.catalogName,
            style: TextStyle(fontSize: AppTheme.fontSize24(context), fontWeight: AppTheme.fontWeight700, color: AppTheme.primaryGreenColor),
          ),
        ),
        SizedBox(
          height: context.screenAspectRatio * 10,
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: catalog.categories.length,
          itemBuilder: (context, index) {
            final category = catalog.categories[index];
            return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SubCategoriesScreen(category: category),
                  ));
                },
                child: CatalogCategoryCardWidget(title: category.categoryName, imgUrl: "assets/product2.png"));
          },
        )
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
