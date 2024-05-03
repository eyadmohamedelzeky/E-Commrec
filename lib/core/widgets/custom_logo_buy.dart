import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

class CustomLogoBuy extends StatelessWidget {
  const CustomLogoBuy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .2,
        child: const Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage(
                imageBuy,
              ),
            ),
            Positioned(
                bottom: 0.0,
                child: Text(
                  'Buy it',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 25,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
