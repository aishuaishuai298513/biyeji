//
//  HWTabBarViewController.m
//
//
//  Created by apple on 14-10-7.
//  
//

#import "SSTabBarViewController.h"
#import "SSNavigationController.h"
#import "XiGuanViewController.h"
#import "ZhaoPinViewController.h"
#import "BangBangViewController.h"
#import "WoViewController.h"

@interface SSTabBarViewController ()

@end

@implementation SSTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.初始化子控制器
    XiGuanViewController *xiGuan = [[XiGuanViewController alloc]init];
    [self addChildVc:xiGuan title:@"习惯" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    ZhaoPinViewController *zhaoPin = [[ZhaoPinViewController alloc]init];
    [self addChildVc:zhaoPin title:@"招聘" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    BangBangViewController *bangBang = [[BangBangViewController alloc]init];
    [self addChildVc:bangBang title:@"帮帮" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    WoViewController *wo = [[WoViewController alloc]init];
    [self addChildVc:wo title:@"个人中心" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    // 2.更换系统自带的tabbar
//    HWTabBar *tabBar = [[HWTabBar alloc] init];
//    [self setValue:tabBar forKeyPath:@"tabBar"];
    /*
     [self setValue:tabBar forKeyPath:@"tabBar"];相当于self.tabBar = tabBar;
     [self setValue:tabBar forKeyPath:@"tabBar"];这行代码过后，tabBar的delegate就是HWTabBarViewController
     说明，不用再设置tabBar.delegate = self;
     */
    
    /*
     1.如果tabBar设置完delegate后，再执行下面代码修改delegate，就会报错
     tabBar.delegate = self;

     2.如果再次修改tabBar的delegate属性，就会报下面的错误
     错误信息：Changing the delegate of a tab bar managed by a tab bar controller is not allowed.
     错误意思：不允许修改TabBar的delegate属性(这个TabBar是被TabBarViewController所管理的)
     */
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
//    if (IOS7) {
//        childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    } else {
//        childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
//    }
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:123/255.0 green:123/255.0  blue:123/255.0  alpha:1];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    SSNavigationController *nav = [[SSNavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
}

//- (void)tabBarDidClickPlusButton:(HWTabBar *)tabBar
//{
//    HWComposeViewController *compose = [[HWComposeViewController alloc] init];
//    
//    HWNavigationController *nav = [[HWNavigationController alloc] initWithRootViewController:compose];
//    [self presentViewController:nav animated:YES completion:nil];
//}

@end
