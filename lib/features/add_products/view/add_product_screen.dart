import 'package:ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

static const String id = 'AddProduct';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            CustomTextFormField(),
            CustomTextFormField(),
            CustomTextFormField(),
            CustomTextFormField(),
            CustomTextFormField(),
          ],
        ),
      )),
    );
  }
}
