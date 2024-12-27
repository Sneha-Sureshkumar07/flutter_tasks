import 'package:flutter/material.dart';
import 'package:task_1/Config/colours.dart';

class LastLoginCardList extends StatelessWidget {
  final int itemCount;
  final String? time;
  final String? ip;
  final String? qrId;
  final VoidCallback onPressed;

  LastLoginCardList({super.key, required this.itemCount, this.time, this.ip, this.qrId, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.lightBlack,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(
          time!,
          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location: Chennai', style: TextStyle(color: Colors.white)),
          ],
        ),
        trailing: IconButton(onPressed: onPressed, icon: Icon(Icons.delete,color: Colors.white,)),
      ),
    );
  }
}
