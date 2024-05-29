import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RestAPI/RestClient.dart';
import '../Style/Style.dart';
import 'ProductCreateScreen.dart';
import 'ProductUpdateScreen.dart';

class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({super.key});

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {
  List ProductList = [];
  bool isLoading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    isLoading = true;
    var data = await ProductGridViewListRequest();
    setState(() {
      ProductList = data;
      isLoading = false;
    });
  }

  DeleteItem(id) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Delete ! '),
            content: Text('Do you want to delete ?'),
            actions: [
              OutlinedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    setState(() {
                      isLoading = true;
                    });
                    await ProductDeleteRequest(id);
                    await CallData();
                  },
                  child: Text('Yes')),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('No'))
            ],
          );
        });
  }

  GotoUpdate(context, productItem) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => ProductUpdateScreen(productItem)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product List',
          style: TextStyle(color: colorWhite),
        ),
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
              child: isLoading
                  ? (Center(child: CircularProgressIndicator()))
                  : RefreshIndicator(
                      onRefresh: () async {
                        await CallData();
                      },
                      child: GridView.builder(
                          gridDelegate: ProductGridViewStyle(),
                          itemCount: ProductList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      ProductList[index]['Img'],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 7),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(ProductList[index]['ProductName']),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text("Unit Price: " +
                                            ProductList[index]['UnitPrice'] +
                                            " BDT"),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text('Total Price: ' +
                                            ProductList[index]['TotalPrice'] +
                                            " BDT"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            OutlinedButton(
                                                onPressed: () {
                                                  GotoUpdate(context,
                                                      ProductList[index]);
                                                },
                                                child: Icon(
                                                  CupertinoIcons
                                                      .ellipsis_vertical_circle,
                                                  size: 17,
                                                  color: colorGreen,
                                                )),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            OutlinedButton(
                                                onPressed: () {
                                                  DeleteItem(ProductList[index]
                                                      ['_id']);
                                                },
                                                child: Icon(
                                                  CupertinoIcons.delete,
                                                  color: colorRed,
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductCreateScreen()),
          );
        },
      ),
    );
  }
}
