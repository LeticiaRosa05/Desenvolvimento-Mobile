import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_sing_up_widget.dart' show LoginSingUpWidget;
import 'package:flutter/material.dart';

class LoginSingUpModel extends FlutterFlowModel<LoginSingUpWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for emailLogin widget.
  FocusNode? emailLoginFocusNode;
  TextEditingController? emailLoginTextController;
  String? Function(BuildContext, String?)? emailLoginTextControllerValidator;
  // State field(s) for senhaLogin widget.
  FocusNode? senhaLoginFocusNode;
  TextEditingController? senhaLoginTextController;
  late bool senhaLoginVisibility;
  String? Function(BuildContext, String?)? senhaLoginTextControllerValidator;
  // State field(s) for nomeUsuario widget.
  FocusNode? nomeUsuarioFocusNode;
  TextEditingController? nomeUsuarioTextController;
  String? Function(BuildContext, String?)? nomeUsuarioTextControllerValidator;
  // State field(s) for emailCadastro widget.
  FocusNode? emailCadastroFocusNode;
  TextEditingController? emailCadastroTextController;
  String? Function(BuildContext, String?)? emailCadastroTextControllerValidator;
  // State field(s) for senhaCadastro widget.
  FocusNode? senhaCadastroFocusNode;
  TextEditingController? senhaCadastroTextController;
  late bool senhaCadastroVisibility;
  String? Function(BuildContext, String?)? senhaCadastroTextControllerValidator;
  // State field(s) for confirmarSenha widget.
  FocusNode? confirmarSenhaFocusNode;
  TextEditingController? confirmarSenhaTextController;
  late bool confirmarSenhaVisibility;
  String? Function(BuildContext, String?)?
      confirmarSenhaTextControllerValidator;

  @override
  void initState(BuildContext context) {
    senhaLoginVisibility = false;
    senhaCadastroVisibility = false;
    confirmarSenhaVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emailLoginFocusNode?.dispose();
    emailLoginTextController?.dispose();

    senhaLoginFocusNode?.dispose();
    senhaLoginTextController?.dispose();

    nomeUsuarioFocusNode?.dispose();
    nomeUsuarioTextController?.dispose();

    emailCadastroFocusNode?.dispose();
    emailCadastroTextController?.dispose();

    senhaCadastroFocusNode?.dispose();
    senhaCadastroTextController?.dispose();

    confirmarSenhaFocusNode?.dispose();
    confirmarSenhaTextController?.dispose();
  }
}
