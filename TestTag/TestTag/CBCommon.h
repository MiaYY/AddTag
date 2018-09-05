
//获取api地址
//#define kBaseUrl @"http://106.14.30.22:7200/"
#define kBaseUrl @"http://106.14.30.22:3002/"


#define kGAP 10
#define kThemeColor [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]
//头像的大小
#define kAvatar_Size 40

#define kTabBarHeight       49
#define kNavbarHeight       64

#define kAlmostZero         0.0000001


// font

#define FontHeiti(fontSize) [UIFont fontWithName:@"STHeitiSC-Light" size:(fontSize)]
#define FontBoldHeiti(fontSize) [UIFont boldSystemFontOfSize:(fontSize)]
// 颜色
static inline UIColor *RGBA(int R, int G, int B, double A) {
    return [UIColor colorWithRed: R/255.0 green: G/255.0 blue: B/255.0 alpha: A];
}

static inline UIColor *HexColorA(int v, double A) {
    return RGBA((double)((v&0xff0000)>>16), (double)((v&0xff00)>>8), (double)(v&0xff), A);
}

static inline UIColor *HexColor(int v) {
    return RGBA((double)((v&0xff0000)>>16), (double)((v&0xff00)>>8), (double)(v&0xff), 1.0f);
}

// cell data protocol
@protocol CBCellSetModelProtocol <NSObject>
@optional
@property (nonatomic, strong) void (^actionBlockWithDataModel)(id dataModel);
- (void)renderWithModel:(id)model;

@end

#define NONullString(key)       [key length] > 0 ? key : @""

#define SINGLETON(block) \
  static dispatch_once_t pred = 0; \
  __strong static id _sharedObject = nil; \
  dispatch_once(&pred, ^{ \
    _sharedObject = block(); \
  }); \
  return _sharedObject; \


// 屏幕

#define SCREEN_SCALE        ([UIScreen mainScreen].scale)
#define ONE_PIXEL           (1.0f/SCREEN_SCALE)

#define CB_HUD_DISMISS      (1.0)

#define CKScreenW ([UIScreen mainScreen].bounds.size.width)
#define CKScreenH ([UIScreen mainScreen].bounds.size.height)
#define cellBackgroudColor  [UIColor whiteColor]

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define SCREEN_MAX_LENGTH (MAX(CKScreenW, CKScreenH))
#define SCREEN_MIN_LENGTH (MIN(CKScreenW, CKScreenH))

