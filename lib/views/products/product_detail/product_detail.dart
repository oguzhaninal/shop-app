// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:piton_shop_list/core/models/product_model.dart';

import '../../../core/core_shelf.dart';

class ProductDetail extends StatefulWidget {
  ProductModel product;
  ProductProvider productProvider;
  int index;
  ProductDetail({Key? key, required this.product, required this.productProvider, required this.index})
      : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProductProvider>(context, listen: false).getProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/login_header.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: textSecondary(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          child: Text(
                            widget.product.price.toString() + ' ₺',
                            style: TextStyle(
                              color: MainColors.mainPink,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Text(
                          widget.product.description,
                          style: TextStyle(
                            color: textPrimary(context),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 25,
                              right: size.width * .05,
                            ),
                            child: Container(
                              width: size.width * .25,
                              height: 50,
                              child: MaterialButton(
                                child: Text(
                                  'buy'.translate,
                                  style: TextStyle(
                                    color: textSecondary(context),
                                  ),
                                ),
                                color: mainColor(context),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              right: 30,
              child: InkWell(
                onTap: () {
                  widget.product.isLiked
                      ? productService.unlikeProduct(id: widget.product.id.toString()).whenComplete(
                          () => widget.productProvider.checkisLiked(productModel: widget.product, index: widget.index))
                      : productService.likeProduct(id: widget.product.id.toString()).whenComplete(
                          () => widget.productProvider.checkisLiked(productModel: widget.product, index: widget.index));

                  setState(() {
                    widget.product.isLiked = !widget.product.isLiked;
                  });
                },
                child: Icon(
                  widget.product.isLiked ? Icons.favorite : Icons.favorite_outline,
                  size: 36,
                  color: widget.product.isLiked ? Colors.red : Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
