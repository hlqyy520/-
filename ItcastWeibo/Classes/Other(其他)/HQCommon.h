// 0.账号相关
#define HQAppKey @"3579812058"
#define HQAppSecret @"bc3c8e1ad60c46707b4b40a02de53b42"
#define HQRedirectURI @"http://www.baidu.com"
#define HQLoginURL [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@", HQAppKey, HQRedirectURI]

// 1.判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

// 2.获得RGB颜色
#define HQColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 3.自定义Log
#ifdef DEBUG
#define HQLog(...) NSLog(__VA_ARGS__)
#else
#define HQLog(...)
#endif

// 4.是否为4inch
#define fourInch ([UIScreen mainScreen].bounds.size.height == 568)

// 5.微博cell上面的属性
/** 昵称的字体 */
#define HQStatusNameFont [UIFont systemFontOfSize:15]
/** 被转发微博作者昵称的字体 */
#define HQRetweetStatusNameFont HQStatusNameFont

/** 时间的字体 */
#define HQStatusTimeFont [UIFont systemFontOfSize:12]
/** 来源的字体 */
#define HQStatusSourceFont HQStatusTimeFont

/** 正文的字体 */
#define HQStatusContentFont [UIFont systemFontOfSize:13]
/** 被转发微博正文的字体 */
#define HQRetweetStatusContentFont HQStatusContentFont

/** 表格的边框宽度 */
#define HQStatusTableBorder 5
#define HQSettingTableBorder HQStatusTableBorder

/** cell的边框宽度 */
#define HQStatusCellBorder 10
#define HQSettingCellMargin 5

// 6.微博cell内部相册
#define HQPhotoW 70
#define HQPhotoH 70
#define HQPhotoMargin 5

// 7.
#define HQUserDefaults [NSUserDefaults standardUserDefaults]
#define HQGlobalBg HQColor(232, 233, 232)