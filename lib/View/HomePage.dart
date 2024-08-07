import 'package:advance_flutter_exam/Model/model.dart';
import 'package:advance_flutter_exam/Provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ExamProvider examProviderTrue =
        Provider.of<ExamProvider>(context, listen: true);
    ExamProvider examProviderFalse =
        Provider.of<ExamProvider>(context, listen: false);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('HomePage'),
      ),
      body: FutureBuilder(
        future: examProviderFalse.fromApi(),
        builder: (context, snapshot) {
          ProductDetail? ecommerce = snapshot.data;

          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                // itemCount: examProviderTrue.productDetail!.price,
                itemCount: examProviderTrue.productDetail!.title.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 9 / 16),
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.red,
                    child: Column(
                      children: [
                        Container(
                          height: h * 0.1,
                          width: w * 0.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                              examProviderTrue.productDetail!.image,
                            )
                                // image: NetworkImage(examProviderTrue
                                //     .ecommerceModel!.productDetail.image),
                                ),
                          ),
                        ),
                        Text(examProviderTrue.productDetail!.price.toString())
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.hasError.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
