// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:piton_shop_list/core/core_shelf.dart';
import 'package:piton_shop_list/views/products/productlist/components/product_container.dart';
import 'package:piton_shop_list/views/settings/settings_view.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  TextEditingController sCont = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProductProvider>(context, listen: false).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    final size = MediaQuery.of(context).size;
    return Consumer(
      builder: (context, ProductProvider productProvider, child) {
        if (productProvider.loadingState == LoadingState.Loading) {
          return Scaffold(
            body: Center(
              child: Container(
                width: size.width * .3,
                height: 55,
                child: Lottie.asset(
                  'assets/lottie/loading.json',
                ),
              ),
            ),
          );
        }
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: mainColor(context),
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                    right: 8,
                  ),
                  child: InkWell(
                      onTap: () {
                        navigatonService.navigateTo(Settings());
                      },
                      child: Icon(Icons.settings)),
                ),
              ],
              title: TextFormField(
                controller: sCont,
                onChanged: (t) async {
                  await productProvider.filterProduct(t);
                },
                style: TextStyle(color: textSecondary(context)),
                cursorColor: textSecondary(context),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: border(context),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: border(context),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(15),
                  hintText: 'search_product'.translate,
                  hintStyle: TextStyle(fontSize: 14, color: textSecondary(context)),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: size.width * .1,
                            child: Divider(
                              thickness: 2,
                              color: mainColor(context),
                            )),
                        Text(
                          ' ' +
                              'total'.translate +
                              ' ' +
                              productProvider.products.length.toString() +
                              ' ' +
                              'product_listed'.translate +
                              ' ',
                          style: TextStyle(color: textPrimary(context)),
                        ),
                        Container(
                            width: size.width * .3,
                            child: Divider(
                              thickness: 2,
                              color: mainColor(context),
                            )),
                      ],
                    ),
                  ),
                  ...List.generate(productProvider.products.length, (index) {
                    return ProductContainer(
                      product: productProvider.products[index],
                      index: index,
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
