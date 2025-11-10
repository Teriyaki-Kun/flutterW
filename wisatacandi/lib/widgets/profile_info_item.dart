

import 'package:flutter/material.dart';

class ProfileInfoItem extends StatefulWidget{
  const ProfileInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.showEditIcon = false,
    this.onEditPressed, 
    required this.iconColor,
  });
  final IconData icon;
  final String label;
  final String value;
  final bool showEditIcon;
  final VoidCallback? onEditPressed;
  final Color iconColor;


  @override
  State<ProfileInfoItem> createState() => _ProfileInfoItem();
}

class _ProfileInfoItem extends State<ProfileInfoItem>{
  Widget build(BuildContext context){
    return const Placeholder();
  }
}