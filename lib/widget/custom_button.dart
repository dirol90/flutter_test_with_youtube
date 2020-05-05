
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class CustomButton{

  double _buttonWidth;
  double _buttonHeight;
  Color _buttonColor;
  Widget _widget;
  Function _buttonFunction;
  double _circularValue;
  Color _borderColor;

  CustomButton(this._buttonWidth, this._buttonHeight, this._buttonColor, this._widget, this._circularValue, this._borderColor, this._buttonFunction);

  Widget get myButton {
    return  SizedBox(
      width: _buttonWidth,
      height: _buttonHeight,
      child: RaisedButton(
        color: _buttonColor,
        onPressed: () {
          _buttonFunction();
        },
        child: _widget,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(_circularValue),
            side: BorderSide(color: _borderColor)),
      ),
    );
  }

}