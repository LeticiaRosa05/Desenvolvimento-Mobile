import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'inicial_widget.dart' show InicialWidget;
import 'package:flutter/material.dart';

class InicialModel extends FlutterFlowModel<InicialWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> resultadoPesq = [];
  void addToResultadoPesq(DocumentReference item) => resultadoPesq.add(item);
  void removeFromResultadoPesq(DocumentReference item) =>
      resultadoPesq.remove(item);
  void removeAtIndexFromResultadoPesq(int index) =>
      resultadoPesq.removeAt(index);
  void insertAtIndexInResultadoPesq(int index, DocumentReference item) =>
      resultadoPesq.insert(index, item);
  void updateResultadoPesqAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      resultadoPesq[index] = updateFn(resultadoPesq[index]);

  ///  State fields for stateful widgets in this page.

  List<AccessRecord> simpleSearchResults1 = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<ListsRecord> simpleSearchResults2 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
