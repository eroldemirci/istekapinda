import 'package:deneme_yeni_istekapinda/Pages/searchPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarContainer extends StatelessWidget {
  TextEditingController searchTextCntrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shadowColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: GestureDetector(
          onTap: () => Get.to(SearchPage()),
          child: TextFormField(
            keyboardType: TextInputType.text,
            controller: searchTextCntrl,
            enabled: false,
            style: GoogleFonts.sourceSansPro(
              textStyle: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onFieldSubmitted: (value) {
              print(value);
            },
            focusNode: FocusNode(descendantsAreFocusable: false),
            decoration: InputDecoration(
                hintText: 'Marka, ürün ya da kategori ara',
                prefixIcon: Icon(CupertinoIcons.search),
                isDense: true, // important line
                contentPadding: EdgeInsets.fromLTRB(
                    5, 5, 5, 5), // control your hints text size
                hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
                fillColor: Colors.white30,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none)),
          ),
        ),
      ),
    );
  }
}

class SearchBarTextField extends StatelessWidget {
  TextEditingController searchTextCntrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: searchTextCntrl,
        enabled: false,
        style: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(color: Colors.black, fontSize: 18),
        ),
        onFieldSubmitted: (value) {
          print(value);
        },
        focusNode: FocusNode(descendantsAreFocusable: false),
        decoration: InputDecoration(
            hintText: 'Marka, ürün ya da kategori ara',
            prefixIcon: Icon(CupertinoIcons.search),
            isDense: true, // important line
            contentPadding:
                EdgeInsets.fromLTRB(5, 5, 5, 5), // control your hints text size
            hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
