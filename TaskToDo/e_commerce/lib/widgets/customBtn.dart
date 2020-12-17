import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool outlineBtn;
  final bool isLoading;

  CustomBtn({this.text, this.onPressed, this.outlineBtn, this.isLoading});

  @override
  Widget build(BuildContext context) {
    bool _outlineBtn = outlineBtn ?? false;
    bool _isLoading = isLoading ?? false;

    return Padding(
      padding: EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 44.0,
          decoration: BoxDecoration(
            color: _outlineBtn ? Colors.transparent : Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
              color: Colors.black,
              width: 1,
            )
          ),
          child: Stack(
            children: [
              Visibility(
                visible: _isLoading ? false : true,
                child: Center(
                    child: Text(text ?? 'Text',
                      style: TextStyle(
                          color: _outlineBtn ? Colors.black : Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: .3,
                          fontSize: 16.0),)),
              ),
              Visibility(
                  visible: _isLoading,
                  child: Center(child: CircularProgressIndicator(),))
            ],
          ),
        ),
      ),
    );
  }
}
