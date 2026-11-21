import '/backend/supabase/supabase.dart';
import '/components/cadastro_membro_widget.dart';
import '/components/cadastro_membroeditar_widget.dart';
import '/components/menu_lateral_widget.dart';
import '/core/app_enums.dart';
import '/core/app_icon_button.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'g_r_membros_lista_model.dart';
export 'g_r_membros_lista_model.dart';

class GRMembrosListaWidget extends StatefulWidget {
  const GRMembrosListaWidget({
    super.key,
    required this.recebeIdGR,
  });

  final TbGrsRow? recebeIdGR;

  static String routeName = 'GRMembrosLista';
  static String routePath = '/gRMembrosLista';

  @override
  State<GRMembrosListaWidget> createState() => _GRMembrosListaWidgetState();
}

class _GRMembrosListaWidgetState extends State<GRMembrosListaWidget> {
  late GRMembrosListaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createAppModel(context, () => GRMembrosListaModel());
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
        backgroundColor: AppTheme.of(context).primaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithAppModel(
            model: _model.menuLateralModel,
            updateCallback: () => safeSetState(() {}),
            child: MenuLateralWidget(),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: AppBar(
            backgroundColor: AppTheme.of(context).primary,
            automaticallyImplyLeading: false,
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 45.0,
                decoration: BoxDecoration(
                  color: AppTheme.of(context).alternate,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment:
                            (AppCrossAxisAlignment.start).flutterValue,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: AppIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  fillColor: AppTheme.of(context).primary,
                                  icon: Icon(
                                    Icons.menu,
                                    color: AppTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Membros',
                                  textAlign: TextAlign.start,
                                  style:
                                      AppTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: AppTheme.of(context)
                                                .bodyMedium
                                                .fontStyle,
                                          ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment:
                            (AppCrossAxisAlignment.stretch).flutterValue,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment:
                                (AppMainAxisAlignment.end).flutterValue,
                            children: [
                              AppIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor: AppTheme.of(context).primary,
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: AppTheme.of(context).info,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.safePop();
                                },
                              ),
                              Builder(
                                builder: (context) => Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: AppButton(
                                    onPressed: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(dialogContext)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: CadastroMembroWidget(
                                                recebeinfoGR:
                                                    widget!.recebeIdGR!,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    text: 'Add Membro',
                                    options: AppButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: AppTheme.of(context).primary,
                                      textStyle: AppTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight: AppTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                              fontStyle: AppTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: AppTheme.of(context)
                                                .titleSmall
                                                .fontWeight,
                                            fontStyle: AppTheme.of(context)
                                                .titleSmall
                                                .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 700.0,
                decoration: BoxDecoration(
                  color: AppTheme.of(context).alternate,
                ),
                child: FutureBuilder<List<VwGrMembrosRow>>(
                  future: VwGrMembrosTable().queryRows(
                    queryFn: (q) => q
                        .eqOrNull(
                          'gr_id',
                          widget!.recebeIdGR?.id,
                        )
                        .eqOrNull(
                          'ativo',
                          true,
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
                              AppTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<VwGrMembrosRow> listMembrosdoGRVwGrMembrosRowList =
                        snapshot.data!;

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listMembrosdoGRVwGrMembrosRowList.length,
                      itemBuilder: (context, listMembrosdoGRIndex) {
                        final listMembrosdoGRVwGrMembrosRow =
                            listMembrosdoGRVwGrMembrosRowList[
                                listMembrosdoGRIndex];
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                MembrosDetalhesWidget.routeName,
                                queryParameters: {
                                  'recebeIdMembro': serializeParam(
                                    listMembrosdoGRVwGrMembrosRow,
                                    ParamType.SupabaseRow,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                                  (AppCrossAxisAlignment.center).flutterValue,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        listMembrosdoGRVwGrMembrosRow.nome,
                                        'Nome',
                                      ),
                                      style: AppTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: AppTheme.of(context)
                                                .bodyMedium
                                                .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        (AppCrossAxisAlignment.end)
                                            .flutterValue,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Builder(
                                        builder: (context) => AppIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              AppTheme.of(context).primary,
                                          icon: Icon(
                                            Icons.edit,
                                            color: AppTheme.of(context).info,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child:
                                                        CadastroMembroeditarWidget(
                                                      editMembro:
                                                          listMembrosdoGRVwGrMembrosRow,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      AppIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 40.0,
                                        fillColor: AppTheme.of(context).primary,
                                        icon: Icon(
                                          Icons.remove_sharp,
                                          color: AppTheme.of(context).info,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Inativar Membro'),
                                                        content: Text(
                                                            'Deseja inativar o membro do GR?'),
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
                                            await TbMembrosTable().update(
                                              data: {
                                                'ativo': false,
                                              },
                                              matchingRows: (rows) =>
                                                  rows.eqOrNull(
                                                'id',
                                                listMembrosdoGRVwGrMembrosRow
                                                    .membroId,
                                              ),
                                            );
                                            await TbGrMembrosTable().update(
                                              data: {
                                                'ativo': false,
                                              },
                                              matchingRows: (rows) =>
                                                  rows.eqOrNull(
                                                'membro_id',
                                                listMembrosdoGRVwGrMembrosRow
                                                    .membroId,
                                              ),
                                            );
                                            safeSetState(() {});
                                          }
                                        },
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
