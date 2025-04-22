import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'lista_widget.dart' show ListaWidget;
import 'package:flutter/material.dart';

class ListaModel extends FlutterFlowModel<ListaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Titulo widget.
  FocusNode? tituloFocusNode;
  TextEditingController? tituloTextController;
  String? Function(BuildContext, String?)? tituloTextControllerValidator;
  // State field(s) for campoTexto widget.
  FocusNode? campoTextoFocusNode;
  TextEditingController? campoTextoTextController;
  String? Function(BuildContext, String?)? campoTextoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tituloFocusNode?.dispose();
    tituloTextController?.dispose();

    campoTextoFocusNode?.dispose();
    campoTextoTextController?.dispose();
  }
}
