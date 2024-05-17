import 'package:ecommerce/constants.dart';
import 'package:ecommerce/features/add_products/view/add_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});
  static String id = 'AdminScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: SafeArea(
        child: Center(
          //! Three Buttons For Products
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //! Add Product
              RawMaterialButton(
                padding: EdgeInsets.all(15.r),
                fillColor: Colors.white,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddProduct()));
                },
                child: const Text('Add Product'),
              ),
              SizedBox(height: 10.h),
              //! Edit Product
              RawMaterialButton(
                padding: EdgeInsets.all(15.r),
                fillColor: Colors.white,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none),
                onPressed: () {},
                child: const Text('Edit Product'),
              ),
              SizedBox(height: 10.h),
              //! View Orders
              RawMaterialButton(
                padding: EdgeInsets.all(15.r),
                fillColor: Colors.white,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none),
                onPressed: () {},
                child: const Text('View Orders'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
