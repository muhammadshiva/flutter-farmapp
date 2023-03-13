import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rphu_application/blocs/fetch_data_products/fetch_data_products_cubit.dart';
import 'package:rphu_application/models/data_product_model.dart';
import 'package:rphu_application/shared/theme.dart';

class DetailPageScreen extends StatefulWidget {
  final int rphuId;

  const DetailPageScreen({super.key, required this.rphuId});

  @override
  _DetailPageScreenState createState() => _DetailPageScreenState();
}

class _DetailPageScreenState extends State<DetailPageScreen>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Raw Materials'),
    Tab(text: 'Results'),
    Tab(text: 'Byproducts'),
  ];

  late TabController _tabController;

  late FetchDataProductsCubit _fetchDataProductsCubit;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _fetchDataProductsCubit = FetchDataProductsCubit()
      ..loadByRphuId(rphuId: widget.rphuId);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _fetchDataProductsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _fetchDataProductsCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detail Materials'),
          bottom: TabBar(
            controller: _tabController,
            tabs: myTabs,
            labelColor: blueColor,
            unselectedLabelColor: greyColor,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      color: lightBgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 1,
                          offset: Offset(0,
                              1), // Mengatur offset untuk membuat shadow hanya di bawah
                        ),
                      ],
                      shape: BoxShape.rectangle, // Mengatur bentuk box
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Product',
                          style: blackTextStyle.copyWith(
                            color: Color(0xFF14193F),
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          'Quantity',
                          style: blackTextStyle.copyWith(
                            color: Color(0xFF14193F),
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          'UoM',
                          style: blackTextStyle.copyWith(
                            color: Color(0xFF14193F),
                            fontWeight: semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<FetchDataProductsCubit, FetchDataProductsState>(
                    builder: (context, state) {
                      return state is FetchDataProductsLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : state is FetchDataProductsFailure
                              ? Center(
                                  child: Text(
                                      state.message ?? 'Terjadi kesalahan'),
                                )
                              : state is FetchDataProductsSuccess
                                  ? Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 10,
                                      ),
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.72,
                                      child: ListView(
                                        children: [
                                          for (int i = 0;
                                              i < state.data[0].fromIds.length;
                                              i++)
                                            rawMaterialCard(
                                                state.data[0].fromIds[i]),
                                        ],
                                      ),
                                    )
                                  : SizedBox();
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      color: lightBgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 1,
                          offset: Offset(0,
                              1), // Mengatur offset untuk membuat shadow hanya di bawah
                        ),
                      ],
                      shape: BoxShape.rectangle, // Mengatur bentuk box
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Product',
                          style: blackTextStyle.copyWith(
                            color: Color(0xFF14193F),
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          'Quantity',
                          style: blackTextStyle.copyWith(
                            color: Color(0xFF14193F),
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          'UoM',
                          style: blackTextStyle.copyWith(
                            color: Color(0xFF14193F),
                            fontWeight: semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<FetchDataProductsCubit, FetchDataProductsState>(
                    builder: (context, state) {
                      return state is FetchDataProductsLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : state is FetchDataProductsFailure
                              ? Center(
                                  child: Text(
                                      state.message ?? 'Terjadi kesalahan'),
                                )
                              : state is FetchDataProductsSuccess
                                  ? Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 10,
                                      ),
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.72,
                                      child: ListView(
                                        children: [
                                          for (int i = 0;
                                              i < state.data[0].toIds.length;
                                              i++)
                                            resultCard(state.data[0].toIds[i]),
                                        ],
                                      ),
                                    )
                                  : SizedBox();
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      color: lightBgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 1,
                          offset: Offset(0,
                              1), // Mengatur offset untuk membuat shadow hanya di bawah
                        ),
                      ],
                      shape: BoxShape.rectangle, // Mengatur bentuk box
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Product',
                          style: blackTextStyle.copyWith(
                            color: Color(0xFF14193F),
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          'Quantity',
                          style: blackTextStyle.copyWith(
                            color: Color(0xFF14193F),
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          'UoM',
                          style: blackTextStyle.copyWith(
                            color: Color(0xFF14193F),
                            fontWeight: semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<FetchDataProductsCubit, FetchDataProductsState>(
                    builder: (context, state) {
                      return state is FetchDataProductsLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : state is FetchDataProductsFailure
                              ? Center(
                                  child: Text(
                                      state.message ?? 'Terjadi kesalahan'),
                                )
                              : state is FetchDataProductsSuccess
                                  ? Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 10,
                                      ),
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.72,
                                      child: ListView(
                                        children: [
                                          for (int i = 0;
                                              i <
                                                  state.data[0].byproductIds
                                                      .length;
                                              i++)
                                            byProducts(
                                                state.data[0].byproductIds[i]),
                                        ],
                                      ),
                                    )
                                  : SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rawMaterialCard(FromIdElement fromIds) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          fromIds.productId[1],
          style: blackTextStyle.copyWith(
            color: Color(0xFF14193F),
            fontWeight: medium,
          ),
        ),
        Text(
          fromIds.qty.toString(),
          style: blackTextStyle.copyWith(
            color: Color(0xFF14193F),
            fontWeight: medium,
          ),
        ),
        Text(
          fromIds.uomId[1],
          style: blackTextStyle.copyWith(
            color: Color(0xFF14193F),
            fontWeight: medium,
          ),
        ),
      ],
    );
  }

  Widget resultCard(FromIdElement toIds) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          toIds.productId[1],
          style: blackTextStyle.copyWith(
            color: Color(0xFF14193F),
            fontWeight: medium,
          ),
        ),
        Text(
          toIds.qty.toString(),
          style: blackTextStyle.copyWith(
            color: Color(0xFF14193F),
            fontWeight: medium,
          ),
        ),
        Text(
          toIds.uomId[1],
          style: blackTextStyle.copyWith(
            color: Color(0xFF14193F),
            fontWeight: medium,
          ),
        ),
      ],
    );
  }

  Widget byProducts(ByproductId byproductId) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          byproductId.productId[1],
          style: blackTextStyle.copyWith(
            color: Color(0xFF14193F),
            fontWeight: medium,
          ),
        ),
        Text(
          byproductId.qty.toString(),
          style: blackTextStyle.copyWith(
            color: Color(0xFF14193F),
            fontWeight: medium,
          ),
        ),
        Text(
          byproductId.uomId[1],
          style: blackTextStyle.copyWith(
            color: Color(0xFF14193F),
            fontWeight: medium,
          ),
        ),
      ],
    );
  }
}
