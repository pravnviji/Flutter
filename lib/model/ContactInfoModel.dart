import 'package:flutter/material.dart';

class ContactInfoModel {
  const ContactInfoModel({
    @required this.avatarAsset,
    @required this.name,
    @required this.email,
    @required this.phone,
  });

  final String avatarAsset;
  final String name;
  final String email;
  final String phone;
}

const ContactInfoModels = [
  ContactInfoModel(
    avatarAsset: 'assets/images//avatars/tom.jpg',
    name: 'Tom Arbo',
    email: 'tom.arbo@example.com',
    phone: '(711) 265-9193',
  ),
  ContactInfoModel(
    avatarAsset: 'assets/images//avatars/elly.jpg',
    name: 'Elly Foster',
    email: 'elly@example.com',
    phone: '(675) 844-7400',
  ),
  ContactInfoModel(
    avatarAsset: 'assets/images//avatars/carolyn.jpg',
    name: 'Carolyn Durnham',
    email: 'carolyn.durnham@example.com',
    phone: '(995) 565-4039',
  ),
  ContactInfoModel(
    avatarAsset: 'assets/images//avatars/corrina.jpg',
    name: 'Corrina Nicholls',
    email: 'c.nicholls@example.com',
    phone: '(966) 291-5045',
  ),
  ContactInfoModel(
    avatarAsset: 'assets/images//avatars/omer.jpg',
    name: 'Omer Anderson',
    email: 'omer@example.net',
    phone: '(519) 978-4733',
  ),
];
