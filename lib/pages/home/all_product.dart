import 'package:flutter/material.dart';
import 'package:jaka_user/common/appstyle.dart';
import 'package:jaka_user/constants/constants.dart';
import 'package:jaka_user/model/products.dart';
import 'package:jaka_user/pages/home/widget/product_tile.dart';
import 'package:jaka_user/widget/all_product_shimmer.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  late Future<List<dynamic>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = Product.getAllProduct();
  }

  Future<void> refresh() async {
    setState(() {
      _futureProducts = Product.getAllProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          title: Text(
            'All Food',
            style: appstyle(17, AppColors.black, FontWeight.bold),
          ),
        ),
        body: FutureBuilder<List<dynamic>>(
          future: _futureProducts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const AllProductShimmer(
                itemCount: 5,
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No merchant data available');
            } else {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final product = snapshot.data![index];
                  return ProductTile(
                    productId: product.id,
                    name: product.name,
                    imageURL: product.image,
                    price: product.price.toString(),
                  );
                },
              );
            }
          },
        ));
  }
}
