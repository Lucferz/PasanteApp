import 'dart:convert';

import 'package:flutter/material.dart';


class Posts extends StatelessWidget {
  final tipo_user;
  const Posts({
    Key? key,
    required this.tipo_user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isParticular = tipo_user == 'particular'? false: true; //falso particular, empresas verdadero
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Column(
        children: [
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            borderOnForeground: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _cabecera(isParticular: isParticular),  
                  _cuerpo(),
                  _botones(),  
                ],
              ),
            ),
          )
                  
        ],
      ),
    );
  }
}

class _botones extends StatelessWidget {
  const _botones({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(thickness: 1.5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: (){}, 
              child: Text(
                'Postularse', 
                style: TextStyle(
                  color: Colors.black,
                ),
            ),
              style: ButtonStyle(
                mouseCursor: MaterialStateMouseCursor.clickable,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _cuerpo extends StatelessWidget {
  const _cuerpo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          softWrap: true,
          style: TextStyle(
            fontSize: 10
          ),
        )
      ],
    );
  }
}

class _cabecera extends StatelessWidget {
  final bool isParticular;
  const _cabecera({
    required this.isParticular,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle_rounded, size: 20),
                  SizedBox(width: 10,),
                  Text('Nombre Empresa', style: TextStyle(fontSize: 20),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {}, 
                    icon: Icon(Icons.border_color_sharp,),
                    iconSize: 15,
                  )
                ],
              )
          ],
          ),
        ),
        Divider(thickness: 1.5,),
        SizedBox(height: 10,),
      ],
    );
  }
}