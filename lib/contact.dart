import 'package:flutter/cupertino.dart';

class Contact{
  String? icon;
  String? name;
  String? secondname;
  String? companyname;
  String? phone;
  bool favorite;
  String? bio;

  Contact(this.icon,this.name,this.secondname,this.companyname,this.phone, this.favorite,this.bio);
}