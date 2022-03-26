import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsUpdatesWidget extends StatefulWidget {
  const NewsUpdatesWidget({Key key}) : super(key: key);

  @override
  _NewsUpdatesWidgetState createState() => _NewsUpdatesWidgetState();
}

class _NewsUpdatesWidgetState extends State<NewsUpdatesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: FlutterFlowWebView(
          url: 'https://twitter.com/aicte_india/with_replies?lang=hi',
          bypass: false,
          verticalScroll: false,
          horizontalScroll: false,
        ),
      ),
    );
  }
}
