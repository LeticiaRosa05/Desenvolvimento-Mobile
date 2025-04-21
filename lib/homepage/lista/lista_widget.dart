import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'lista_model.dart';
export 'lista_model.dart';

class ListaWidget extends StatefulWidget {
  const ListaWidget({
    super.key,
    this.titulo,
    this.corpo,
    this.referenceDocument,
  });

  final String? titulo;
  final String? corpo;

  /// referenceDocument
  final DocumentReference? referenceDocument;

  static String routeName = 'lista';
  static String routePath = '/lista';

  @override
  State<ListaWidget> createState() => _ListaWidgetState();
}

class _ListaWidgetState extends State<ListaWidget> {
  late ListaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaModel());

    _model.tituloTextController ??= TextEditingController(text: widget.titulo);
    _model.tituloFocusNode ??= FocusNode();

    _model.campoTextoTextController ??=
        TextEditingController(text: widget.corpo);
    _model.campoTextoFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 80.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed(InicialWidget.routeName);
            },
          ),
          title: Visibility(
            visible: widget.referenceDocument?.id != null &&
                widget.referenceDocument?.id != '',
            child: Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.check_sharp,
                  size: 24.0,
                ),
                onPressed: () async {
                  await widget.referenceDocument!.update(createListsRecordData(
                    title: _model.tituloTextController.text,
                    content: _model.campoTextoTextController.text,
                  ));
                },
              ),
            ),
          ),
          actions: [
            Visibility(
              visible: widget.referenceDocument?.id == null ||
                  widget.referenceDocument?.id == '',
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: FlutterFlowIconButton(
                  borderRadius: 8.0,
                  borderWidth: 1.0,
                  buttonSize: 80.0,
                  icon: Icon(
                    Icons.add,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    await ListsRecord.collection
                        .doc()
                        .set(createListsRecordData(
                          title: _model.tituloTextController.text,
                          createdBy: currentUserReference,
                          content: _model.campoTextoTextController.text,
                          marked: false,
                        ));
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Sucesso'),
                          content: Text('Criado com sucesso'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.more_vert,
                size: 24.0,
              ),
              onPressed: () async {
                await widget.referenceDocument!.delete();

                context.pushNamed(InicialWidget.routeName);
              },
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StreamBuilder<List<ListsRecord>>(
                    stream: queryListsRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<ListsRecord> tituloListsRecordList = snapshot.data!;

                      return Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.tituloTextController,
                          focusNode: _model.tituloFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 28.0,
                                  letterSpacing: 0.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              '0mv24srz' /* Titulo: */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 28.0,
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Inter Tight',
                                    fontSize: 28.0,
                                    letterSpacing: 0.0,
                                  ),
                          maxLines: null,
                          minLines: 1,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.tituloTextControllerValidator
                              .asValidator(context),
                        ),
                      );
                    },
                  ),
                  Container(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.campoTextoTextController,
                      focusNode: _model.campoTextoFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                        hintText: FFLocalizations.of(context).getText(
                          'yxoxy2cj' /* Comece a escrever: */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                      maxLines: null,
                      minLines: 1,
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator: _model.campoTextoTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
