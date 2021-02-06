import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BalanceCardWidget extends StatelessWidget {

  BalanceCardWidget({
    this.balance,
    this.colour,
});

    final double balance;
    final Color colour;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        color: this.colour
      ),

      padding: EdgeInsets.all(30.0),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Balance",
                style: TextStyle(
                    color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                )
              ),
              Icon(Icons.wifi,color: Colors.white,)
            ],
          ),

          SizedBox(
            height: size.height * 0.05,
          ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Mobile Money",
          style: TextStyle(color: Colors.white),),
          _showBalanceText(),
        ],
      ),
        ],
      ),
    );
  }

  Widget _showBalanceText(){
    Color _colour;
    String _text;


    //Selecting a colour
    if (balance.isNegative)
      _colour = Colors.red;
    else
      _colour = Colors.green.shade900;

    return
      Text("GHS ${this.balance.toStringAsFixed(2)}", //todo add commas and stuff
          style: TextStyle(
              color: _colour,
              fontSize: 32.0,
              fontWeight: FontWeight.bold
          )
      );
  }
}
