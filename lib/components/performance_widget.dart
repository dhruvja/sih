import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PerformanceWidget extends StatefulWidget {
  const PerformanceWidget({Key key}) : super(key: key);

  @override
  _PerformanceWidgetState createState() => _PerformanceWidgetState();
}

class _PerformanceWidgetState extends State<PerformanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xFFFAF9F9),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello World',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello World',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
