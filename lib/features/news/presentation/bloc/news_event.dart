import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object?> get props => [];
}

class FetchNews extends NewsEvent {
  final bool forceRefresh;

  const FetchNews({this.forceRefresh = false});

  @override
  List<Object?> get props => [forceRefresh];
}
