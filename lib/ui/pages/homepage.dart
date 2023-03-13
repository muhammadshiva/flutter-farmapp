import 'package:flutter/material.dart';
import 'package:rphu_application/shared/theme.dart';
import 'package:rphu_application/ui/pages/detailpage.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            cardProduct(),
            cardProduct(),
            cardProduct(),
            cardProduct(),
            cardProduct(),
          ],
        ),
      ),
    );
  }

  Widget cardProduct() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPageScreen()),
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
              'RPHU/API/22/10/05/011',
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
                      '10/10/2022',
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
                      'ADMINISTRATOR',
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
              'Bahan Baku FS LiveBird Potong tanggal 7 September 2022',
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
