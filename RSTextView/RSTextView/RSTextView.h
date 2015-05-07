//
//  RSPlaceholderTextView.h
//  extern
//
//  Created by RedScor Yuan on 2014/1/16.
//  Copyright (c) 2014年 RedScor Yuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSTextView : UITextView

/**
 *  placeholder for textView
 */
@property (nonatomic,copy) NSString *placeholder;
/**
 *  placeholder color for textView
 */
@property (nonatomic,strong) UIColor  *placeholderColor;

@end
