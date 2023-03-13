import 'package:flutter/material.dart';
import 'package:rphu_application/shared/theme.dart';

class DetailPageScreen extends StatefulWidget {
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.72,
                  child: ListView(
                    children: [
                      rawMaterialCard(),
                      rawMaterialCard(),
                      rawMaterialCard(),
                      rawMaterialCard(),
                      rawMaterialCard(),
                      rawMaterialCard(),
                    ],
                  ),
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
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.72,
                  child: ListView(
                    children: [
                      resultCard(),
                      resultCard(),
                      resultCard(),
                      resultCard(),
                      resultCard(),
                    ],
                  ),
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
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.72,
                  child: ListView(
                    children: [
                      byProducts(),
                      byProducts(),
                      byProducts(),
                      byProducts(),
                      byProducts(),
                      byProducts(),
                      byProducts(),
                      byProducts(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rawMaterialCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Livebird',
          style: blackTextStyle.copyWith(
            color: Color(0xFF14193F),
            fontWeight: medium,
          ),
        ),
        Text(
          '3,221.47',
          style: blackTextStyle.copyWith(
            color: Color(0xFF14193F),
            fontWeight: medium,
          ),
        ),
        Text(
          'Kg',
          style: blackTextStyle.copyWith(
            color: Color(0xFF14193F),
            fontWeight: medium,
          ),
        ),
      ],
    );
  }

  Widget resultCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Livebird',
          style: blackTextStyle.copyWith(
            color: Color(0xFF14193F),
            fontWeight: medium,
          ),
        ),
        Text(
          '3,221.47',
          style: blackTextStyle.copyWith(
            color: Color(0xFF14193F),
            fontWeight: medium,
          ),
        ),
        Text(
          'Kg',
          style: blackTextStyle.copyWith(
            color: Color(0xFF14193F),
            fontWeight: medium,
          ),
        ),
      ],
    );
  }

  Widget byProducts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Livebird',
          style: blackTextStyle.copyWith(
            color: Color(0xFF14193F),
            fontWeight: medium,
          ),
        ),
        Text(
          '3,221.47',
          style: blackTextStyle.copyWith(
            color: Color(0xFF14193F),
            fontWeight: medium,
          ),
        ),
        Text(
          'Kg',
          style: blackTextStyle.copyWith(
            color: Color(0xFF14193F),
            fontWeight: medium,
          ),
        ),
      ],
    );
  }
}
