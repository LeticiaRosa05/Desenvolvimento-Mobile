import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'inicial_copy_widget.dart' show InicialCopyWidget;
import 'package:flutter/material.dart';

class InicialCopyModel extends FlutterFlowModel<InicialCopyWidget> {
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
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  List<ListsRecord> simpleSearchResults2 = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  List<ListsRecord> simpleSearchResults3 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
