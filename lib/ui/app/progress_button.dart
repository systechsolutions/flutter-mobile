import 'package:flutter/material.dart';

class ProgressButton extends StatelessWidget {
  final String label;
  final bool isLoading;
  final bool isDirty;
  final Function onPressed;

  const ProgressButton({
    Key key,
    @required this.label,
    @required this.isLoading,
    @required this.onPressed,
    @required this.isDirty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    if (! isDirty) {
      return Container();
    }
    */

    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 2.0),
      child: isLoading
          ? SizedBox(
        width: 100.0,
        child: Center(
          child: SizedBox(
            height: 32.0,
            width: 32.0,
            child: CircularProgressIndicator(
              //valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              //strokeWidth: 2.0,
            ),
          ),
        ),
      )
          : RaisedButton(
        child: Text(label),
        padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
        //color: Colors.lightBlueAccent,
        //color: const Color(0xFF005090),
        color: Theme.of(context).primaryColorDark,
        textColor: Colors.white,
        elevation: 4.0,
        onPressed: () => this.onPressed(),
      ),
    );
  }
}
