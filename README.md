
## RxSwift-ObjectMapper

这是一个把 `Alamofire` 请求的数据 转成 `ObjectMapper` 形式的 `对象`


### 安装方法(Installation)

你可以通过`CocoaPods` 来使用`RxSwift-ObjectMapper` 在你的Podfile中添加如下配置

RxSwift-ObjectMapper is available through CocoaPods. To install it, simply add the following line to your Podfile:

```
pod 'RxSwift-ObjectMapper', '~> 1.0'
```

然后运行`pod install`


### 使用方法(Usage)

创建一个实现 `Mappable` 协议的`Class` 或者 `Struct`

Create a `Class` or `Struct` which implements the `Mappable` protocol.

如果你返回数据的格式为：

if you get the json like this:

```json
{
    "success":true,
    "msg":"获取用户信息成功",
    "obj":[]
}
```

你可以建立以下两个struct：

you can create two struct like this:

```swift
import Foundation
import ObjectMapper
struct ZJResult<T: Mappable>: Mappable {
    var success: Bool!
    var msg: String!
    var obj: [T]?
    
    init?(map: Map) {
        
    }
    
    // Mappable
    mutating func mapping(map: Map) {
        success     <- map["success"]
        msg         <- map["msg"]
        obj         <- map["obj"]
    }
}
```


```swift
import Foundation
import ObjectMapper
struct ZJArticle: Mappable {
    var title: String!
    var keywords: String!
    var description: String!
    var date: String!
    var path: String!
    var url: String!
    
    init?(map: Map) {
        
    }
    
    // Mappable
    mutating func mapping(map: Map) {
        title    <- map["title"]
        keywords   <- map["keywords"]
        description   <- map["description"]
        date   <- map["date"]
        path   <- map["path"]
        url   <- map["url"]
    }
}
```

添加pod库

add pod

```
pod 'RxAlamofire'
```

然后我们就可以这样请求数据了

then we can query data like this:

```swift
_ = string(.get,
    "http://www.psvmc.cn/navi_list.json",
    parameters: ["userPhone":"15225178360","userLoginPswd":"123456"])
    .observeOn(MainScheduler.instance)
    .mapObject(type: ZJResult<ZJArticle>.self)
    .subscribe(
        onNext: { repos -> Void in
            self.showTextView.text = "用ObjectMapper把结果转为对象\n"
                                   + "是否成功：\(repos.success!)\n"
                                   + "信息：\(repos.msg!)";
        },
        onError: { (error) -> Void in
           self.showTextView.text = "\(error)";    
    })
```

是不是很简单

so easy


### 示例(Demo)

使用方法可以参考下面的示例

Method of use can refer to the following example

[RxAlamofireDemo_Swift](https://github.com/psvmc/RxAlamofireDemo_Swift)


## 作者(Author)

剑行者 

+ 网站: [www.psvmc.cn](http://www.psvmc.cn)
+ 邮箱: [183518918@qq.com](mailto:183518918@qq.com)

## 版权(License)

你可以在MIT许可下使用`RxSwift-ObjectMapper`，更多信息请查看`LICENSE`文件

`RxSwift-ObjectMapper` is available under the MIT license. See the LICENSE file for more info.