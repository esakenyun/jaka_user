import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaka_user/model/products.dart';
import 'package:jaka_user/pages/home/widget/product_widget.dart';
import 'package:jaka_user/widget/product_shimmer.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => ProductListState();
}

class ProductListState extends State<ProductList> {
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
    return Container(
      height: 280.h,
      padding: EdgeInsets.only(
        left: 12.w,
        top: 10.h,
      ),
      child: FutureBuilder<List<dynamic>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ProductShimmer(
              itemCount: 3,
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No merchant data available');
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return ProductWidget(
                  onTap: () {},
                  image: product.image,
                  title: product.name,
                  price: product.price.toString(),
                );
              },
            );
          }
        },
      ),
    );
  }
}
