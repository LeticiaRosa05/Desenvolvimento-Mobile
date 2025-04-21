import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'lista_copy_widget.dart' show ListaCopyWidget;
import 'package:flutter/material.dart';

class ListaCopyModel extends FlutterFlowModel<ListaCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for titulo widget.
  FocusNode? tituloFocusNode;
  TextEditingController? tituloTextController;
  String? Function(BuildContext, String?)? tituloTextControllerValidator;
  // State field(s) for notas widget.
  FocusNode? notasFocusNode;
  TextEditingController? notasTextController;
  String? Function(BuildContext, String?)? notasTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tituloFocusNode?.dispose();
    tituloTextController?.dispose();

    notasFocusNode?.dispose();
    notasTextController?.dispose();
  }
}
