import 'package:flutter/material.dart';
import 'package:registro_elettronico/feature/authentication/domain/model/profile_domain_model.dart';
import 'package:registro_elettronico/utils/profile_utils.dart';

import '../profile_local_model.dart';

class DefaultLoginResponseRemoteModel {
  String ident;
  String firstName;
  String lastName;
  String token;
  String release;
  String expire;

  DefaultLoginResponseRemoteModel({
    @required this.ident,
    @required this.firstName,
    @required this.lastName,
    @required this.token,
    @required this.release,
    @required this.expire,
  });

  ProfileLocalModel toLocalModelFromLogin({
    bool currentlyLoggedIn,
    String dbName,
  }) {
    return ProfileLocalModel(
      ident: this.ident,
      studentId: ProfileUtils.getIdFromIdent(this.ident),
      firstName: this.firstName ?? "",
      lastName: this.lastName ?? "",
      token: this.token ?? "",
      release: DateTime.tryParse(this.release) ?? DateTime.now(),
      expire: DateTime.tryParse(this.expire) ??
          DateTime.fromMillisecondsSinceEpoch(0),
      currentlyLoggedIn: currentlyLoggedIn,
      dbName: dbName,
    );
  }

  ProfileLocalModel toLocalModel(ProfileDomainModel d) {
    return ProfileLocalModel(
      ident: this.ident,
      studentId: ProfileUtils.getIdFromIdent(this.ident),
      firstName: this.firstName ?? "",
      lastName: this.lastName ?? "",
      token: this.token ?? "",
      release: DateTime.tryParse(this.release) ?? DateTime.now(),
      expire: DateTime.tryParse(this.expire) ??
          DateTime.fromMillisecondsSinceEpoch(0),
      currentlyLoggedIn: d.currentlyLoggedIn,
      dbName: d.dbName,
    );
  }

  DefaultLoginResponseRemoteModel.fromJson(Map<String, dynamic> json) {
    ident = json['ident'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    token = json['token'];
    release = json['release'];
    expire = json['expire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ident'] = this.ident;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['token'] = this.token;
    data['release'] = this.release;
    data['expire'] = this.expire;
    return data;
  }

  @override
  String toString() {
    return 'DefaultLoginResponseRemoteModel(ident: $ident, firstName: $firstName, lastName: $lastName, token: $token, release: $release, expire: $expire)';
  }
}
