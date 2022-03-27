import 'package:sih2022/forumpage_update/forumpage_update_widget.dart';

import '../components/forum1_widget.dart';
import '../components/info_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../api_endpoint.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ForumWidget extends StatefulWidget {
  const ForumWidget({Key key}) : super(key: key);

  @override
  _ForumWidgetState createState() => _ForumWidgetState();
}

class _ForumWidgetState extends State<ForumWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool available = false;
  var values;
  String endpoint = Endpoint();
  void initState() {
    super.initState();
    getStatus();
  }

  void getStatus() async {
    print("Hi");
    try {
      String url = endpoint + "/api/getcommunity";
      print(url);
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          values = data;
          available = true;
        });
        print(values);
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('No Interent Found, try again'),
            backgroundColor: Colors.redAccent),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xC4050E6A),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForumpageUpdateWidget(),
                    ),
                  );
        },
        backgroundColor: Color(0xFFFEFEFE),
        elevation: 8,
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: 30,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: InfoWidget(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if(available)
                ...(values).map((value){
                  return Forum1Widget(value);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
