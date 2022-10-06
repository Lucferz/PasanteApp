import 'package:flutter/material.dart';

class NavigationBtns extends StatelessWidget {
  final String nextBtnText;
  final String nextBtnRoute;
  final VoidCallback? NextBtnFunc;

  const NavigationBtns({
    required this.NextBtnFunc,
    this.nextBtnText='Siguiente',
    this.nextBtnRoute='',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            onPressed: () {
              print('volvio!!');
              Navigator.pop(context);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            // hoverColor: Colors.transparent,
            // hoverElevation: 0,
            // minWidth: 100,
            // elevation: 0,
            color: Colors.blueGrey[200],
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Text(
                '<Volver', 
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: NextBtnFunc,
            /*() {
              print('Se quiso loguear');
              if (this.nextScreen != Container()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => this.nextScreen,
                  ),
            );
              }else{
                Navigator.pushNamed(context, this.nextBtnRoute);
              }
            },*/
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            minWidth: 100,
            elevation: 0,
            color: Colors.blueGrey[200],
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Text(
                this.nextBtnText, 
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}