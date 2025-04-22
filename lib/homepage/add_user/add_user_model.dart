import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_user_widget.dart' show AddUserWidget;
import 'package:flutter/material.dart';

class AddUserModel extends FlutterFlowModel<AddUserWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailUser widget.
  FocusNode? emailUserFocusNode;
  TextEditingController? emailUserTextController;
  String? Function(BuildContext, String?)? emailUserTextControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailUserFocusNode?.dispose();
    emailUserTextController?.dispose();
  }
}
