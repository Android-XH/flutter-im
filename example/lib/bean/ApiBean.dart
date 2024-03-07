/// title : "初始化"
/// children : [{"title":"构造配置项目","className":"CreateSyOptions"},{"title":"调用INIT","className":"SyClientInit"}]

class ApiBean {
  ApiBean({
      String? title, 
      List<Children>? children,}){
    _title = title;
    _children = children;
}

  ApiBean.fromJson(dynamic json) {
    _title = json['title'];
    if (json['children'] != null) {
      _children = [];
      json['children'].forEach((v) {
        _children?.add(Children.fromJson(v));
      });
    }
  }
  String? _title;
  List<Children>? _children;
ApiBean copyWith({  String? title,
  List<Children>? children,
}) => ApiBean(  title: title ?? _title,
  children: children ?? _children,
);
  String? get title => _title;
  List<Children>? get children => _children;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// title : "构造配置项目"
/// className : "CreateSyOptions"

class Children {
  Children({
      String? title, 
      String? className,}){
    _title = title;
    _className = className;
}

  Children.fromJson(dynamic json) {
    _title = json['title'];
    _className = json['className'];
  }
  String? _title;
  String? _className;
Children copyWith({  String? title,
  String? className,
}) => Children(  title: title ?? _title,
  className: className ?? _className,
);
  String? get title => _title;
  String? get className => _className;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['className'] = _className;
    return map;
  }

}