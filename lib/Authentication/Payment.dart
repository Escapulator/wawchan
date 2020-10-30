import 'package:flutter/material.dart';
import 'package:wawchan/Shared/buttons.dart';

class Payment extends StatefulWidget {
  final int pay;
  Payment({this.pay});
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    var radioButton;
    int pay = widget.pay;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Payment method',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 20),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .13,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Subtotal'),
                            Text(
                              '\$ ' + '$pay',
                              style: TextStyle(fontSize: 23),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('TransactionID'),
                            Text(
                              '123456789',
                              style: TextStyle(fontSize: 17),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .45,
              width: MediaQuery.of(context).size.width * .9,
              child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose Payment Method',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),
                        Card(
                          elevation: 12,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.payment),
                                Text('Bank Card'),
                                Radio(
                                  groupValue: radioButton,
                                  value: false,
                                  onChanged: null,
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 12,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.payment),
                                Text('Bank Card'),
                                Radio(
                                  groupValue: radioButton,
                                  value: false,
                                  onChanged: null,
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 12,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.payment),
                                Text('Bank Card'),
                                Radio(
                                  groupValue: radioButton,
                                  value: false,
                                  onChanged: null,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            Spacer(),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('Checkout');
                },
                child: bigButton(context, 'Pay Now'))
          ],
        ),
      ),
    );
  }
}
