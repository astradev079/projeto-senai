import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';

class SimularpedidoWidget extends StatefulWidget {
  const SimularpedidoWidget({super.key});

  static String routeName = 'Simularpedido';
  static String routePath = '/simularpedido';

  @override
  State<SimularpedidoWidget> createState() => _SimularpedidoWidgetState();
}

class _SimularpedidoWidgetState extends State<SimularpedidoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final descricaoController = TextEditingController();

  String? tipoSelecionado;

  static const tiposChamado = <String>[
    'Manutencao',
    'Suporte tecnico',
    'Infraestrutura',
    'Outros',
  ];

  @override
  void dispose() {
    nomeController.dispose();
    descricaoController.dispose();
    super.dispose();
  }

  Future<void> _salvarChamado() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    await SQLiteManager.instance.adicionar(
      nome: nomeController.text.trim(),
      tipo: tipoSelecionado,
      descricao: descricaoController.text.trim(),
    );

    if (!mounted) {
      return;
    }

    context.goNamed(ChamadosWidget.routeName);
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
          title: Text(
            'Novo Chamado',
            style: theme.headlineMedium.override(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
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
                          'Abra um novo chamado',
                          style: theme.headlineSmall,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Preencha os campos abaixo para gravar um registro na tabela de chamados.',
                          style: theme.bodyMedium.override(
                            color: theme.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'Nome',
                    style: theme.titleMedium,
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: nomeController,
                    decoration: _inputDecoration(
                      context,
                      hintText: 'Informe o nome do solicitante',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Informe o nome.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Tipo',
                    style: theme.titleMedium,
                  ),
                  const SizedBox(height: 8.0),
                  DropdownButtonFormField<String>(
                    value: tipoSelecionado,
                    decoration: _inputDecoration(
                      context,
                      hintText: 'Selecione o tipo de chamado',
                    ),
                    items: tiposChamado
                        .map(
                          (tipo) => DropdownMenuItem<String>(
                            value: tipo,
                            child: Text(tipo),
                          ),
                        )
                        .toList(),
                    onChanged: (value) => safeSetState(() {
                      tipoSelecionado = value;
                    }),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Selecione o tipo.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Descricao',
                    style: theme.titleMedium,
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: descricaoController,
                    maxLines: 5,
                    decoration: _inputDecoration(
                      context,
                      hintText: 'Descreva o problema encontrado',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Informe a descricao.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  Wrap(
                    spacing: 12.0,
                    runSpacing: 12.0,
                    children: [
                      FFButtonWidget(
                        onPressed: _salvarChamado,
                        text: 'Salvar',
                        options: FFButtonOptions(
                          height: 44.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
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
                          context.goNamed(HomePageWidget.routeName);
                        },
                        text: 'Cancelar',
                        options: FFButtonOptions(
                          height: 44.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          color: theme.alternate,
                          textStyle: theme.titleSmall,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(
    BuildContext context, {
    required String hintText,
  }) {
    final theme = FlutterFlowTheme.of(context);

    return InputDecoration(
      hintText: hintText,
      hintStyle: theme.bodyMedium.override(
        color: theme.secondaryText,
      ),
      filled: true,
      fillColor: theme.secondaryBackground,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: theme.alternate,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: theme.primary,
          width: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: theme.error,
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: theme.error,
          width: 1.0,
        ),
      ),
    );
  }
}
