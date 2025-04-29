import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_user_widget.dart' show AddUserWidget;
import 'package:flutter/material.dart';

class AddUserModel extends FlutterFlowModel<AddUserWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> resultadoBusca = [];
  void addToResultadoBusca(DocumentReference item) => resultadoBusca.add(item);
  void removeFromResultadoBusca(DocumentReference item) =>
      resultadoBusca.remove(item);
  void removeAtIndexFromResultadoBusca(int index) =>
      resultadoBusca.removeAt(index);
  void insertAtIndexInResultadoBusca(int index, DocumentReference item) =>
      resultadoBusca.insert(index, item);
  void updateResultadoBuscaAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      resultadoBusca[index] = updateFn(resultadoBusca[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
