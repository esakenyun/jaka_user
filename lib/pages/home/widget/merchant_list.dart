import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaka_user/model/merchant.dart';
import 'package:jaka_user/pages/home/widget/merchant_widget.dart';
import 'package:jaka_user/widget/merchant_shimmer.dart';

class MerchantList extends StatefulWidget {
  const MerchantList({super.key});

  @override
  State<MerchantList> createState() => MerchantListState();
}

class MerchantListState extends State<MerchantList> {
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      padding: EdgeInsets.only(
        left: 12.w,
        top: 10.h,
      ),
      child: FutureBuilder<List<dynamic>>(
        future: _futureMerchants,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MerchantShimmer(
              itemCount: 2,
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
                final merchant = snapshot.data![index];
                return MerchantWidget(
                  onTap: () {},
                  image: merchant.imageUrl,
                  name: merchant.name,
                  rating: merchant.ratings,
                  ratingCount: merchant.totalRatings.toString(),
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
