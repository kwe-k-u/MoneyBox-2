import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextField extends StatefulWidget {
  @required String hintText;
  bool obscureText;
  Function validator;
  TextInputType keyboardType;

  CustomTextField({
    this.hintText,
    this.obscureText,
    this.validator,
    this.keyboardType,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}




class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;


    return Container(
      width: size.width * 0.7,
      height: size.height * 0.06,
      child: Material(

          elevation: 4.0,
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),

          //todo  set input colour to grey
          child: TextFormField(
            keyboardType: widget.keyboardType,
            validator: widget.validator,

            textAlign: TextAlign.center,
            maxLines: 1,
            obscureText: widget.obscureText == null ? false : widget.obscureText,
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              hintText: widget.hintText,

            ),
          )
      ),
    );
  }
}