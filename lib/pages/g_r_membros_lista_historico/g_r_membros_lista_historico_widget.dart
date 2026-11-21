import '/backend/supabase/supabase.dart';
import '/components/menu_lateral_widget.dart';
import '/core/app_enums.dart';
import '/core/app_icon_button.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import 'dart:ui';
import '/core/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'g_r_membros_lista_historico_model.dart';
export 'g_r_membros_lista_historico_model.dart';

class GRMembrosListaHistoricoWidget extends StatefulWidget {
  const GRMembrosListaHistoricoWidget({
    super.key,
    required this.recebeIdChamada,
    required this.recebeIdGRplista,
  });

  final TbChamadaRow? recebeIdChamada;
  final TbGrsRow? recebeIdGRplista;

  static String routeName = 'GRMembrosListaHistorico';
  static String routePath = '/gRMembrosListaHistorico';

  @override
  State<GRMembrosListaHistoricoWidget> createState() =>
      _GRMembrosListaHistoricoWidgetState();
}

class _GRMembrosListaHistoricoWidgetState
    extends State<GRMembrosListaHistoricoWidget> {
  late GRMembrosListaHistoricoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createAppModel(context, () => GRMembrosListaHistoricoModel());
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
                                  'Lista Presença',
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: AppIconButton(
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
                height: 680.0,
                decoration: BoxDecoration(
                  color: AppTheme.of(context).alternate,
                ),
                child: FutureBuilder<List<VwPresencaRow>>(
                  future: VwPresencaTable().queryRows(
                    queryFn: (q) => q.eqOrNull(
                      'chamada_id',
                      widget!.recebeIdChamada?.id,
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
                    List<VwPresencaRow> listMembrosdoGRVwPresencaRowList =
                        snapshot.data!;

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listMembrosdoGRVwPresencaRowList.length,
                      itemBuilder: (context, listMembrosdoGRIndex) {
                        final listMembrosdoGRVwPresencaRow =
                            listMembrosdoGRVwPresencaRowList[
                                listMembrosdoGRIndex];
                        return Padding(
                          padding: EdgeInsets.all(8.0),
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
                                      listMembrosdoGRVwPresencaRow.nome,
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
                                      (AppCrossAxisAlignment.end).flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      functions.formataStringAusentePresente(
                                          listMembrosdoGRVwPresencaRow
                                              .presencaStatus!),
                                      style: AppTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                              fontStyle: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: AppTheme.of(context)
                                                .bodyMedium
                                                .fontWeight,
                                            fontStyle: AppTheme.of(context)
                                                .bodyMedium
                                                .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ),
                            ],
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
