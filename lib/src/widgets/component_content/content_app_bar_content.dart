import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class ContentAppBarContent extends StatelessWidget {
  const ContentAppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      examples: const [
        ComponentExample(
          id: 'basic',
          title: 'Uso básico',
          description: 'Título y botón de retroceso por defecto.',
          previewWidget: _PreviewBasic(),
          codeExample: '''Scaffold(
  appBar: ContentAppBar(
    title: 'Componentes',
  ),
  body: ...,
)''',
        ),
        ComponentExample(
          id: 'with_hint',
          title: 'Con sugerencia UX',
          description: 'Muestra un chip informativo bajo el título.',
          previewWidget: _PreviewWithHint(),
          codeExample: '''Scaffold(
  appBar: ContentAppBar(
    title: 'Botones',
    hintText: 'Sugerencia: usa títulos claros y concisos.',
  ),
  body: ...,
)''',
        ),
      ],
      properties: const [
        ComponentProperty(
          name: 'title',
          type: 'String',
          description: 'Título mostrado en el app bar.',
          required: true,
        ),
        ComponentProperty(
          name: 'hintText',
          type: 'String?',
          description: 'Texto de sugerencia UX opcional mostrado bajo el título.',
        ),
        ComponentProperty(
          name: 'onBack',
          type: 'VoidCallback?',
          description: 'Callback para el botón de retroceso. Por defecto usa Navigator.maybePop.',
        ),
        ComponentProperty(
          name: 'actions',
          type: 'List<Widget>?',
          description: 'Acciones a la derecha del app bar.',
        ),
        ComponentProperty(
          name: 'showDivider',
          type: 'bool',
          description: 'Muestra un separador inferior sutil.',
          defaultValue: 'true',
        ),
        ComponentProperty(
          name: 'backgroundColor',
          type: 'Color?',
          description: 'Color de fondo. Por defecto usa theme.colorScheme.surface.',
        ),
      ],
      methods: const [],
      usageNotes: 'Ideal para pantallas de documentación de componentes. Mantén la sugerencia breve y accionable.',
    );
  }
}

class _PreviewBasic extends StatelessWidget {
  const _PreviewBasic();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: const ContentAppBar(title: 'Componentes'),
    );
  }
}

class _PreviewWithHint extends StatelessWidget {
  const _PreviewWithHint();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight + 36,
      child: const ContentAppBar(
        title: 'Botones',
        hintText: 'Sugerencia: usa títulos claros y concisos.',
      ),
    );
  }
}


