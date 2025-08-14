import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myanimationavator/profile_model.dart';

class ProfileScreen extends StatefulWidget {
   const ProfileScreen({super.key, required this.data});

  final String data;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileModel profileModel;

  @override
  void initState() {
    super.initState();
    final Map<String, dynamic> json = jsonDecode(widget.data);
    profileModel = ProfileModel.fromJson(json['data']);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(profileModel.url);
    final String pngUrl = profileModel.url.replaceAll(".glb", ".png");
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 84,
          backgroundImage: NetworkImage(pngUrl),
        ),
      ),
    );
  }
}
