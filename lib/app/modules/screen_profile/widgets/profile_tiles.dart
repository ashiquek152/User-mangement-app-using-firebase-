import 'package:firebase_auth_example/app/data/common_widgets/colors.dart';
import 'package:flutter/material.dart';

class ProfileTiles extends StatelessWidget {
  const ProfileTiles({
    Key? key, required this.icon, required this.iconColor, required this.title, required this.titleType,
  }) : super(key: key);

 final String title;
 final String titleType;
  final IconData icon;
 final Color iconColor;

 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: white,
              child:  Icon(icon,color: iconColor,),  
            ),
            const SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
               Text(titleType,style: const TextStyle(fontSize: 12,color: Colors.black45)),
              Text(title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            ],),
          ],
          
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
