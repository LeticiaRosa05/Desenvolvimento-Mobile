import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'inicial_copy2_widget.dart' show InicialCopy2Widget;
import 'package:flutter/material.dart';

class InicialCopy2Model extends FlutterFlowModel<InicialCopy2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
