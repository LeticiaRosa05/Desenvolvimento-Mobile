import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'recuperar_conta_widget.dart' show RecuperarContaWidget;
import 'package:flutter/material.dart';

class RecuperarContaModel extends FlutterFlowModel<RecuperarContaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
