import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Algo'),
      ),
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.blueGrey[300],
        )
      ),
    );
  }
} 