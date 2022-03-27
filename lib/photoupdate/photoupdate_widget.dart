import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../api_endpoint.dart';

class PhotoupdateWidget extends StatefulWidget {
  const PhotoupdateWidget({Key key}) : super(key: key);

  @override
  _PhotoupdateWidgetState createState() => _PhotoupdateWidgetState();
}

class _PhotoupdateWidgetState extends State<PhotoupdateWidget> {
  TextEditingController emailAddressController;
  TextEditingController textController1;
  TextEditingController myBioController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<int> studs = [2, 4, 3];

  ImagePicker picker = ImagePicker();
  File _image;

  int index = 0;

  bool present = false;

  String endpoint = Endpoint();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController(text: 'Subject');
    textController1 = TextEditingController(text: 'Name');
    myBioController = TextEditingController();
  }

  void upload() async {
    try {
      var image_source = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = File(image_source.path);
        present = true;
      });

      print(image_source.path);
      // String x = image_source.path.toString();
      // if (x.contains("IMG")) {
      //   studs = 3;
      // } else {
      //   studs = 4;
      // }
      index++;
      index = index % 3;
      // uploadToServer(File(image_source.path));
    } catch (e) {
      print(e);
    }
  }

  void uploadToServer(File imageFile) async {
    print("hi");
    var stream = new http.ByteStream(imageFile.openRead());
    stream.cast();
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse(
        "https://vision.googleapis.com/v1/images:annotate?key=AIzaSyCVOedDvT-8s3kkaXNzBt_9_r2e4X5KvQM");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('photo', stream, length,
        filename: Path.basename(imageFile.path));

    request.files.add(multipartFile);
    request.send().then((result) async {
      http.Response.fromStream(result).then((response) async {
        if (response.statusCode == 200) {
          print("Uploaded! ");
          print('response.body ' + response.body);
          var data = json.decode(response.body);
          print(data);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Post to Server',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF14181B),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFFDBE2E7),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: Container(
                      width: 90,
                      height: 90,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: present
                          ? Image.file(
                              _image,
                              fit: BoxFit.fitWidth,
                            )
                          : Image.network(
                              'https://images.unsplash.com/photo-1536164261511-3a17e671d380?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=630&q=80'),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 12),
              child: TextFormField(
                onFieldSubmitted: (_) async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavBarPage(initialPage: 'HomePage'),
                    ),
                  );
                },
                readOnly: true,
                controller: myBioController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: present
                      ? studs[index].toString() + " Students"
                      : "Upload picture",
                  labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF95A1AC),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                  hintText: present
                      ? studs[index].toString()
                      : "Enter the picture to show number of students",
                  hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF95A1AC),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFDBE2E7),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFDBE2E7),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF14181B),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                textAlign: TextAlign.start,
                maxLines: 6,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      upload();
                    },
                    text: 'Change Photo',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: Colors.white,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF050E6A),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 8,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0.05),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Save Changes',
                  options: FFButtonOptions(
                    width: 340,
                    height: 60,
                    color: Color(0xC4050E6A),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 2,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
