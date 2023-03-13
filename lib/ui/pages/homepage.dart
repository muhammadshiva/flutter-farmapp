import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rphu_application/blocs/fetch_data_products/fetch_data_products_cubit.dart';
import 'package:rphu_application/models/data_product_model.dart';
import 'package:rphu_application/shared/theme.dart';
import 'package:rphu_application/ui/pages/detailpage.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late FetchDataProductsCubit _fetchDataProductsCubit;

  @override
  void initState() {
    _fetchDataProductsCubit = FetchDataProductsCubit()..load();

    super.initState();
  }

  @override
  void dispose() {
    _fetchDataProductsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _fetchDataProductsCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Rumah Potong Hewan Unggas',
            style: blackTextStyle.copyWith(
              color: Color(0xFF14193F),
            ),
          ),
          elevation: 0.5,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 12,
          ),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: Text(
                  'List Materials',
                  style: blackTextStyle.copyWith(
                    color: Color(0xFF14193F),
                    fontWeight: semiBold,
                    fontSize: 20,
                  ),
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
                              child: Text(state.message ?? "terjadi kesalahan"),
                            )
                          : state is FetchDataProductsSuccess
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height: 10,
                                  ),
                                  itemCount: state.data.length,
                                  itemBuilder: (context, index) {
                                    DataProduct dataProduct = state.data[index];
                                    return cardProduct(dataProduct);
                                  },
                                )
                              : SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardProduct(DataProduct dataProduct) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailPageScreen(
                    rphuId: dataProduct.id,
                  )),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        margin: const EdgeInsets.only(bottom: 10),
        width: double.infinity,
        // height: 90,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dataProduct.name,
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 18,
                color: Color(0xFF14193F),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        color: Color(0xFF14193F),
                      ),
                    ),
                    Text(
                      dataProduct.date,
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                        color: Color(0xFF14193F),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Responsible',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        color: Color(0xFF14193F),
                      ),
                    ),
                    Text(
                      dataProduct.userId[1],
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                        color: Color(0xFF14193F),
                      ),
                    ),
                  ],
                ),
                Spacer()
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Description',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                color: Color(0xFF14193F),
              ),
            ),
            Text(
              dataProduct.description,
              style: blackTextStyle.copyWith(
                fontWeight: medium,
                color: Color(0xFF14193F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
