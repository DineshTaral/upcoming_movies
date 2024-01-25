part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final int selectedIndex;

  DashboardState({required this.selectedIndex});

  factory DashboardState.initial() => DashboardState(selectedIndex: 0);

  DashboardState copyWith({int? selectedIndex}) =>
      DashboardState(selectedIndex: selectedIndex ?? this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}
