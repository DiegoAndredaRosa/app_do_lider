import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
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
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createAppModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.listaGRs = await TbGrsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'usuario_id',
          currentUserUid,
        ),
      );
      final _fnDashboardGeralResult = await SupaFlow.client.rpc(
        'fn_dashboard_geral',
        params: const {},
      );
      _model.fnDashboardGeralResult =
          (_fnDashboardGeralResult as List?)?.toList();

      AppState().dashDadosState = DTdashdadosStruct(
        totalMembrosdt: getJsonField(
          _model.fnDashboardGeralResult?.firstOrNull,
          r'''$.total_membros''',
        ),
        totalReunioesdt: getJsonField(
          _model.fnDashboardGeralResult?.firstOrNull,
          r'''$.total_reunioes''',
        ),
        membrosInativosdt: getJsonField(
          _model.fnDashboardGeralResult?.firstOrNull,
          r'''$.participantes_sem_presenca''',
        ),
        membrosAtivosdt: getJsonField(
          _model.fnDashboardGeralResult?.firstOrNull,
          r'''$.participantes_ativos''',
        ),
      );
      safeSetState(() {});
      final _fnMembrosPorGrupoResult = await SupaFlow.client.rpc(
        'fn_membros_por_grupo',
        params: const {},
      );
      _model.fnMembrosPorGrupoResult =
          (_fnMembrosPorGrupoResult as List?)?.toList();

      AppState().dashMembrospGRJSON =
          _model.fnMembrosPorGrupoResult!.toList().cast<dynamic>();
      safeSetState(() {});
      final _fnTopPresencasResult = await SupaFlow.client.rpc(
        'fn_top_presencas',
        params: const {},
      );
      _model.fnTopPresencasResult = (_fnTopPresencasResult as List?)?.toList();

      AppState().dashtoppresencaJSON =
          _model.fnTopPresencasResult!.toList().cast<dynamic>();
      safeSetState(() {});
      final _fnMenosPresencasResult = await SupaFlow.client.rpc(
        'fn_menos_presencas',
        params: const {},
      );
      _model.fnMenosPresencasResult =
          (_fnMenosPresencasResult as List?)?.toList();

      AppState().dashMenosPresencaJSON =
          _model.fnMenosPresencasResult!.toList().cast<dynamic>();
      safeSetState(() {});
      final _fnProximoAniversarianteResult = await SupaFlow.client.rpc(
        'fn_proximo_aniversariante',
        params: const {},
      );
      _model.fnProximoAniversarianteResult =
          (_fnProximoAniversarianteResult as List?)?.toList();

      AppState().dashProxAniverJSON =
          _model.fnProximoAniversarianteResult!.toList().cast<dynamic>();
      safeSetState(() {});
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
                width: 405.5,
                height: 48.91,
                decoration: BoxDecoration(
                  color: AppTheme.of(context).alternate,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Home',
                        style: AppTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontStyle:
                                    AppTheme.of(context).bodyMedium.fontStyle,
                              ),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle:
                                  AppTheme.of(context).bodyMedium.fontStyle,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'GR\'s do Líder',
                            style: AppTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: AppTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      AppTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                          Container(
                            width: 380.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: AppTheme.of(context).secondaryBackground,
                            ),
                            child: Builder(
                              builder: (context) {
                                final membrospGR =
                                    AppState().dashMembrospGRJSON.toList();

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: membrospGR.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 4.0),
                                  itemBuilder: (context, membrospGRIndex) {
                                    final membrospGRItem =
                                        membrospGR[membrospGRIndex];
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            getJsonField(
                                              membrospGRItem,
                                              r'''$.gr_nome''',
                                            )?.toString(),
                                            'nome GR',
                                          ),
                                          style: AppTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            getJsonField(
                                              membrospGRItem,
                                              r'''$.total_membros''',
                                            )?.toString(),
                                            '0',
                                          ),
                                          style: AppTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                        ),
                                        Text(
                                          'membro(s)',
                                          style: AppTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: (AppMainAxisAlignment.center).flutterValue,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Ativos',
                          style: AppTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      AppTheme.of(context).bodyMedium.fontStyle,
                                ),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle:
                                    AppTheme.of(context).bodyMedium.fontStyle,
                              ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            AppState()
                                .dashDadosState
                                .membrosAtivosdt
                                .toString(),
                            '0',
                          ),
                          style: AppTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      AppTheme.of(context).bodyMedium.fontStyle,
                                ),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle:
                                    AppTheme.of(context).bodyMedium.fontStyle,
                              ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Inativos',
                          style: AppTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      AppTheme.of(context).bodyMedium.fontStyle,
                                ),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle:
                                    AppTheme.of(context).bodyMedium.fontStyle,
                              ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            AppState()
                                .dashDadosState
                                .membrosInativosdt
                                .toString(),
                            '0',
                          ),
                          style: AppTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      AppTheme.of(context).bodyMedium.fontStyle,
                                ),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle:
                                    AppTheme.of(context).bodyMedium.fontStyle,
                              ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Membros',
                          style: AppTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      AppTheme.of(context).bodyMedium.fontStyle,
                                ),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle:
                                    AppTheme.of(context).bodyMedium.fontStyle,
                              ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            AppState().dashDadosState.totalMembrosdt.toString(),
                            '0',
                          ),
                          style: AppTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      AppTheme.of(context).bodyMedium.fontStyle,
                                ),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle:
                                    AppTheme.of(context).bodyMedium.fontStyle,
                              ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Reuniões',
                          style: AppTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      AppTheme.of(context).bodyMedium.fontStyle,
                                ),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle:
                                    AppTheme.of(context).bodyMedium.fontStyle,
                              ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            AppState()
                                .dashDadosState
                                .totalReunioesdt
                                .toString(),
                            '0',
                          ),
                          style: AppTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      AppTheme.of(context).bodyMedium.fontStyle,
                                ),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle:
                                    AppTheme.of(context).bodyMedium.fontStyle,
                              ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'TOP Presença',
                          style: AppTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      AppTheme.of(context).bodyMedium.fontStyle,
                                ),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle:
                                    AppTheme.of(context).bodyMedium.fontStyle,
                              ),
                        ),
                        Container(
                          width: 380.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: AppTheme.of(context).secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final rankingPresenca =
                                  AppState().dashtoppresencaJSON.toList();

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: rankingPresenca.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 4.0),
                                itemBuilder: (context, rankingPresencaIndex) {
                                  final rankingPresencaItem =
                                      rankingPresenca[rankingPresencaIndex];
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          getJsonField(
                                            rankingPresencaItem,
                                            r'''$.nome''',
                                          )?.toString(),
                                          'nome',
                                        ),
                                        style: AppTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          getJsonField(
                                            rankingPresencaItem,
                                            r'''$.presencas''',
                                          )?.toString(),
                                          '0',
                                        ),
                                        style: AppTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        'presença(s)',
                                        style: AppTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          getJsonField(
                                            rankingPresencaItem,
                                            r'''$.percentual_presenca''',
                                          )?.toString(),
                                          '0',
                                        ),
                                        style: AppTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        '%',
                                        style: AppTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Menos Presenças',
                          style: AppTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      AppTheme.of(context).bodyMedium.fontStyle,
                                ),
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle:
                                    AppTheme.of(context).bodyMedium.fontStyle,
                              ),
                        ),
                        Container(
                          width: 380.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: AppTheme.of(context).secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final menosPresencas =
                                  AppState().dashMenosPresencaJSON.toList();

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: menosPresencas.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 4.0),
                                itemBuilder: (context, menosPresencasIndex) {
                                  final menosPresencasItem =
                                      menosPresencas[menosPresencasIndex];
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          getJsonField(
                                            menosPresencasItem,
                                            r'''$.nome''',
                                          )?.toString(),
                                          'nome',
                                        ),
                                        style: AppTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          getJsonField(
                                            menosPresencasItem,
                                            r'''$.presencas''',
                                          )?.toString(),
                                          '0',
                                        ),
                                        style: AppTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        'presença(s)',
                                        style: AppTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          getJsonField(
                                            menosPresencasItem,
                                            r'''$.percentual_presenca''',
                                          )?.toString(),
                                          '0',
                                        ),
                                        style: AppTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        '%',
                                        style: AppTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontStyle: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: AppTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Próximos Aniversários',
                            style: AppTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: AppTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      AppTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                          Container(
                            width: 380.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: AppTheme.of(context).secondaryBackground,
                            ),
                            child: Builder(
                              builder: (context) {
                                final proxAniver =
                                    AppState().dashProxAniverJSON.toList();

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: proxAniver.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 4.0),
                                  itemBuilder: (context, proxAniverIndex) {
                                    final proxAniverItem =
                                        proxAniver[proxAniverIndex];
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            getJsonField(
                                              proxAniverItem,
                                              r'''$.nome''',
                                            )?.toString(),
                                            'nome',
                                          ),
                                          style: AppTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                        ),
                                        Text(
                                          functions.formataDatadoBancopraTela(
                                              getJsonField(
                                            proxAniverItem,
                                            r'''$.proximo_aniversario''',
                                          ).toString()),
                                          style: AppTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      AppTheme.of(context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: AppTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
