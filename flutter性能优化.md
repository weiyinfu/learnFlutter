https://www.zhihu.com/question/289992028/answer/2357006368


# stateful组件中build()方法中不要堆砌太多widget
每次build会发生组件级的重绘，让stateful组件尽量小能够减少重绘的开销。  

# 列表优化
在构建大型网格或列表的时候，我们要尽量避免使用 `ListView(children: [],)` 或 `GridView(children: [],)`。因为，在这种场景下，不管列表内容是否可见，会导致列表中所有的数据都会被一次性绘制出来，这种用法类似于 Android 的 ScrollView。如果我们列表数据比较大的时候，建议使用 ListView 和 GridView 的 builder 方法，它们只会绘制可见的列表内容，类似于 Android 的 RecyclerView。其实，本质上，就是对列表采用了懒加载而不是直接一次性创建所有的子 Widget，这样视图的初始化时间就减少了。

# 长列表涉及跳转的时候使用itemExtent
针对于长列表，记得在 ListView 中使用 itemExtent。有时候当我们有一个很长的列表，想要用滚动条来大跳时，使用 itemExtent 就很重要了，它会帮助 Flutter 去计算 ListView 的滚动位置而不是计算每一个 Widget 的高度，与此同时，它能够使滚动动画有更好的性能。
