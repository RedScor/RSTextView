//
//  RSPlaceholderTextView.m
//  extern
//
//  Created by RedScor Yuan on 2014/1/16.
//  Copyright (c) 2014年 RedScor Yuan. All rights reserved.
//

#import "RSTextView.h"

@interface RSTextView ()

- (void)textDidChange:(NSNotification *)notification;

@end

@implementation RSTextView

#pragma mark -
#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_initAttrs];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer
{
    self = [super initWithFrame:frame textContainer:textContainer];
    if (self) {
        
        [self p_initAttrs];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self p_initAttrs];
    }
    return self;
}

- (void)p_initAttrs {
    
    /**
     *  while text change send notification
     */
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:self];
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}

- (void)textDidChange:(NSNotification *)notification {
    [self setNeedsDisplay];
}

- (void)setPlaceholder:(NSString *)placeholder {
    
    _placeholder = [placeholder copy];
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    
    _placeholderColor = placeholderColor;
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text {
    
    [super setText:text];
    [self setNeedsDisplay];
}

- (void)insertText:(NSString *)text {
    
    [super insertText:text];
    [self setNeedsDisplay];
}

- (void)setFont:(UIFont *)font {
    
    [super setFont:font];
    [self setNeedsDisplay];
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    
    [super setAttributedText:attributedText];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {

    //if textView has input text , return;
    if (self.hasText) return;

    //text attributes
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = self.placeholderColor ?: [UIColor grayColor];
    if (self.font) {
        attrs[NSFontAttributeName] = self.font;
    }
    
    CGRect placeholderRect = [self placeholderRect];
    
    [self.placeholder drawInRect:placeholderRect withAttributes:attrs];
    
}

- (CGRect)placeholderRect {
    
    CGRect rect = UIEdgeInsetsInsetRect(self.bounds, self.contentInset);
    //5 為向右偏移5 px , 8 為向下偏移8 px
    return CGRectInset(rect, 5, 8);
}

@end
