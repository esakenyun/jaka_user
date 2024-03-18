import 'package:flutter/material.dart';
import 'package:jaka_user/common/appstyle.dart';
import 'package:jaka_user/constants/constants.dart';
import 'package:jaka_user/model/merchant.dart';
import 'package:jaka_user/pages/home/widget/merchant_tile.dart';
import 'package:jaka_user/widget/all_merchant_shimmer.dart';

class AllMerchant extends StatefulWidget {
  const AllMerchant({super.key});

  @override
  State<AllMerchant> createState() => _AllMerchantState();
}

class _AllMerchantState extends State<AllMerchant> {
  late Future<List<dynamic>> _futureMerchants;

  @override
  void initState() {
    super.initState();
    _futureMerchants = Merchant.getAllMerchants();
  }

  Future<void> refresh() async {
    setState(() {
      _futureMerchants = Merchant.getAllMerchants();
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
          'All Merchant',
          style: appstyle(17, AppColors.black, FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _futureMerchants,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AllMerchantShimmer(
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
                final merchant = snapshot.data![index];
                return MerchantTile(
                  merchantId: merchant.id,
                  imageURL: merchant.imageUrl,
                  name: merchant.name,
                  rating: merchant.ratings,
                  address: merchant.address,
                );
              },
            );
          }
        },
      ),
    );
  }
}
