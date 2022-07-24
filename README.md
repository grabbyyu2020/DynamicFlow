   动态流是大多数app很重要的一个业务模块，app内各种业务形态都会有相应的一种或多种动态类型，所以导致动态类型繁杂，譬如说文字动态，图片动态，个人作品动态，专辑动态，广告动态，专题动态，活动动态等，且动态流是很重要的给各个业务导流的入口，所以各种动态会做频繁的优化已提高转化率

结合以上的业务特点，动态流模块需要做如下设计：

1. 代码框架支持插件式开发
   其他业务模块需要添加新的动态类型，只需要继承动态视觉交互类ItemView以及视图模型类ItemViewModel，并针对相应的方法做定制实现，然后向工厂对象注册ItemView和ItemViewModel的类，这样做有两点优势，首先，降低添加新动态类型时需要的理解开发成本，只需理清基本的动态的抽象，无需了解动态框架的内部实现，其次，某种动态类型的维护修改只需在该动态类型的ItemView和ItemViewModel中做改动

2. 将动态进一步划分成动态元素，支持动态元素级的复用
   虽然动态类型繁杂，但动态的子视觉元素存在共同性，譬如用户个人信息Item，评论转发点赞Item，纯文字Item，提高视觉Item的复用率，降低动态页的内存占用，提高动态页的滑动帧率

3. 使用视图模型设计模式
   将涉及到UI框架的代码保留在ItemView中，其他逻辑归整到ItemViewModel中，提高单元测试的代码覆盖率，最大可能保证代码被验证，且可常规化重复的做验证，提高app的稳定性

代码库介绍

1. DynamicFlow目录存放动态流框架实现代码
- DynamicCell.m 单个动态的视图
- DynamicCellViewModel.m 单个动态视图的视图模型
- DynamicItemView.m 单个动态Item的视图
- DynamicItemViewModel.m 单个动态Item视图的视图模型
- DynamicItemViewFactory.m 动态Item视图及模型的工厂

2. Dynamic目录存放具体动态Item类型的实现
- Dynamic/Example 动态Item的例子，增加新动态类型可以拷贝这个目录并做相应的修改
- Dynamic/Profile 用户个人信息动态Item
- Dynamic/TextContent 文字动态Item
- Dynamic/ImageContent 图片动态Item
- Dynamic/Interaction 评论转发点赞动态Item

Todo:
1. 动态工厂类剥离具体数据源的逻辑，目前耦合plist的数据源，需要保持动态流框架高复用性
2. 动态框架添加用户交互响应框架
