import 'package:crud_app/Style/Style.dart';
import 'package:flutter/material.dart';

class ProductCreateScreen extends StatefulWidget {
  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Product',
          style: TextStyle(color: colorWhite),
        ),
        centerTitle: true,
        backgroundColor: colorGreen,
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: (SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Product Name'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Product Code'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Product Image'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Unit Price'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Total Price'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppDropDownStyle(
                    DropdownButton(
                      value: "1 pcs",
                      items: [
                        DropdownMenuItem(
                          child: Text('Select Qt'),
                          value: "",
                        ),
                        DropdownMenuItem(
                          child: Text('1 pcs'),
                          value: "1 pcs",
                        ),
                        DropdownMenuItem(
                          child: Text('2 pcs'),
                          value: "2 pcs",
                        ),
                        DropdownMenuItem(
                          child: Text('3 pcs'),
                          value: "3 pcs",
                        ),
                        DropdownMenuItem(
                          child: Text('4 pcs'),
                          value: "4 pcs",
                        ),
                      ],
                      onChanged: (value) {},
                      underline: Container(),
                      isExpanded: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      onPressed: () {},
                      child: SuccessButtonChild('Submit'),
                    ),
                  )
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
