import 'package:flutter/material.dart';

import '../Style/Style.dart';

class ProductUpdateScreen extends StatefulWidget {
  final Map productItem;
  const ProductUpdateScreen(this.productItem);

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  Map<String, String> FormValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": ""
  };

  bool Loading = false;

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Product',
          style: TextStyle(color: colorWhite),
        ),
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
              child: Loading
                  ? (Center(
                      child: CircularProgressIndicator(),
                    ))
                  : ((SingleChildScrollView(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: "A",
                            onChanged: (Textvalue) {
                              InputOnChange("ProductName", Textvalue);
                            },
                            decoration: AppInputDecoration('Product Name'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            initialValue: "A",
                            onChanged: (Textvalue) {
                              InputOnChange("ProductCode", Textvalue);
                            },
                            decoration: AppInputDecoration('Product Code'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            initialValue: "A",
                            onChanged: (Textvalue) {
                              InputOnChange("Img", Textvalue);
                            },
                            decoration: AppInputDecoration('Product Image'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            initialValue: "A",
                            onChanged: (Textvalue) {
                              InputOnChange("UnitPrice", Textvalue);
                            },
                            decoration: AppInputDecoration('Unit Price'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            initialValue: "A",
                            onChanged: (Textvalue) {
                              InputOnChange("TotalPrice", Textvalue);
                            },
                            decoration: AppInputDecoration('Total Price'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          AppDropDownStyle(
                            DropdownButton(
                              value: FormValues['Qty'],
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
                              onChanged: (Textvalue) {
                                InputOnChange("Qty", Textvalue);
                              },
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
                              onPressed: () {
                                //FormOnSubmit();
                              },
                              child: SuccessButtonChild('Submit'),
                            ),
                          )
                        ],
                      ),
                    ))))
        ],
      ),
    );
  }
}
