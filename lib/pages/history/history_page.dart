import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaka_user/common/appstyle.dart';
import 'package:jaka_user/constants/constants.dart';
import 'package:jaka_user/model/history.dart';
import 'package:jaka_user/pages/history/widget/history_tile.dart';
import 'package:jaka_user/pages/history/widget/order_tile.dart';
import 'package:jaka_user/widget/history_shimmer.dart';
import 'package:lottie/lottie.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late Future<List<HistoryOrder>> _futureOrderData;
  bool isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _futureOrderData = HistoryOrder.getAllHistory();
  }

  Future<void> _refresh() async {
    if (!mounted) return;
    setState(() {
      isRefreshing = true;
    });
    _futureOrderData = HistoryOrder.getAllHistory();
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() {
      isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
          style: appstyle(22, AppColors.black, FontWeight.bold),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.h),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                ),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                  ),
                  labelColor: AppColors.white,
                  unselectedLabelColor: AppColors.black,
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  splashBorderRadius: BorderRadius.circular(25),
                  tabs: const [
                    Tab(
                      text: 'On Going',
                    ),
                    Tab(text: 'History'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  RefreshIndicator(
                    edgeOffset: 0,
                    color: AppColors.primary,
                    onRefresh: _refresh,
                    child: FutureBuilder<List<HistoryOrder>>(
                      future: _futureOrderData,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: HistoryShimmer(
                              itemCount: 3,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else {
                          List<HistoryOrder> orderHistory = snapshot.data!
                              .where((order) => order.status == 'active')
                              .toList();

                          if (orderHistory.isEmpty) {
                            return ListView.builder(
                              padding: EdgeInsets.symmetric(
                                horizontal: 50.h,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.15,
                              ),
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DotLottieLoader.fromAsset(
                                        'assets/ordernow.lottie', frameBuilder:
                                            (BuildContext ctx,
                                                DotLottie? dotlottie) {
                                      if (dotlottie != null) {
                                        return Lottie.memory(
                                          dotlottie.animations.values.single,
                                        );
                                      } else {
                                        return Container();
                                      }
                                    }),
                                  ],
                                );
                              },
                            );
                          } else {
                            return ListView.builder(
                              padding: const EdgeInsets.all(8.0),
                              itemCount: orderHistory.length,
                              itemBuilder: (context, index) {
                                return OrderTile(order: orderHistory[index]);
                              },
                            );
                          }
                        }
                      },
                    ),
                  ),
                  RefreshIndicator(
                    edgeOffset: 0,
                    color: AppColors.primary,
                    onRefresh: _refresh,
                    child: FutureBuilder<List<HistoryOrder>>(
                      future: _futureOrderData,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: HistoryShimmer(
                              itemCount: 3,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else {
                          List<HistoryOrder> orderHistory = snapshot.data!
                              .where((order) =>
                                  order.status == 'canceled' ||
                                  order.status == 'delivered')
                              .toList();

                          if (orderHistory.isEmpty) {
                            return ListView.builder(
                              padding: EdgeInsets.symmetric(
                                horizontal: 50.h,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.15,
                              ),
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DotLottieLoader.fromAsset(
                                        'assets/ordernow.lottie', frameBuilder:
                                            (BuildContext ctx,
                                                DotLottie? dotlottie) {
                                      if (dotlottie != null) {
                                        return Lottie.memory(
                                          dotlottie.animations.values.single,
                                        );
                                      } else {
                                        return Container();
                                      }
                                    }),
                                  ],
                                );
                              },
                            );
                          } else {
                            return ListView.builder(
                              padding: const EdgeInsets.all(8.0),
                              itemCount: orderHistory.length,
                              itemBuilder: (context, index) {
                                return HistoryTile(order: orderHistory[index]);
                              },
                            );
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
