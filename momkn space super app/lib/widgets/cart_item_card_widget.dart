
import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/presentation/viewmodels/cart_viewmodel.dart';

class CartItemCardWidget extends StatefulWidget {
  const CartItemCardWidget({
    super.key,
    required this.item,
  });
  final CartItem item;

  @override
  State<CartItemCardWidget> createState() => _CartItemCardWidgetState();
}

class _CartItemCardWidgetState extends State<CartItemCardWidget> {
  @override
  Widget build(BuildContext context) {
    int itemCount = widget.item.itemCount;
    return Container(
      margin: EdgeInsets.symmetric(vertical: context.screenAspectRatio * 5),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/product2.png",
                fit: BoxFit.fill,
                width: context.screenWidth * 0.25,
              ),
              SizedBox(
                width: context.screenWidth * 0.01,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.item.skuEntity.skuName,
                          style: TextStyle(fontSize: AppTheme.fontSize18(context), fontWeight: AppTheme.fontWeight700),
                        ),
                        Text(
                          "${widget.item.skuEntity.skuPrice} \$",
                          style: TextStyle(
                              fontSize: AppTheme.fontSize18(context), fontWeight: AppTheme.fontWeight700, color: AppTheme.primaryGreenColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: AppTheme.lightGreenColor,
                            borderRadius: AppTheme.boxRadius,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: context.screenAspectRatio * 3, vertical: context.screenAspectRatio * 2),
                          child: Text(
                            "Available",
                            style: TextStyle(color: AppTheme.primaryGreenColor, fontSize: AppTheme.fontSize16(context)),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  CartViewModel.increment(widget.item.skuEntity);
                                });
                              },
                              child: Container(
                                decoration: const BoxDecoration(color: AppTheme.primaryGreenColor, borderRadius: AppTheme.boxRadius),
                                child: const Icon(
                                  Icons.add,
                                  color: AppTheme.whiteColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: context.screenAspectRatio * 5),
                              child: Text(
                                '${itemCount}',
                                style: TextStyle(
                                    fontSize: AppTheme.fontSize16(context),
                                    color: AppTheme.primaryGreenColor,
                                    fontWeight: AppTheme.fontWeight500),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  CartViewModel.decrement(widget.item.skuEntity);
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppTheme.whiteColor,
                                    borderRadius: AppTheme.boxRadius,
                                    border: Border.all(color: AppTheme.primaryGreenColor)),
                                child: const Icon(
                                  Icons.remove,
                                  color: AppTheme.primaryGreenColor,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.01,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.delete_outline_rounded,
                                color: AppTheme.orangeColor,
                              ),
                              Text(
                                "Delete",
                                style: TextStyle(
                                    color: AppTheme.orangeColor, fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight600),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: context.screenWidth * 0.05,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.bookmark,
                                color: AppTheme.orangeColor,
                              ),
                              Text(
                                "Save for later",
                                style: TextStyle(
                                    color: AppTheme.orangeColor, fontSize: AppTheme.fontSize16(context), fontWeight: AppTheme.fontWeight600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: context.screenAspectRatio*5,),
          Divider(thickness: 3,color: AppTheme.lightGreenColor,)
        ],
      ),
    );
  }
}


  // isEditable == true ? Spacer() : SizedBox(),
        // isEditable == true
        //     ? Column(
        //         mainAxisSize: MainAxisSize.max,
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         crossAxisAlignment: CrossAxisAlignment.end,
        //         children: [
        //           SvgPicture.asset("assets/delete_icon.svg"),
        //           SizedBox(
        //             height: context.screenAspectRatio * 10,
        //           ),
        //           Container(
        //             height: context.screenHeight * 0.04,
        //             decoration: BoxDecoration(
        //               color: AppTheme.screenBackgroundColor,
        //               borderRadius: BorderRadius.all(Radius.circular(10)),
        //             ),
        //             child: Row(
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //                 IconButton(
        //                     onPressed: () {
        //                       //TODO add logic
        //                     },
        //                     icon: Icon(
        //                       Icons.remove,
        //                       color: AppTheme.primaryGreenColor,
        //                       size: context.screenAspectRatio * 8,
        //                     )),
        //                 VerticalDivider(
        //                   color: AppTheme.greyHintColor,
        //                 ),
        //                 SizedBox(
        //                   width: context.screenAspectRatio * 10,
        //                   child: TextField(
        //                     textAlign: TextAlign.center,
        //                     textAlignVertical: TextAlignVertical.center,
        //                     onChanged: (value) {
        //                       if (value.isNotEmpty && !(int.parse(value) < 0)) {
        //                         itemCount = int.parse(value);
        //                       }
        //                       log(itemCount.toString());
        //                     },
        //                     controller: itemCountTextController,
        //                     keyboardType: TextInputType.number,
        //                     decoration:
        //                         const InputDecoration(border: InputBorder.none, hintStyle: TextStyle(color: AppTheme.greyHintColor)),
        //                   ),
        //                 ),
        //                 VerticalDivider(
        //                   color: AppTheme.greyHintColor,
        //                 ),
        //                 IconButton(
        //                     onPressed: () {
        //                       //TODO add logic
        //                     },
        //                     icon: Icon(
        //                       Icons.add,
        //                       color: AppTheme.primaryGreenColor,
        //                       size: context.screenAspectRatio * 8,
        //                     )),
        //               ],
        //             ),
        //           ),
        //         ],
        //       )
        //     : const SizedBox(),