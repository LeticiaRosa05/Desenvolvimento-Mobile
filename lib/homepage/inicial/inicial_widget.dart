import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'inicial_model.dart';
export 'inicial_model.dart';

class InicialWidget extends StatefulWidget {
  const InicialWidget({
    super.key,
    this.listasAdiciona,
  });

  final List<String>? listasAdiciona;

  static String routeName = 'inicial';
  static String routePath = '/inicial';

  @override
  State<InicialWidget> createState() => _InicialWidgetState();
}

class _InicialWidgetState extends State<InicialWidget> {
  late InicialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InicialModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // PesquisaListasAcesso
      await queryAccessRecordOnce()
          .then(
            (records) => _model.simpleSearchResults1 = TextSearch(
              records
                  .map(
                    (record) =>
                        TextSearchItem.fromTerms(record, [record.userID]),
                  )
                  .toList(),
            ).search(currentUserUid).map((r) => r.object).toList(),
          )
          .onError((_, __) => _model.simpleSearchResults1 = [])
          .whenComplete(() => safeSetState(() {}));
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ListsRecord>>(
      stream: queryListsRecord(
        queryBuilder: (listsRecord) => listsRecord
            .where(
              'marked',
              isEqualTo: true,
            )
            .where(
              'created_by',
              isEqualTo: currentUserReference,
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ListsRecord> inicialListsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                context.pushNamed(ListaWidget.routeName);
              },
              backgroundColor: FlutterFlowTheme.of(context).primary,
              elevation: 8.0,
              child: Icon(
                Icons.add_rounded,
                color: Color(0xFF181818),
                size: 24.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 25.0,
                              borderWidth: 2.0,
                              buttonSize: 45.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.settings_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.pushNamed(
                                  ConfigWidget.routeName,
                                  queryParameters: {
                                    'nomeUsuario': serializeParam(
                                      currentUserReference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '899y2kmb' /* Bem vindo,  */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => AutoSizeText(
                                currentUserDisplayName.maybeHandleOverflow(
                                  maxChars: 10,
                                  replacement: '…',
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    StickyHeader(
                      overlapHeaders: false,
                      header: Visibility(
                        visible:
                            MediaQuery.sizeOf(context).width < kBreakpointSmall
                                ? true
                                : false,
                        child: Container(
                          width: double.infinity,
                          height: 80.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).primaryBackground,
                                FlutterFlowTheme.of(context).secondaryBackground
                              ],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                          ),
                          child: Visibility(
                            visible: () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return true;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return false;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return false;
                              } else {
                                return false;
                              }
                            }(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 12.0),
                              child: Container(
                                width: double.infinity,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 8.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.search_rounded,
                                        color: Color(0xFF606A85),
                                        size: 24.0,
                                      ),

                                      // Revisar pq n quer pesquisar
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 200.0,
                                            child: TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              onFieldSubmitted: (_) async {
                                                await queryListsRecordOnce()
                                                    .then(
                                                      (records) => _model
                                                              .simpleSearchResults2 =
                                                          TextSearch(
                                                        records
                                                            .map(
                                                              (record) =>
                                                                  TextSearchItem
                                                                      .fromTerms(
                                                                          record,
                                                                          [
                                                                    record
                                                                        .content,
                                                                    record
                                                                        .title
                                                                  ]),
                                                            )
                                                            .toList(),
                                                      )
                                                              .search(_model
                                                                  .textController
                                                                  .text)
                                                              .map((r) =>
                                                                  r.object)
                                                              .toList(),
                                                    )
                                                    .onError((_, __) => _model
                                                            .simpleSearchResults2 =
                                                        [])
                                                    .whenComplete(() =>
                                                        safeSetState(() {}));

                                                safeSetState(() {});
                                              },
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '8i36ce6h' /* Procure em suas listas... */,
                                                ),
                                                labelStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.outfit(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.outfit(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts
                                                        .plusJakartaSans(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                              cursorColor: Color(0xFF6F61EF),
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (inicialListsRecordList.isNotEmpty)
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'qxkzh21q' /* Listas marcadas */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.outfit(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          if (inicialListsRecordList.isNotEmpty)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 4.0),
                              child: Container(
                                width: double.infinity,
                                height: 200.0,
                                decoration: BoxDecoration(),
                                child:
                                    // O problema da implementação atual é que para puxar as listas que tenho acesso, uso meu email para pesquisar na tabela de acesso e pego o ID de tal lista, mas não tem como pegar o para fazer uma segunda busca pelo ID dela na tabela de listas.
                                    // Teoricamente, seria necessário que essa busca pelo meu email num campo de acesso teria que ser dentro da lista que tenho acesso mas não é minha, pois assim ela seria puxada como está sendo com a query atual, onde a lista com ascaracterísticas buscadas é puxada.
                                    Visibility(
                                  visible: inicialListsRecordList.isNotEmpty,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: StreamBuilder<List<ListsRecord>>(
                                      stream: queryListsRecord(
                                        queryBuilder: (listsRecord) =>
                                            listsRecord
                                                .where(
                                                  'marked',
                                                  isEqualTo: true,
                                                )
                                                .where(
                                                  'created_by',
                                                  isEqualTo:
                                                      currentUserReference,
                                                ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<ListsRecord>
                                            listViewMarcadasListsRecordList =
                                            snapshot.data!;

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              listViewMarcadasListsRecordList
                                                  .length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(width: 10.0),
                                          itemBuilder:
                                              (context, listViewMarcadasIndex) {
                                            final listViewMarcadasListsRecord =
                                                listViewMarcadasListsRecordList[
                                                    listViewMarcadasIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  ListaWidget.routeName,
                                                  queryParameters: {
                                                    'refListaAtual':
                                                        serializeParam(
                                                      listViewMarcadasListsRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'titulo': serializeParam(
                                                      listViewMarcadasListsRecord
                                                          .title,
                                                      ParamType.String,
                                                    ),
                                                    'corpo': serializeParam(
                                                      listViewMarcadasListsRecord
                                                          .content,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              onLongPress: () async {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Detelar lista'),
                                                              content: Text(
                                                                  'Tem certeza que deseja deletar a lista?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancelar'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Confirmar'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  await listViewMarcadasListsRecord
                                                      .reference
                                                      .delete();
                                                }
                                              },
                                              child: Container(
                                                width: 180.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent3,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 5.0, 7.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          5.0),
                                                              child:
                                                                  AutoSizeText(
                                                                listViewMarcadasListsRecord
                                                                    .content
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 115,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 5,
                                                                minFontSize:
                                                                    14.0,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0xFF181818),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Container(
                                                          width: 157.4,
                                                          height: 51.7,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        -1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    listViewMarcadasListsRecord
                                                                        .title
                                                                        .maybeHandleOverflow(
                                                                      maxChars:
                                                                          7,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    minFontSize:
                                                                        14.0,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.interTight(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        1.0),
                                                                child: Stack(
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            7.0,
                                                                            7.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              36.1,
                                                                          height:
                                                                              36.1,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent3,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -3.0,
                                                                          0.34),
                                                                      child:
                                                                          FlutterFlowIconButton(
                                                                        borderRadius:
                                                                            8.0,
                                                                        buttonSize:
                                                                            40.0,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .push_pin,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          await listViewMarcadasListsRecord
                                                                              .reference
                                                                              .update(createListsRecordData(
                                                                            marked:
                                                                                false,
                                                                          ));
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 0.0, 12.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'hzac5n3n' /* Minhas listas */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),

                        // Essa está 100% correta. São as minhas listas que não estão mascadas
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: StreamBuilder<List<ListsRecord>>(
                            stream: queryListsRecord(
                              queryBuilder: (listsRecord) => listsRecord
                                  .where(
                                    'marked',
                                    isEqualTo: false,
                                  )
                                  .where(
                                    'created_by',
                                    isEqualTo: currentUserReference,
                                  ),
                            ),
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
                              List<ListsRecord>
                                  gridViewMinhasListasListsRecordList =
                                  snapshot.data!;

                              return GridView.builder(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  12.0,
                                  0,
                                  12.0,
                                ),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12.0,
                                  mainAxisSpacing: 12.0,
                                  childAspectRatio: 1.0,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    gridViewMinhasListasListsRecordList.length,
                                itemBuilder:
                                    (context, gridViewMinhasListasIndex) {
                                  final gridViewMinhasListasListsRecord =
                                      gridViewMinhasListasListsRecordList[
                                          gridViewMinhasListasIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        ListaWidget.routeName,
                                        queryParameters: {
                                          'refListaAtual': serializeParam(
                                            gridViewMinhasListasListsRecord
                                                .reference,
                                            ParamType.DocumentReference,
                                          ),
                                          'titulo': serializeParam(
                                            gridViewMinhasListasListsRecord
                                                .title,
                                            ParamType.String,
                                          ),
                                          'corpo': serializeParam(
                                            gridViewMinhasListasListsRecord
                                                .content,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    onLongPress: () async {
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title:
                                                        Text('Detelar lista'),
                                                    content: Text(
                                                        'Tem certeza que deseja deletar a lista?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text('Cancelar'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child:
                                                            Text('Confirmar'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        await gridViewMinhasListasListsRecord
                                            .reference
                                            .delete();
                                      }
                                    },
                                    child: Container(
                                      width: 170.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 7.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 5.0,
                                                                5.0, 5.0),
                                                    child: AutoSizeText(
                                                      gridViewMinhasListasListsRecord
                                                          .content
                                                          .maybeHandleOverflow(
                                                        maxChars: 115,
                                                        replacement: '…',
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 5,
                                                      minFontSize: 14.0,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF181818),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Container(
                                                width: 157.4,
                                                height: 51.7,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          gridViewMinhasListasListsRecord
                                                              .title
                                                              .maybeHandleOverflow(
                                                            maxChars: 7,
                                                            replacement: '…',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          minFontSize: 14.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .interTight(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 1.0),
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          7.0,
                                                                          7.0),
                                                              child: Container(
                                                                width: 36.1,
                                                                height: 36.1,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -2.68,
                                                                    0.68),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 40.0,
                                                              icon: Icon(
                                                                Icons
                                                                    .push_pin_outlined,
                                                                color: Colors
                                                                    .black,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                await gridViewMinhasListasListsRecord
                                                                    .reference
                                                                    .update(
                                                                        createListsRecordData(
                                                                  marked: true,
                                                                ));
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 0.0, 12.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'sv2qdwc8' /* Listas que tenho acesso */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                        if (_model.simpleSearchResults1.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Builder(
                              builder: (context) {
                                final listaQueTenhoAcesso =
                                    _model.simpleSearchResults1.toList();

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listaQueTenhoAcesso.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 10.0),
                                  itemBuilder:
                                      (context, listaQueTenhoAcessoIndex) {
                                    final listaQueTenhoAcessoItem =
                                        listaQueTenhoAcesso[
                                            listaQueTenhoAcessoIndex];
                                    return StreamBuilder<List<ListsRecord>>(
                                      stream: queryListsRecord(
                                        queryBuilder: (listsRecord) =>
                                            listsRecord.where(
                                          'listaID',
                                          isEqualTo:
                                              listaQueTenhoAcessoItem.lista,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<ListsRecord>
                                            containerListsRecordList =
                                            snapshot.data!;

                                        return Container(
                                          width: 170.0,
                                          height: 373.1,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final itemListaQuetenhoAcesso =
                                                      containerListsRecordList
                                                          .toList();

                                                  return GridView.builder(
                                                    padding: EdgeInsets.zero,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: 10.0,
                                                      mainAxisSpacing: 10.0,
                                                      childAspectRatio: 1.0,
                                                    ),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        itemListaQuetenhoAcesso
                                                            .length,
                                                    itemBuilder: (context,
                                                        itemListaQuetenhoAcessoIndex) {
                                                      final itemListaQuetenhoAcessoItem =
                                                          itemListaQuetenhoAcesso[
                                                              itemListaQuetenhoAcessoIndex];
                                                      return Visibility(
                                                        visible:
                                                            itemListaQuetenhoAcessoItem
                                                                    .listaID ==
                                                                listaQueTenhoAcessoItem
                                                                    .lista,
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              ListaWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'refListaAtual':
                                                                    serializeParam(
                                                                  itemListaQuetenhoAcessoItem
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'titulo':
                                                                    serializeParam(
                                                                  itemListaQuetenhoAcessoItem
                                                                      .title,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'corpo':
                                                                    serializeParam(
                                                                  itemListaQuetenhoAcessoItem
                                                                      .content,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          onLongPress:
                                                              () async {
                                                            var confirmDialogResponse =
                                                                await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Detelar lista'),
                                                                          content:
                                                                              Text('Tem certeza que deseja deletar a lista?'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: Text('Cancelar'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: Text('Confirmar'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (confirmDialogResponse) {
                                                              await itemListaQuetenhoAcessoItem
                                                                  .reference
                                                                  .delete();
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 170.0,
                                                            height: 125.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent3,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          7.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              5.0,
                                                                              5.0,
                                                                              5.0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            itemListaQuetenhoAcessoItem.content.maybeHandleOverflow(
                                                                              maxChars: 115,
                                                                              replacement: '…',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            maxLines:
                                                                                5,
                                                                            minFontSize:
                                                                                14.0,
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF181818),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          157.4,
                                                                      height:
                                                                          51.7,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent4,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
                                                                              child: AutoSizeText(
                                                                                itemListaQuetenhoAcessoItem.title.maybeHandleOverflow(
                                                                                  maxChars: 7,
                                                                                  replacement: '…',
                                                                                ),
                                                                                textAlign: TextAlign.start,
                                                                                minFontSize: 14.0,
                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                      font: GoogleFonts.interTight(
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, 1.0),
                                                                            child:
                                                                                Stack(
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(1.0, 1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 7.0, 7.0),
                                                                                    child: Container(
                                                                                      width: 36.1,
                                                                                      height: 36.1,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).accent3,
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),

                                                                                // Revisar ação -> não ta sumindo automaticamente quando exclui o acesso
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-2.36, -0.06),
                                                                                  child: FlutterFlowIconButton(
                                                                                    borderRadius: 8.0,
                                                                                    buttonSize: 40.0,
                                                                                    icon: Icon(
                                                                                      Icons.person_remove_alt_1_sharp,
                                                                                      color: Colors.black,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      await listaQueTenhoAcessoItem.reference.delete();
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            title: Text('Remoção de acesso'),
                                                                                            content: Text('Você se deletou da lista com sucesso.'),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                child: Text('Ok'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                      // PesquisaListasAcesso
                                                                                      await queryListsRecordOnce(
                                                                                        queryBuilder: (listsRecord) => listsRecord.where(
                                                                                          'listaID',
                                                                                          isEqualTo: listaQueTenhoAcessoItem.lista,
                                                                                        ),
                                                                                        singleRecord: true,
                                                                                      ).then((s) => s.firstOrNull);

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
