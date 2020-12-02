import 'package:event_bus/event_bus.dart';

/// 创建EventBus
EventBus eventBus = EventBus();

/// Event 改变底部下边
class SelectEvent {
  int selectIndex;

  SelectEvent(this.selectIndex);
}