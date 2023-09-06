part of 'builder.dart';

///[ProviderBuilder] without injection build provider
///this typedef dependent StatefullWidget
typedef PBuilder<T> = Widget Function(BuildContext context, T provider);

///[ConsumerWidgetBuilder]regular ConsumerBulder
typedef CWSuccessBuilder<T> = Widget Function(BuildContext context, T provider);
typedef CWLoadingBuilder<T> = Widget Function(BuildContext context, T provider);
typedef CWErrorBuilder<T> = Widget Function(
    BuildContext context, T provider, Object e);
