import 'base.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

part 'const.dart';

@immutable
class ProviderBuilderWidget<T extends ChangeNotifier> extends AnimatedWidget {
  const ProviderBuilderWidget({
    super.key,
    required this.builder,
    required this.provider,
  }) : super(listenable: provider);
  final T provider;
  final PBuilder<T> builder;

  @override
  Widget build(BuildContext context) => builder(context, provider);
}

@immutable
class ConsumerWidget<T extends ProivderBase> extends StatelessWidget {
  const ConsumerWidget({
    super.key,
    required this.onSuccess,
    this.onLoading,
    this.onError,
  });
  final CWSuccessBuilder<T> onSuccess;
  final CWLoadingBuilder? onLoading;
  final CWErrorBuilder? onError;

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, p, _) {
        if (p.providerStates.loading) {
          return onLoading?.call(context, p) ?? const SizedBox.shrink();
        } else if (p.providerStates.error) {
          return onError?.call(context, p, p.providerStates.message) ??
              Center(child: Text(p.providerStates.message.toString()));
        } else if (p.providerStates.success) {
          return onSuccess(context, p);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
