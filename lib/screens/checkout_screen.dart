import 'package:flutter/material.dart';
import 'package:shop_app/widgets/custom_app_bar.dart';
import 'package:shop_app/widgets/order_summary.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  static const String routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController ziCodeController = TextEditingController();

    Padding _buildTextFormField(
      BuildContext context,
      String labelText,
      TextEditingController controller,
    ) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 75,
              child: Text(
                labelText,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(left: 10),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: 'Checkout'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CUSTOMER INFORMATION',
              style: Theme.of(context).textTheme.headline3,
            ),
            _buildTextFormField(context, 'Email', emailController),
            _buildTextFormField(context, 'Full Name', nameController),
            Text(
              'DELIVERY INFORMATION',
              style: Theme.of(context).textTheme.headline3,
            ),
            _buildTextFormField(context, 'Address', addressController),
            _buildTextFormField(context, 'City', cityController),
            _buildTextFormField(context, 'Country', countryController),
            _buildTextFormField(context, 'Zip Code', ziCodeController),
            Text(
              'ORDER SUMMARY',
              style: Theme.of(context).textTheme.headline3,
            ),
            OrderSummary(),
            SizedBox(height: 20),
            Container(
              height: 60,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'SELECT A PAYMENT METHOD',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(),
                elevation: 0,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'ORDER NOW',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
