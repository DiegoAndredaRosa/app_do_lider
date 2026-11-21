import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/menu_lateral_widget.dart';
import '/components/radio_btn_componente_widget.dart';
import '/core/app_enums.dart';
import '/core/app_icon_button.dart';
import '/core/app_theme.dart';
import '/core/app_utils.dart';
import '/core/app_widgets.dart';
import '/core/instant_timer.dart';
import 'dart:ui';
import '/core/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'g_r_membros_lista_chamada_radios_model.dart';
export 'g_r_membros_lista_chamada_radios_model.dart';

class GRMembrosListaChamadaRadiosWidget extends StatefulWidget {
  const GRMembrosListaChamadaRadiosWidget({
    super.key,
    required this.recebeIdChamada,
    required this.recebeIdGRplista,
  });

  final TbChamadaRow? recebeIdChamada;
  final TbGrsRow? recebeIdGRplista;

  static String routeName = 'GRMembrosListaChamadaRadios';
  static String routePath = '/gRMembrosListaChamadaRadios';

  @override
  State<GRMembrosListaChamadaRadiosWidget> createState() =>
      _GRMembrosListaChamadaRadiosWidgetState();
}

class _GRMembrosListaChamadaRadiosWidgetState
    extends State<GRMembrosListaChamadaRadiosWidget> {
  late GRMembrosListaChamadaRadiosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createAppModel(context, () => GRMembrosListaChamadaRadiosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.listaOrdenadaSalvar = await VwGrMembrosTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'gr_id',
              widget!.recebeIdGRplista?.id,
            )
            .order('nome', ascending: true),
      );
      AppState().contadorlistaMembrosChamada = -1;
      safeSetState(() {});
      _model.instantTimer2 = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          while (AppState().contadorlistaMembrosChamada <=
              _model.listaOrdenadaSalvar!.length) {
            AppState().contadorlistaMembrosChamada =
                AppState().contadorlistaMembrosChamada + 1;
            safeSetState(() {});
            AppState().addToListaMembrosState(DTlistaMembrosStruct(
              nome: _model.listaOrdenadaSalvar
                  ?.elementAtOrNull(AppState().contadorlistaMembrosChamada)
                  ?.nome,
              idMembro: _model.listaOrdenadaSalvar
                  ?.elementAtOrNull(AppState().contadorlistaMembrosChamada)
                  ?.membroId,
              radioBtnState: 'Ausente',
              radioBtnmarcado: false,
            ));
            safeSetState(() {});
          }
          _model.instantTimer2?.cancel();
        },
        startImmediately: true,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<AppState>();

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
                child: FutureBuilder<List<VwGrMembrosRow>>(
                  future: VwGrMembrosTable().queryRows(
                    queryFn: (q) => q
                        .eqOrNull(
                          'gr_id',
                          widget!.recebeIdGRplista?.id,
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
                                      (AppCrossAxisAlignment.end).flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    wrapWithAppModel(
                                      model: _model.radioBtnComponenteModels
                                          .getModel(
                                        listMembrosdoGRVwGrMembrosRow
                                            .grMembroId!
                                            .toString(),
                                        listMembrosdoGRIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: RadioBtnComponenteWidget(
                                        key: Key(
                                          'Keyp5t_${listMembrosdoGRVwGrMembrosRow.grMembroId!.toString()}',
                                        ),
                                        recebeMembroId:
                                            listMembrosdoGRVwGrMembrosRow,
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
              Container(
                width: 100.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: AppTheme.of(context).secondaryBackground,
                ),
                child: AppButton(
                  onPressed: () async {
                    AppState().contadorlistaMembrosChamada = -1;
                    safeSetState(() {});
                    _model.instantTimerSalvar = InstantTimer.periodic(
                      duration: Duration(milliseconds: 1000),
                      callback: (timer) async {
                        while (AppState().contadorlistaMembrosChamada <=
                            AppState().listaMembrosState.length) {
                          AppState().contadorlistaMembrosChamada =
                              AppState().contadorlistaMembrosChamada + 1;
                          safeSetState(() {});
                          await TbPresencaTable().insert({
                            'presenca_status': functions
                                .formataBooleanAusentePresente(AppState()
                                    .listaMembrosState
                                    .elementAtOrNull(
                                        AppState().contadorlistaMembrosChamada)!
                                    .radioBtnState),
                            'chamada_id': widget!.recebeIdChamada?.id,
                            'membro_id': AppState()
                                .listaMembrosState
                                .elementAtOrNull(
                                    AppState().contadorlistaMembrosChamada)
                                ?.idMembro,
                          });
                        }
                        _model.instantTimerSalvar?.cancel();
                        AppState().listaMembrosState = [];
                        safeSetState(() {});
                        await TbChamadaTable().update(
                          data: {
                            'chamada_feita': true,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'id',
                            widget!.recebeIdChamada?.id,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Presenças salvas com sucesso',
                              style: TextStyle(
                                color: AppTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: AppTheme.of(context).secondary,
                          ),
                        );
                        context.safePop();
                      },
                      startImmediately: true,
                    );
                  },
                  text: 'Salvar',
                  options: AppButtonOptions(
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: AppTheme.of(context).primary,
                    textStyle: AppTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FontWeight.bold,
                            fontStyle:
                                AppTheme.of(context).titleSmall.fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: AppTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
