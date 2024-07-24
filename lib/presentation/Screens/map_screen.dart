// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_maps/constants/strings.dart';
import 'package:google_fonts/google_fonts.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider<PhoneAuthCubit>(
        create: (context) => phoneAuthCubit,
        child: ElevatedButton(
          onPressed: () async {
            await phoneAuthCubit.logOut();
            Navigator.of(context).pushReplacementNamed(loginScreen);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            minimumSize: Size(110, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Text(
            'Map',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
        ),
      ),
    );
  }
}
