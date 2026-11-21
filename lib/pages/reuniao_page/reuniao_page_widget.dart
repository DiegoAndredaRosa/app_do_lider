import '/backend/supabase/supabase.dart';
import '/components/cadastro_reuniao_widget.dart';
import '/components/menu_lateral_widget.dart';
import '/core/app_enums.dart';
import '/core/app_icon_button.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import 'dart:ui';
import '/core/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reuniao_page_model.dart';
export 'reuniao_page_model.dart';

class ReuniaoPageWidget extends StatefulWidget {
  const ReuniaoPageWidget({
    super.key,
    required this.recebeIdGR,
  });

  final TbGrsRow? recebeIdGR;

  static String routeName = 'ReuniaoPage';
  static String routePath = '/reuniaoPage';

  @override
  State<ReuniaoPageWidget> createState() => _ReuniaoPageWidgetState();
}

class _ReuniaoPageWidgetState extends State<ReuniaoPageWidget> {
  late ReuniaoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createAppModel(context, () => ReuniaoPageModel());
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
                                  'Reuniões',
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
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment:
                            (AppCrossAxisAlignment.end).flutterValue,
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
                                  child: AppIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    fillColor: AppTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.calendar_month,
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
                                              child: CadastroReuniaoWidget(
                                                recebeGRIdReuniao:
                                                    widget!.recebeIdGR!,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
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
                child: MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  child: Container(
                    width: double.infinity,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: AppTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: FutureBuilder<List<TbChamadaRow>>(
                      future: TbChamadaTable().queryRows(
                        queryFn: (q) => q.orGroupOrNull(orFilterGroup([
                          orFilterLeaf(
                              'chamada_gr_id', 'eq', widget!.recebeIdGR?.id),
                          orFilterLeaf('chamada_feita', 'eq', false),
                        ], isAnd: true)),
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
                        List<TbChamadaRow> listReunioesTbChamadaRowList =
                            snapshot.data!;

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listReunioesTbChamadaRowList.length,
                          itemBuilder: (context, listReunioesIndex) {
                            final listReunioesTbChamadaRow =
                                listReunioesTbChamadaRowList[listReunioesIndex];
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    GRMembrosListaChamadaRadiosWidget.routeName,
                                    queryParameters: {
                                      'recebeIdChamada': serializeParam(
                                        listReunioesTbChamadaRow,
                                        ParamType.SupabaseRow,
                                      ),
                                      'recebeIdGRplista': serializeParam(
                                        widget!.recebeIdGR,
                                        ParamType.SupabaseRow,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      (AppCrossAxisAlignment.center)
                                          .flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          (AppCrossAxisAlignment.start)
                                              .flutterValue,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              (AppCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                listReunioesTbChamadaRow.obs,
                                                'reunião',
                                              ),
                                              textAlign: TextAlign.start,
                                              style: AppTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          AppTheme.of(context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        AppTheme.of(context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              (AppMainAxisAlignment.end)
                                                  .flutterValue,
                                          children: [
                                            Text(
                                              functions
                                                  .formataDatadoBancopraTela(
                                                      listReunioesTbChamadaRow
                                                          .chamadaData!
                                                          .toString()),
                                              textAlign: TextAlign.end,
                                              style: AppTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          AppTheme.of(context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        AppTheme.of(context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ],
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
                  onEnter: ((event) async {
                    safeSetState(() => _model.mouseRegionSairHovered = true);
                  }),
                  onExit: ((event) async {
                    safeSetState(() => _model.mouseRegionSairHovered = false);
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
