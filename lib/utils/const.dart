import 'package:flutter/material.dart';

abstract class Const{
  static const mainColor = Color(0xff3d0312);
  static const secColor = Color(0xff7e0303);
  static const paigeColor = Color(0xffc89665);
  static const paigeToBrownColor = Color(0xff956744);
  static const brownColor = Color(0xff644127);

  static const reservationStarted = "reservationStarted";
  static const reservationPending = "reservationPending";
  static const reservationEnded = "reservationEnded";
  static const reservationCanceled = "reservationCanceled";

  static const bool isUser = false;

  static const carStatusIdle = "carStatusIdle";
  static const carStatusOffline = "carStatusOffline";
  static const carStatusMaintenance = "carStatusMaintenance";
  static const carStatusRented = "carStatusRented";
}