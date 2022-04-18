// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:piton_shop_list/core/models/product_model.dart';
import 'package:piton_shop_list/views/products/product_detail/product_detail.dart';

import '../../../../core/core_shelf.dart';

class ProductContainer extends StatefulWidget {
  ProductModel product;
  int index;
  ProductContainer({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    AppLocalizations.of(context);
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    final themeNotifier = Provider.of<ThemeProvider>(context, listen: false);
    return InkWell(
      onTap: () {
        navigatonService.navigateTo(ProductDetail(
          product: widget.product,
          productProvider: productProvider,
          index: widget.index,
        ));
      },
      child: Container(
        height: size.height * .14,
        width: size.width,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bgSecondary(context),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width * .3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/login_header.jpg'),
                ),
              ),
            ),
            SizedBox(width: size.width * .02),
            Container(
              width: size.width * .47,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(fontWeight: FontWeight.bold, color: textPrimary(context)),
                  ),
                  Text(
                    widget.product.price.toString() + ' ₺',
                    style: TextStyle(
                      color: MainColors.mainPink,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Container(
                width: size.width * .1,
                height: size.height * .07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                  ),
                  color: mainColor(context),
                ),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      widget.product.isLiked
                          ? productService.unlikeProduct(id: widget.product.id.toString()).whenComplete(() {
                              setState(() {
                                widget.product.isLiked = !widget.product.isLiked;
                              });
                              productProvider.checkisLiked(productModel: widget.product, index: widget.index);
                            })
                          : productService.likeProduct(id: widget.product.id.toString()).whenComplete(() {
                              setState(() {
                                widget.product.isLiked = !widget.product.isLiked;
                              });
                              productProvider.checkisLiked(productModel: widget.product, index: widget.index);
                            });
                    },
                    child: Icon(
                      widget.product.isLiked ? Icons.favorite : Icons.favorite_outline,
                      color: widget.product.isLiked
                          ? themeNotifier.isDark()
                              ? Colors.white
                              : Colors.red
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
