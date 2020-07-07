//Jawaban untuk soal No. 2

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/chart.dart';
import 'package:provider_app/money.dart';

void main() => runApp(SecondApp());

class SecondApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Money>(
            builder: (context) => Money(),
          ),
          ChangeNotifierProvider<Cart>(
            builder: (context) => Cart(),
          )
        ],
        child: Scaffold(
          floatingActionButton: Consumer<Money>(
            builder: (context, money, _) => Consumer<Cart>(
              builder: (context, cart, _) => FloatingActionButton(
                onPressed: () {
                  if (money.balance >= 1000) {
                    cart.quantity += 1;
                    money.balance -= 1000;
                  }
                },
                child: Icon(Icons.add_shopping_cart),
                backgroundColor: Colors.lightBlue,
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: Text("Multi Provider"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Balance"),
                    Container(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Consumer<Money>(
                          builder: (context, money, _) => Text(
                            money.balance.toString(),
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      height: 30,
                      width: 150,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.purple[100],
                        border: Border.all(color: Colors.purple, width: 2),
                      ),
                    )
                  ],
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Consumer<Cart>(
                      builder: (context, cart, _) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Anggur (1000) X " + cart.quantity.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              (1000 * cart.quantity).toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ]),
                    ),
                  ),
                  height: 30,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
