import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/home';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: theme.primaryBackground,
        appBar: AppBar(
          backgroundColor: theme.primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Projeto Senai',
            style: theme.headlineMedium.override(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<RequisicaoRow>>(
            future: SQLiteManager.instance.requisicao(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: SpinKitRotatingCircle(
                      color: theme.primary,
                      size: 40.0,
                    ),
                  ),
                );
              }

              final chamados = snapshot.data!;
              final recentes = chamados.reversed.take(3).toList();

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: theme.secondaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [theme.designToken.shadow.md],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Central de chamados',
                            style: theme.headlineSmall,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Gerencie solicitacoes e acompanhe os registros salvos no banco local do app.',
                            style: theme.bodyMedium.override(
                              color: theme.secondaryText,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Wrap(
                            spacing: 12.0,
                            runSpacing: 12.0,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                    ChamadosWidget.routeName,
                                    extra: <String, dynamic>{
                                      '__transition_info__': TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                        duration:
                                            const Duration(milliseconds: 200),
                                      ),
                                    },
                                  );
                                },
                                text: 'Ver Chamados',
                                options: FFButtonOptions(
                                  height: 44.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  color: theme.primary,
                                  textStyle: theme.titleSmall.override(
                                    color: Colors.white,
                                  ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                    SimularpedidoWidget.routeName,
                                    extra: <String, dynamic>{
                                      '__transition_info__': TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                        duration:
                                            const Duration(milliseconds: 200),
                                      ),
                                    },
                                  );
                                },
                                text: 'Novo Chamado',
                                options: FFButtonOptions(
                                  height: 44.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  color: theme.secondary,
                                  textStyle: theme.titleSmall.override(
                                    color: Colors.white,
                                  ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(
                          child: _SummaryCard(
                            title: 'Total de chamados',
                            value: chamados.length.toString(),
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Expanded(
                          child: _SummaryCard(
                            title: 'Ultimo ID',
                            value: chamados.isEmpty
                                ? '--'
                                : chamados.last.id.toString(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Registros recentes',
                      style: theme.titleLarge,
                    ),
                    const SizedBox(height: 12.0),
                    if (recentes.isEmpty)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18.0),
                        decoration: BoxDecoration(
                          color: theme.secondaryBackground,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Text(
                          'Nenhum chamado encontrado no banco local.',
                          style: theme.bodyMedium.override(
                            color: theme.secondaryText,
                          ),
                        ),
                      ),
                    ...recentes.map(
                      (chamado) => Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: theme.secondaryBackground,
                            borderRadius: BorderRadius.circular(14.0),
                            boxShadow: [theme.designToken.shadow.sm],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '#${chamado.id} - ${chamado.nome}',
                                style: theme.titleMedium,
                              ),
                              const SizedBox(height: 6.0),
                              Text(
                                chamado.tipo.isEmpty
                                    ? 'Tipo nao informado'
                                    : chamado.tipo,
                                style: theme.bodyMedium.override(
                                  color: theme.secondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 6.0),
                              Text(
                                chamado.descricao.isEmpty
                                    ? 'Sem descricao'
                                    : chamado.descricao,
                                style: theme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: [theme.designToken.shadow.sm],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.bodyMedium.override(
              color: theme.secondaryText,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            value,
            style: theme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
