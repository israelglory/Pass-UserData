// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_data/item_notifier.dart';

class ItemScreen extends StatelessWidget {
  final txt = TextEditingController();
  final idtxt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      body: Column(
        children: [
          Container(
            child: TextField(
              controller: txt,
              decoration: const InputDecoration(hintText: 'Enter text'),
            ),
          ),
          RaisedButton(
            onPressed: () async {
              if (txt.text.isEmpty) {
                return;
              }
              await Provider.of<ItemNotifier>(context, listen: false)
                  .addItem(txt.text);
              Navigator.pop(context);
            },
            child: const Text('Add Item'),
          ),
          Stack(
            children: [
              Container(
                color: Colors.green,
              ),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.black),
                child: Text(
                  'Glory',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
