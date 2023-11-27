import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemData extends StatelessWidget {
  ItemData({super.key});

  final List<String> rectText1 = [
    "BABY BOY'S CLOTHES",
    "BABY GIRL'S CLOTHES",
    "DIAPERS",
    "CAR SEATS",
    "STROLLERS & PRAMS",
    "WALKERS & BOUNCERS",
    "BEDROOMS FURNITURE",
    "BEDDING & BLANKETS",
    "DIAPER BAGS",
  ];

  final List<String> colorsBoxesText = [
    "SALE",
    "NEW IN",
    "BESTSELLER",
  ];

  final List<Color> colorsBoxes = [
    Colors.red,
    Colors.black,
    Colors.yellow,
  ];

  final List<Color> textColorsBoxes = [
    Colors.white,
    Colors.white,
    Colors.black,
  ];

  final List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoDLqNx7jidN-T5FMfnnnddqbyYRnEOOycyJ8EinD_Uw&s",
    "https://seeklogo.com/images/T/tommee-tippee-logo-4DE004210A-seeklogo.com.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVFsHMB5erNCnRDUp_2gNazYylKAsnfEV7MiWFftZaCQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpaaPYkBbOU6DKA2OSfYkD2Cgflce1rO49ftc3iINTkg&s",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Chicco_logo.svg/1280px-Chicco_logo.svg.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKPx3qqm0uwuyoxzrHxLUUHwXaTs831N7SGVa3r9zc6w&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsPUwvNFtKVh-kvUomRJ9WLrshY15bj82Lx9c1oblCFw&s",
    "https://1000marcas.net/wp-content/uploads/2021/10/Graco-Logo.png",
    "https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/082015/babyzen.png?itok=fc5Jj-iZ",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 230.w,
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 100.h,
            child: Image.network(
              "https://img.freepik.com/free-vector/special-offer-creative-sale-banner-design_1017-16284.jpg?1",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.6,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Container(
              margin: EdgeInsetsDirectional.all(5.r),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  rectText1[index],
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            itemCount: 9,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: List.generate(
              colorsBoxesText.length,
                  (index) => Container(
                margin: EdgeInsetsDirectional.all(5.r),
                padding: EdgeInsetsDirectional.all(3.r),
                color: colorsBoxes[index],
                width: 66.w,
                height: 20.h,
                child: Center(
                  child: Text(
                    colorsBoxesText[index],
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: textColorsBoxes[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: double.infinity,
            height: 100.h,
            child: Image.network(
              "https://img.freepik.com/free-photo/sale-concept-black-background_23-2148313046.jpg?size=626&ext=jpg&ga=GA1.1.387824931.1701101738&semt=sph",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Featured Brands",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.8,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Container(
              height: 10.h,
              margin: EdgeInsetsDirectional.all(5.r),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Image.network(
                images[index],
                fit: BoxFit.fill,
              ),
            ),
            itemCount: 9,
          ),
        ],
      ),
    );
  }
}