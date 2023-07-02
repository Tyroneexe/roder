// ignore_for_file: unrelated_type_equality_checks, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:roder/themes/theme.dart';
import '../homepage/home_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  //
  TextEditingController titleController = TextEditingController();
  TextEditingController nuController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController bikeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkLocationPermission();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(user.photoURL!),
                  ),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: searchBarClr,
                    ),
                    child: Icon(
                      Icons.edit,
                      color: btnBlueClr,
                      size: 24,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'User Name',
                      style: actPageTxt,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                userNameForm(context),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Contact Number',
                      style: actPageTxt,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                numberForm(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Email',
                      style: actPageTxt,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                emailForm(context),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Location',
                      style: actPageTxt,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                locationForm(context),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Your Bike',
                      style: actPageTxt,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                bikeForm(context),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: TextButton(
                        onPressed: () {
                          // save to the database that is yet to be created
                        },
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            btnBlueClr,
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.white,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                6,
                              ),
                              side: BorderSide(
                                color: btnBlueClr,
                                width: 2,
                              ),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all<Size>(
                            Size(
                              (MediaQuery.of(context).size.width / 2) - 25,
                              38,
                            ),
                          ),
                        ),
                        child: Text('Cancel'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: TextButton(
                        onPressed: () {
                          //
                        },
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white,
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            btnBlueClr,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all<Size>(
                            Size(
                              (MediaQuery.of(context).size.width / 2) - 25,
                              38,
                            ),
                          ),
                        ),
                        child: Text('Save'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container bikeForm(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 40,
      child: TextFormField(
        style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w100,
            fontSize: 14,
            color: Colors.black),
        controller: bikeController,
        decoration: InputDecoration(
          hintText: 'Rather Not Say',
          hintStyle: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w100,
            fontSize: 14,
            color: Colors.black,
          ),
          contentPadding: EdgeInsets.only(
            left: 20,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: btnBlueClr,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: btnBlueClr,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: btnBlueClr,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
        ),
      ),
    );
  }

  Container locationForm(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 40,
      child: TextFormField(
        readOnly: true,
        style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w100,
            fontSize: 14,
            color: Colors.black),
        controller: locationController,
        decoration: InputDecoration(
          hintText: '$_currentCity, $_currentCountry',
          hintStyle: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w100,
            fontSize: 14,
            color: Colors.black,
          ),
          contentPadding: EdgeInsets.only(
            left: 20,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: btnBlueClr,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: btnBlueClr,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: btnBlueClr,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
        ),
      ),
    );
  }

  String _currentCity = '';
  String _currentCountry = '';

  Future<void> _getCurrentLocation() async {
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    final Placemark placemark = placemarks.first;
    final String city = placemark.locality ?? '';
    final String country = placemark.country ?? '';

    setState(() {
      _currentCity = city;
      _currentCountry = country;
    });
  }

  Container emailForm(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 40,
      child: TextFormField(
        readOnly: true,
        style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w100,
            fontSize: 14,
            color: Colors.black),
        controller: emailController,
        decoration: InputDecoration(
          hintText: user.email,
          hintStyle: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w100,
            fontSize: 14,
            color: Colors.black,
          ),
          contentPadding: EdgeInsets.only(
            left: 20,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: btnBlueClr,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: btnBlueClr,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: btnBlueClr,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
        ),
      ),
    );
  }

  Container numberForm(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 60,
      child: IntlPhoneField(
        flagsButtonPadding: EdgeInsets.only(
          left: 20,
        ),
        dropdownIcon: Icon(
          Icons.arrow_drop_down,
          color: btnBlueClr,
        ),
        disableLengthCheck: false,
        dropdownIconPosition: IconPosition.trailing,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w100,
          fontSize: 14,
          color: Colors.black,
        ),
        controller: nuController,
        decoration: InputDecoration(
          hintText: 'xxx - xxx - xxx',
          hintStyle: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w100,
              fontSize: 14,
              color: Colors.grey),
          contentPadding: EdgeInsets.only(
            left: 20,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: btnBlueClr,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: btnBlueClr,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: btnBlueClr,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
        ),
        initialCountryCode: 'US',
        // onChanged: (phone) {},
      ),
    );
  }

  Container userNameForm(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 40,
      child: TextFormField(
        style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w100,
            fontSize: 14,
            color: Colors.black),
        controller: titleController,
        decoration: InputDecoration(
          hintText: user.displayName,
          hintStyle: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w100,
            fontSize: 14,
            color: Colors.black,
          ),
          contentPadding: EdgeInsets.only(
            left: 20,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: btnBlueClr,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: btnBlueClr,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: btnBlueClr,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.colorScheme.background,
      foregroundColor: btnBlueClr,
      actions: [
        IconButton(
          icon: Icon(
            Icons.delete_forever_rounded,
            color: rred,
          ),
          onPressed: () {
            _deleteAccountAlert();
          },
        ),
      ],
    );
  }

  _deleteAccountAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: navBarBkgClr,
          title: Text(
            'Delete Account',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          content: Text(
            'Are you sure you want to permanently delete the existing account?',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w100,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                  color: recentTxtClr,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Yes',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: rred,
                ),
              ),
              onPressed: () async {
                try {
                  User? user = FirebaseAuth.instance.currentUser;
                  // Prompt the user to reauthenticate with Google
                  GoogleSignIn googleSignIn = GoogleSignIn();
                  GoogleSignInAccount? googleUser = await googleSignIn.signIn();
                  if (googleUser != null) {
                    GoogleSignInAuthentication googleAuth =
                        await googleUser.authentication;
                    AuthCredential credential = GoogleAuthProvider.credential(
                      accessToken: googleAuth.accessToken,
                      idToken: googleAuth.idToken,
                    );
                    // Reauthenticate the user
                    await user!.reauthenticateWithCredential(credential);
                    // User has been successfully reauthenticated
                    // Proceed with deleting the account
                    await user.delete();
                    // Account deleted successfully
                    Navigator.of(context).pop();
                  } else {
                    _errorMsg();
                  }
                  // Account deleted successfully
                  Navigator.of(context).pop();
                } catch (e) {
                  _errorMsg();
                }
              },
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 20,
        );
      },
    );
  }

  _errorMsg() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'An Error Has Occurred',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          content: Text(
            "Could not delete account.",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Try Again',
                style: TextStyle(
                  color: rred,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 20,
        );
      },
    );
  }

  Future<void> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Permission has not been granted
      await requestLocationPermission();
    } else if (permission == LocationPermission.deniedForever) {
      await requestLocationPermission();
    }
  }

  Future<void> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      await Geolocator.openLocationSettings();
    }
  }
}
