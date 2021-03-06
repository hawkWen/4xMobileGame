//
//  RowView.m
//  4x MMO Mobile Strategy Game
//
//  Created by Shankar Nathan (shankqr@gmail.com) on 4/14/14.
/*
 Copyright © 2017 SHANKAR NATHAN (shankqr@gmail.com). All rights reserved.
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#import "RowView.h"
#import "UIManager.h"
#import "MarqueeLabel.h"
#import "Colours.h"
#import "DCFineTuneSlider.h"

#define CELL_CONTENT_SPACING (5.0f*SCALE_IPAD)

@interface RowView ()

@property (nonatomic, strong) UIImageView *border;
@property (nonatomic, strong) MarqueeLabel *row1;
@property (nonatomic, strong) UIImageView *row1_bkg;
@property (nonatomic, strong) UIImageView *row1_icon;
@property (nonatomic, strong) UILabel *row2;
@property (nonatomic, strong) UIImageView *row2_bkg;
@property (nonatomic, strong) UIImageView *row2_icon;
@property (nonatomic, strong) UILabel *row3;
@property (nonatomic, strong) UIImageView *row3_bkg;
@property (nonatomic, strong) UIImageView *row3_icon;
@property (nonatomic, strong) UILabel *row4;
@property (nonatomic, strong) UIImageView *row4_bkg;
@property (nonatomic, strong) UIImageView *row4_icon;

@end

@implementation RowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.row1 = [[MarqueeLabel alloc] initWithFrame:CGRectZero rate:50.0f andFadeLength:10.0f];
        [self.row1 setNumberOfLines:0];
        [self.row1 setFont:[UIFont fontWithName:DEFAULT_FONT size:DEFAULT_FONT_SIZE]];
        [self.row1 setBackgroundColor:[UIColor clearColor]];
        self.row1.minimumScaleFactor = 1.0;
        [self.row1 setUserInteractionEnabled:NO];
        self.row1.marqueeType = MLContinuous;
        [self addSubview:self.row1];
    }
    
    return self;
}

- (CGFloat)updateView
{
    NSString *button = [NSString stringWithFormat:@"%@1_button", self.type];
    NSString *border = [NSString stringWithFormat:@"%@1_border", self.type];
    NSString *slider = [NSString stringWithFormat:@"%@2_slider", self.type];
    
    NSString *r1 = [NSString stringWithFormat:@"%@1", self.type];
    NSString *r1_align = [NSString stringWithFormat:@"%@1_align", self.type];
    NSString *r1_color = [NSString stringWithFormat:@"%@1_color", self.type];
    NSString *r1_bkg = [NSString stringWithFormat:@"%@1_bkg", self.type];
    NSString *r1_bkg_expand = [NSString stringWithFormat:@"%@1_bkg_expand", self.type];
    NSString *r1_font = [NSString stringWithFormat:@"%@1_font", self.type];
    NSString *r1_bold = [NSString stringWithFormat:@"%@1_bold", self.type];
    NSString *r1_icon = [NSString stringWithFormat:@"%@1_icon", self.type];
    NSString *r1_marquee = [NSString stringWithFormat:@"%@1_marquee", self.type];
    
    NSString *r2 = [NSString stringWithFormat:@"%@2", self.type];
    NSString *r2_align = [NSString stringWithFormat:@"%@2_align", self.type];
    NSString *r2_color = [NSString stringWithFormat:@"%@2_color", self.type];
    NSString *r2_bkg = [NSString stringWithFormat:@"%@2_bkg", self.type];
    NSString *r2_bkg_expand = [NSString stringWithFormat:@"%@2_bkg_expand", self.type];
    NSString *r2_font = [NSString stringWithFormat:@"%@2_font", self.type];
    NSString *r2_bold = [NSString stringWithFormat:@"%@2_bold", self.type];
    NSString *r2_icon = [NSString stringWithFormat:@"%@2_icon", self.type];
    
    NSString *r3 = [NSString stringWithFormat:@"%@3", self.type];
    NSString *r3_align = [NSString stringWithFormat:@"%@3_align", self.type];
    NSString *r3_color = [NSString stringWithFormat:@"%@3_color", self.type];
    NSString *r3_bkg = [NSString stringWithFormat:@"%@3_bkg", self.type];
    NSString *r3_bkg_expand = [NSString stringWithFormat:@"%@3_bkg_expand", self.type];
    NSString *r3_font = [NSString stringWithFormat:@"%@3_font", self.type];
    NSString *r3_bold = [NSString stringWithFormat:@"%@3_bold", self.type];
    NSString *r3_icon = [NSString stringWithFormat:@"%@3_icon", self.type];
    
    NSString *r4 = [NSString stringWithFormat:@"%@4", self.type];
    NSString *r4_align = [NSString stringWithFormat:@"%@4_align", self.type];
    NSString *r4_color = [NSString stringWithFormat:@"%@4_color", self.type];
    NSString *r4_bkg = [NSString stringWithFormat:@"%@4_bkg", self.type];
    NSString *r4_bkg_expand = [NSString stringWithFormat:@"%@4_bkg_expand", self.type];
    NSString *r4_font = [NSString stringWithFormat:@"%@4_font", self.type];
    NSString *r4_bold = [NSString stringWithFormat:@"%@4_bold", self.type];
    NSString *r4_icon = [NSString stringWithFormat:@"%@4_icon", self.type];
    
    CGFloat font_size = DEFAULT_FONT_SIZE;
    NSString *font_type = DEFAULT_FONT;
    if ((self.rowData[r1_font] != nil) && ![self.rowData[r1_font] isEqualToString:@""])
    {
        font_size = [self.rowData[r1_font] floatValue]*SCALE_IPAD;
    }
    if ((self.rowData[r1_bold] != nil) && ![self.rowData[r1_bold] isEqualToString:@""])
    {
        font_type = DEFAULT_FONT_BOLD;
    }
    UIFont *font_ui = [UIFont fontWithName:font_type size:font_size];
    [self.row1 setFont:font_ui];
    
    CGRect r1_frame = CGRectMake(0.0f, 0.0f, self.frame_view.size.width, 0.0f);
    [self.row1 setFrame:r1_frame];
    [self.row1 setText:self.rowData[r1]];
    
    CGFloat height = 0.0f;
    if ((self.rowData[r1_marquee] == nil) || [self.rowData[r1_marquee] isEqualToString:@""])
    {
        self.row1.labelize = YES;
        [self.row1 sizeToFit];
        height = self.row1.frame.size.height;
    }
    else
    {
        CGSize size = [self.rowData[r1] sizeWithAttributes:
                       @{NSFontAttributeName: font_ui}];
        
        //CGSize constraint = CGSizeMake(self.frame_view.size.width, font_size);
        //CGSize size = [self.rowData[r1] sizeWithFont:font_ui constrainedToSize:constraint lineBreakMode:NSLineBreakByClipping];
        
        height = MAX(size.height, font_size);
    }
    
    [self setFrame:CGRectMake(self.frame_view.origin.x, self.frame_view.origin.y, self.frame_view.size.width, height)];
    
    CGRect frame = CGRectMake(0.0f, 0.0f, self.frame_view.size.width, height);
    
    if ((self.rowData[button] != nil) && ![self.rowData[button] isEqualToString:@""])
    {
        CGFloat button_x = frame.origin.x;
        CGFloat button_y = frame.origin.y;
        NSInteger button_width = frame.size.width;
        NSInteger button_height = frame.size.height + (20.0f*SCALE_IPAD);
        
        button_width = button_width & ~1;
        button_height = button_height & ~1;
        
        if (self.btn == nil)
        {
            self.btn = [[UIButton alloc] init];
        }
        CGRect btn_frame = CGRectMake(button_x, button_y, button_width, button_height);
        [self.btn setFrame:btn_frame];
        
        if ([self.rowData[button] isEqualToString:@"0"]) //Invisible button
        {
            [self.btn setUserInteractionEnabled:NO];
            [self.btn setBackgroundImage:nil forState:UIControlStateNormal];
            [self.btn setBackgroundImage:nil forState:UIControlStateHighlighted];
        }
        else if ([self.rowData[button] isEqualToString:@"off"]) //Switch button off
        {
            UIImage *btnImage = [UIManager.i imageNamedCustom:@"button_off"];
            
            [self.btn setBackgroundImage:btnImage forState:UIControlStateNormal];
            [self.btn setBackgroundImage:btnImage forState:UIControlStateHighlighted];
        }
        else if ([self.rowData[button] isEqualToString:@"on"]) //Switch button on
        {
            UIImage *btnImage = [UIManager.i imageNamedCustom:@"button_on"];
            
            [self.btn setBackgroundImage:btnImage forState:UIControlStateNormal];
            [self.btn setBackgroundImage:btnImage forState:UIControlStateHighlighted];
        }
        else //Dynamic image button
        {
            UIImage *normalImage = [UIManager.i dynamicImage:btn_frame prefix:[NSString stringWithFormat:@"btn%@", self.rowData[button]]];
            [self.btn setBackgroundImage:normalImage forState:UIControlStateNormal];
            
            if ([self.rowData[button] isEqualToString:@"1"]) //Disabled button
            {
                [self.btn setUserInteractionEnabled:NO];
                [self.btn setBackgroundImage:normalImage forState:UIControlStateHighlighted];
            }
            else
            {
                [self.btn setUserInteractionEnabled:YES];
                UIImage *highlightImage = [UIManager.i dynamicImage:btn_frame prefix:[NSString stringWithFormat:@"btn%@_hvr", self.rowData[button]]];
                [self.btn setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
            }
        }
        
        [self insertSubview:self.btn atIndex:0];
        
        //Grow the view to fit button
        [self setFrame:CGRectMake(self.frame_view.origin.x, self.frame_view.origin.y, button_width, button_height)];
        
        if (![self.rowData[button] isEqualToString:@"0"])
        {
            [self.rowData addEntriesFromDictionary:@{r1_align : @"1", r1_color : @"2", r1_bold : @"1"}];
        }
        
        //Adjust label to fit button nicely
        frame.origin.x = frame.origin.x + CELL_CONTENT_SPACING;
        frame.origin.y = frame.origin.y + CELL_CONTENT_SPACING + CELL_CONTENT_SPACING/2.0f;
        frame.size.width = frame.size.width - CELL_CONTENT_SPACING*2.0f;
    }
    else
    {
        [self.btn removeFromSuperview];
    }
    
    CGFloat text_width = [self textWidth:self.rowData[r1] font:font_ui];
    CGFloat icon_x = 0.0f;
    if ((self.rowData[r1_align] != nil) && ![self.rowData[r1_align] isEqualToString:@""])
    {
        if ([self.rowData[r1_align] isEqualToString:@"1"])
        {
            self.row1.textAlignment = NSTextAlignmentCenter;
            //Icon should be before text
            icon_x = frame.origin.x - (3.0f*SCALE_IPAD) - frame.size.height + (frame.size.width-text_width)/2;
        }
        else if ([self.rowData[r1_align] isEqualToString:@"2"])
        {
            self.row1.textAlignment = NSTextAlignmentRight;
            //Icon should be before text
            icon_x = frame.origin.x - (3.0f*SCALE_IPAD) - frame.size.height + (frame.size.width-text_width);
        }
        else if ([self.rowData[r1_align] isEqualToString:@"3"])
        {
            self.row1.textAlignment = NSTextAlignmentLeft;
            //Icon should be before text
            icon_x = frame.origin.x;
            //Adjust label to fit icon nicely on the left
            frame.origin.x = frame.origin.x + frame.size.height;
            frame.size.width = frame.size.width - frame.size.height;
        }
    }
    else
    {
        self.row1.textAlignment = NSTextAlignmentLeft;
        //Icon should be after text
        icon_x = frame.origin.x + (3.0f*SCALE_IPAD) + text_width;
    }
    
    [self.row1 setFrame:frame];
    
    if (self.rowData[r1_bkg] != nil && ![self.rowData[r1_bkg] isEqualToString:@""])
    {
        CGFloat bkg_x = frame.origin.x;
        CGFloat bkg_y = frame.origin.y;
        NSInteger bkg_width = frame.size.width;
        NSInteger bkg_height = frame.size.height;
        
        bkg_width = bkg_width & ~1;
        bkg_height = bkg_height & ~1;
        
        CGRect bkg_frame = CGRectMake(bkg_x, bkg_y, bkg_width, bkg_height);
        if (self.rowData[r1_bkg_expand] != nil && ![self.rowData[r1_bkg_expand] isEqualToString:@""])
        {
            CGFloat expand = [self.rowData[r1_bkg_expand] floatValue];
            bkg_frame = CGRectMake(bkg_x-SCALE_IPAD, bkg_y-SCALE_IPAD, bkg_width+expand*SCALE_IPAD, bkg_height+2.0f*SCALE_IPAD);
        }
        
        UIImage *bkg_image = [UIManager.i dynamicImage:bkg_frame prefix:self.rowData[r1_bkg]];
        
        if (self.row1_bkg == nil)
        {
            self.row1_bkg = [[UIImageView alloc] initWithFrame:CGRectZero];
            self.row1_bkg.contentMode = UIViewContentModeScaleToFill;
        }
        [self.row1_bkg setImage:bkg_image];
        [self.row1_bkg setFrame:bkg_frame];
        
        [self addSubview:self.row1_bkg];
    }
    else
    {
        [self.row1_bkg removeFromSuperview];
    }
    
    if (self.rowData[r1_icon] != nil && ![self.rowData[r1_icon] isEqualToString:@""])
    {
        if (self.row1_icon == nil)
        {
            self.row1_icon = [[UIImageView alloc] initWithFrame:CGRectZero];
            self.row1_icon.contentMode = UIViewContentModeScaleToFill;
        }
        CGRect icon_frame = CGRectMake(icon_x, frame.origin.y+(1.0f*SCALE_IPAD), frame.size.height-(2.0f*SCALE_IPAD), frame.size.height-(2.0f*SCALE_IPAD));
        UIImage *icon_image = [UIManager.i imageNamedCustom:self.rowData[r1_icon]];
        [self.row1_icon setImage:icon_image];
        [self.row1_icon setFrame:icon_frame];
        
        [self addSubview:self.row1_icon];
    }
    else
    {
        [self.row1_icon removeFromSuperview];
    }
    
    if ((self.rowData[r1_color] != nil) && ![self.rowData[r1_color] isEqualToString:@""])
    {
        if ([self.rowData[r1_color] isEqualToString:@"0"])
        {
            [self.row1 setTextColor:[UIColor blackColor]];
        }
        else if ([self.rowData[r1_color] isEqualToString:@"1"])
        {
            [self.row1 setTextColor:[UIColor strawberryColor]];
        }
        else if ([self.rowData[r1_color] isEqualToString:@"2"])
        {
            [self.row1 setTextColor:[UIColor whiteColor]];
        }
        else if ([self.rowData[r1_color] isEqualToString:@"3"])
        {
            [self.row1 setTextColor:[UIColor blueColor]];
        }
        else if ([self.rowData[r1_color] isEqualToString:@"4"])
        {
            [self.row1 setTextColor:[UIColor brownColor]];
        }
        else if ([self.rowData[r1_color] isEqualToString:@"5"])
        {
            [self.row1 setTextColor:[UIColor darkGrayColor]];
        }
        else if ([self.rowData[r1_color] isEqualToString:@"6"])
        {
            [self.row1 setTextColor:[UIColor hollyGreenColor]];
        }
    }
    else
    {
        [self.row1 setTextColor:[UIColor blackColor]];
    }
    
    if (self.rowData[@"h1"] != nil)
    {
        [self.row1 setTextColor:[UIColor whiteColor]];
        [self.row1 setNumberOfLines:1];
        self.row1.adjustsFontSizeToFitWidth = YES;
        self.row1.minimumScaleFactor = 0.5f;
    }
    else
    {
        [self.row1 setNumberOfLines:0];
        self.row1.adjustsFontSizeToFitWidth = NO;
        self.row1.minimumScaleFactor = 1.0f;
    }
    
    [self addSubview:self.row1];
    
    //r2
    if ((self.rowData[r2] != nil) && ![self.rowData[r2] isEqualToString:@""])
    {
        if (self.row2 == nil)
        {
            self.row2 = [[UILabel alloc] initWithFrame:CGRectZero];
            [self.row2 setNumberOfLines:0];
            [self.row2 setFont:[UIFont fontWithName:DEFAULT_FONT size:DEFAULT_FONT_SIZE]];
            [self.row2 setBackgroundColor:[UIColor clearColor]];
            [self.row2 setTextColor:[UIColor darkGrayColor]];
            self.row2.minimumScaleFactor = 1.0;
            [self.row2 setUserInteractionEnabled:NO];
            [self.row2 setLineBreakMode:NSLineBreakByClipping];
        }
        
        CGFloat font_size = DEFAULT_FONT_SIZE;
        NSString *font_type = DEFAULT_FONT;
        if ((self.rowData[r2_font] != nil) && ![self.rowData[r2_font] isEqualToString:@""])
        {
            font_size = [self.rowData[r2_font] floatValue]*SCALE_IPAD;
        }
        
        if ((self.rowData[r2_bold] != nil) && ![self.rowData[r2_bold] isEqualToString:@""])
        {
            font_type = DEFAULT_FONT_BOLD;
        }
        UIFont *font_ui = [UIFont fontWithName:font_type size:font_size];
        [self.row2 setFont:font_ui];
        
        CGFloat r2_width = self.frame_view.size.width;
        CGFloat r2_height = 0.0f;
        CGFloat r2_y = height;
        CGFloat r2_x = 0.0f;
        
        CGRect r2_frame = CGRectMake(r2_x, r2_y, r2_width, r2_height);
        [self.row2 setFrame:r2_frame];
        [self.row2 setText:self.rowData[r2]];
        [self.row2 sizeToFit];
        r2_height = self.row2.frame.size.height;
        
        if ((self.rowData[button] != nil) && ![self.rowData[button] isEqualToString:@""])
        {
            //Grow the button
            CGRect btn_frame = CGRectMake(self.btn.frame.origin.x, self.btn.frame.origin.y, self.btn.frame.size.width, self.btn.frame.size.height+r2_height+CELL_CONTENT_SPACING);
            [self.btn setFrame:btn_frame];
            
            self.rowData[r2_align] = @"1";
            self.rowData[r2_color] = @"2";
            
            height = self.btn.frame.size.height;
            
            //Adjust label to fit button nicely
            r2_x = CELL_CONTENT_SPACING;
            r2_y = r2_y + CELL_CONTENT_SPACING*2.0f;
            r2_width = r2_width - CELL_CONTENT_SPACING*2.0f;
        }
        
        r2_frame = CGRectMake(r2_x, r2_y, r2_width, r2_height);
        [self.row2 setFrame:r2_frame];
        
        //Grow the view to fit r2
        height = height + r2_height;
        [self setFrame:CGRectMake(self.frame_view.origin.x, self.frame_view.origin.y, self.frame_view.size.width, height)];
        
        if (self.rowData[r2_bkg] != nil && ![self.rowData[r2_bkg] isEqualToString:@""])
        {
            CGFloat bkg_x = r2_frame.origin.x;
            CGFloat bkg_y = r2_frame.origin.y;
            NSInteger bkg_width = r2_frame.size.width;
            NSInteger bkg_height = r2_frame.size.height;
            
            bkg_width = bkg_width & ~1;
            bkg_height = bkg_height & ~1;
            
            CGRect bkg_frame = CGRectMake(bkg_x, bkg_y, bkg_width, bkg_height);
            if (self.rowData[r2_bkg_expand] != nil && ![self.rowData[r2_bkg_expand] isEqualToString:@""])
            {
                CGFloat expand = [self.rowData[r2_bkg_expand] floatValue];
                bkg_frame = CGRectMake(bkg_x-SCALE_IPAD, bkg_y-SCALE_IPAD, bkg_width+expand*SCALE_IPAD, bkg_height+2.0f*SCALE_IPAD);
            }
            
            if (self.row2_bkg == nil)
            {
                self.row2_bkg = [[UIImageView alloc] initWithFrame:CGRectZero];
                self.row2_bkg.contentMode = UIViewContentModeScaleToFill;
            }
            UIImage *bkg_image = [UIManager.i dynamicImage:bkg_frame prefix:self.rowData[r2_bkg]];
            [self.row2_bkg setImage:bkg_image];
            [self.row2_bkg setFrame:bkg_frame];
            [self addSubview:self.row2_bkg];
        }
        else
        {
            [self.row2_bkg removeFromSuperview];
        }
        
        [self addSubview:self.row2];
        
        CGFloat text_width = [self textWidth:self.rowData[r2] font:font_ui];
        CGFloat icon_x = 0.0f;
        if ((self.rowData[r2_align] != nil) && ![self.rowData[r2_align] isEqualToString:@""])
        {
            if ([self.rowData[r2_align] isEqualToString:@"1"])
            {
                self.row2.textAlignment = NSTextAlignmentCenter;
                //Icon should be before text
                icon_x = frame.origin.x - (3.0f*SCALE_IPAD) - frame.size.height + (frame.size.width-text_width)/2.0f;
            }
            else if ([self.rowData[r2_align] isEqualToString:@"2"])
            {
                self.row2.textAlignment = NSTextAlignmentRight;
                //Icon should be before text
                icon_x = frame.origin.x - (3.0f*SCALE_IPAD) - frame.size.height + (frame.size.width-text_width);
            }
            else if ([self.rowData[r2_align] isEqualToString:@"3"])
            {
                self.row2.textAlignment = NSTextAlignmentLeft;
                //Icon should be after text
                icon_x = frame.origin.x + (3.0f*SCALE_IPAD) + text_width;
            }
        }
        else
        {
            self.row2.textAlignment = NSTextAlignmentLeft;
            //Icon should be after text
            icon_x = frame.origin.x + (3.0f*SCALE_IPAD) + text_width;
        }
        
        if (self.rowData[r2_icon] != nil && ![self.rowData[r2_icon] isEqualToString:@""])
        {
            if (icon_x > 0)
            {
                if (self.row2_icon == nil)
                {
                    self.row2_icon = [[UIImageView alloc] initWithFrame:CGRectZero];
                    self.row2_icon.contentMode = UIViewContentModeScaleToFill;
                }
                CGRect icon_frame = CGRectMake(icon_x, r2_frame.origin.y+(1.0f*SCALE_IPAD), r2_frame.size.height-(2.0f*SCALE_IPAD), r2_frame.size.height-(2.0f*SCALE_IPAD));
                UIImage *icon_image = [UIManager.i imageNamedCustom:self.rowData[r2_icon]];
                [self.row2_icon setImage:icon_image];
                [self.row2_icon setFrame:icon_frame];
                
                [self addSubview:self.row2_icon];
            }
        }
        else
        {
            [self.row2_icon removeFromSuperview];
        }
        
        if ((self.rowData[r2_color] != nil) && ![self.rowData[r2_color] isEqualToString:@""])
        {
            if ([self.rowData[r2_color] isEqualToString:@"0"])
            {
                [self.row2 setTextColor:[UIColor blackColor]];
            }
            else if ([self.rowData[r2_color] isEqualToString:@"1"])
            {
                [self.row2 setTextColor:[UIColor strawberryColor]];
            }
            else if ([self.rowData[r2_color] isEqualToString:@"2"])
            {
                [self.row2 setTextColor:[UIColor whiteColor]];
            }
            else if ([self.rowData[r2_color] isEqualToString:@"3"])
            {
                [self.row2 setTextColor:[UIColor blueColor]];
            }
            else if ([self.rowData[r2_color] isEqualToString:@"4"])
            {
                [self.row2 setTextColor:[UIColor cinnamonColor]];
            }
            else if ([self.rowData[r2_color] isEqualToString:@"5"])
            {
                [self.row2 setTextColor:[UIColor darkGrayColor]];
            }
            else if ([self.rowData[r2_color] isEqualToString:@"6"])
            {
                [self.row2 setTextColor:[UIColor hollyGreenColor]];
            }
        }
        else
        {
            [self.row2 setTextColor:[UIColor cinnamonColor]];
        }
    }
    else
    {
        [self.row2_icon removeFromSuperview];
        [self.row2_bkg removeFromSuperview];
        [self.row2 removeFromSuperview];
    }
    
    //r2 slier
    if ((self.rowData[slider] != nil) && ![self.rowData[slider] isEqualToString:@""])
    {
        CGFloat r2_width = self.frame_view.size.width;
        CGFloat r2_height = 10.0f * SCALE_IPAD;
        CGFloat r2_y = height + r2_height;
        CGFloat r2_x = 0.0f;
        
        CGRect slider_frame = CGRectMake(r2_x, r2_y, r2_width, r2_height);
        
        if (self.slider == nil)
        {
            self.slider = [[DCFineTuneSlider alloc] initWithFrame:CGRectZero];
        }
        [self.slider setFrame:slider_frame];
        
        //Grow the view to fit r2
        height = height + 20.0f*SCALE_IPAD;
        [self setFrame:CGRectMake(self.frame_view.origin.x, self.frame_view.origin.y, self.frame_view.size.width, height)];
        
        [self addSubview:self.slider];
        
        self.slider.type = self.rowData[slider];
        
        if (self.rowData[@"slider_max"] != nil)
        {
            NSUInteger slider_max = [self.rowData[@"slider_max"] integerValue];
            if (slider_max > 0)
            {
                self.slider.maxValue = slider_max;
                
                NSInteger l = [[@(slider_max) stringValue] length];
                
                if (l > 6)
                {
                    self.slider.fineTuneAmount = pow(10, (l-6));
                }
                else
                {
                    self.slider.fineTuneAmount = 1.0;
                }
            }
        }
        
        if (self.rowData[@"s1"] != nil)
        {
            NSUInteger slider_val = [self.rowData[@"s1"] integerValue];
            self.slider.selectedValue = slider_val;
        }
        
        [self.slider updateView];
    }
    else
    {
        [self.slider removeFromSuperview];
    }
    
    //r3
    if ((self.rowData[r3] != nil) && ![self.rowData[r3] isEqualToString:@""])
    {
        if (self.row3 == nil)
        {
            self.row3 = [[UILabel alloc] initWithFrame:CGRectZero];
            [self.row3 setNumberOfLines:0];
            [self.row3 setFont:[UIFont fontWithName:DEFAULT_FONT size:DEFAULT_FONT_SIZE]];
            [self.row3 setBackgroundColor:[UIColor clearColor]];
            [self.row3 setTextColor:[UIColor darkGrayColor]];
            self.row3.minimumScaleFactor = 1.0;
            [self.row3 setUserInteractionEnabled:NO];
            [self.row3 setLineBreakMode:NSLineBreakByClipping];
        }
        
        CGFloat font_size = DEFAULT_FONT_SIZE;
        NSString *font_type = DEFAULT_FONT;
        if ((self.rowData[r3_font] != nil) && ![self.rowData[r3_font] isEqualToString:@""])
        {
            font_size = [self.rowData[r3_font] floatValue]*SCALE_IPAD;
        }
        
        if ((self.rowData[r3_bold] != nil) && ![self.rowData[r3_bold] isEqualToString:@""])
        {
            font_type = DEFAULT_FONT_BOLD;
        }
        UIFont *font_ui = [UIFont fontWithName:font_type size:font_size];
        [self.row3 setFont:font_ui];
        
        CGFloat r3_width = self.frame_view.size.width;
        CGFloat r3_height = 0.0f;
        CGFloat r3_y = height;
        CGFloat r3_x = 0.0f;
        
        CGRect r3_frame = CGRectMake(r3_x, r3_y, r3_width, r3_height);
        [self.row3 setFrame:r3_frame];
        [self.row3 setText:self.rowData[r3]];
        [self.row3 sizeToFit];
        r3_height = self.row3.frame.size.height;
        
        if ((self.rowData[button] != nil) && ![self.rowData[button] isEqualToString:@""])
        {
            //Grow the button
            CGRect btn_frame = CGRectMake(self.btn.frame.origin.x, self.btn.frame.origin.y, self.btn.frame.size.width, self.btn.frame.size.height+r3_height+CELL_CONTENT_SPACING);
            [self.btn setFrame:btn_frame];
            
            self.rowData[r3_align] = @"1";
            self.rowData[r3_color] = @"2";
            
            height = self.btn.frame.size.height;
            
            //Adjust label to fit button nicely
            r3_x = CELL_CONTENT_SPACING;
            r3_y = r3_y + CELL_CONTENT_SPACING*2.0f;
            r3_width = r3_width - CELL_CONTENT_SPACING*2.0f;
        }
        
        r3_frame = CGRectMake(r3_x, r3_y, r3_width, r3_height);
        [self.row3 setFrame:r3_frame];
        
        //Grow the view to fit r3
        height = height + r3_height;
        [self setFrame:CGRectMake(self.frame_view.origin.x, self.frame_view.origin.y, self.frame_view.size.width, height)];
        
        if (self.rowData[r3_bkg] != nil && ![self.rowData[r3_bkg] isEqualToString:@""])
        {
            CGFloat bkg_x = r3_frame.origin.x;
            CGFloat bkg_y = r3_frame.origin.y;
            NSInteger bkg_width = r3_frame.size.width;
            NSInteger bkg_height = r3_frame.size.height;
            
            bkg_width = bkg_width & ~1;
            bkg_height = bkg_height & ~1;
            
            CGRect bkg_frame = CGRectMake(bkg_x, bkg_y, bkg_width, bkg_height);
            if (self.rowData[r3_bkg_expand] != nil && ![self.rowData[r3_bkg_expand] isEqualToString:@""])
            {
                CGFloat expand = [self.rowData[r3_bkg_expand] floatValue];
                bkg_frame = CGRectMake(bkg_x-SCALE_IPAD, bkg_y-SCALE_IPAD, bkg_width+expand*SCALE_IPAD, bkg_height+2.0f*SCALE_IPAD);
            }
            
            if (self.row3_bkg == nil)
            {
                self.row3_bkg = [[UIImageView alloc] initWithFrame:CGRectZero];
                self.row3_bkg.contentMode = UIViewContentModeScaleToFill;
            }
            UIImage *bkg_image = [UIManager.i dynamicImage:bkg_frame prefix:self.rowData[r3_bkg]];
            [self.row3_bkg setImage:bkg_image];
            [self.row3_bkg setFrame:bkg_frame];
            [self addSubview:self.row3_bkg];
        }
        else
        {
            [self.row3_bkg removeFromSuperview];
        }
        
        [self addSubview:self.row3];
        
        CGFloat text_width = [self textWidth:self.rowData[r3] font:font_ui];
        CGFloat icon_x = 0.0f;
        if ((self.rowData[r3_align] != nil) && ![self.rowData[r3_align] isEqualToString:@""])
        {
            if ([self.rowData[r3_align] isEqualToString:@"1"])
            {
                self.row3.textAlignment = NSTextAlignmentCenter;
                //Icon should be before text
                icon_x = frame.origin.x - (3.0f*SCALE_IPAD) - frame.size.height + (frame.size.width-text_width)/2.0f;
            }
            else if ([self.rowData[r3_align] isEqualToString:@"2"])
            {
                self.row3.textAlignment = NSTextAlignmentRight;
                //Icon should be before text
                icon_x = frame.origin.x - (3.0f*SCALE_IPAD) - frame.size.height + (frame.size.width-text_width);
            }
            else if ([self.rowData[r3_align] isEqualToString:@"3"])
            {
                self.row3.textAlignment = NSTextAlignmentLeft;
                //Icon should be after text
                icon_x = frame.origin.x + (3.0f*SCALE_IPAD) + text_width;
            }
        }
        else
        {
            self.row3.textAlignment = NSTextAlignmentLeft;
            //Icon should be after text
            icon_x = frame.origin.x + (3.0f*SCALE_IPAD) + text_width;
        }
        
        if (self.rowData[r3_icon] != nil && ![self.rowData[r3_icon] isEqualToString:@""])
        {
            if (icon_x > 0)
            {
                if (self.row3_icon == nil)
                {
                    self.row3_icon = [[UIImageView alloc] initWithFrame:CGRectZero];
                    self.row3_icon.contentMode = UIViewContentModeScaleToFill;
                }
                CGRect icon_frame = CGRectMake(icon_x, r3_frame.origin.y+(1.0f*SCALE_IPAD), r3_frame.size.height-(2.0f*SCALE_IPAD), r3_frame.size.height-(2.0f*SCALE_IPAD));
                UIImage *icon_image = [UIManager.i imageNamedCustom:self.rowData[r3_icon]];
                [self.row3_icon setImage:icon_image];
                [self.row3_icon setFrame:icon_frame];
                
                [self addSubview:self.row3_icon];
            }
        }
        else
        {
            [self.row3_icon removeFromSuperview];
        }
        
        if ((self.rowData[r3_color] != nil) && ![self.rowData[r3_color] isEqualToString:@""])
        {
            if ([self.rowData[r3_color] isEqualToString:@"0"])
            {
                [self.row3 setTextColor:[UIColor blackColor]];
            }
            else if ([self.rowData[r3_color] isEqualToString:@"1"])
            {
                [self.row3 setTextColor:[UIColor strawberryColor]];
            }
            else if ([self.rowData[r3_color] isEqualToString:@"2"])
            {
                [self.row3 setTextColor:[UIColor whiteColor]];
            }
            else if ([self.rowData[r3_color] isEqualToString:@"3"])
            {
                [self.row3 setTextColor:[UIColor blueColor]];
            }
            else if ([self.rowData[r3_color] isEqualToString:@"4"])
            {
                [self.row3 setTextColor:[UIColor cinnamonColor]];
            }
            else if ([self.rowData[r3_color] isEqualToString:@"5"])
            {
                [self.row3 setTextColor:[UIColor darkGrayColor]];
            }
            else if ([self.rowData[r3_color] isEqualToString:@"6"])
            {
                [self.row3 setTextColor:[UIColor hollyGreenColor]];
            }
        }
        else
        {
            [self.row3 setTextColor:[UIColor cinnamonColor]];
        }
    }
    else
    {
        [self.row3_icon removeFromSuperview];
        [self.row3_bkg removeFromSuperview];
        [self.row3 removeFromSuperview];
    }
    
    //r4
    if ((self.rowData[r4] != nil) && ![self.rowData[r4] isEqualToString:@""])
    {
        if (self.row4 == nil)
        {
            self.row4 = [[UILabel alloc] initWithFrame:CGRectZero];
            [self.row4 setNumberOfLines:0];
            [self.row4 setFont:[UIFont fontWithName:DEFAULT_FONT size:DEFAULT_FONT_SIZE]];
            [self.row4 setBackgroundColor:[UIColor clearColor]];
            [self.row4 setTextColor:[UIColor darkGrayColor]];
            self.row4.minimumScaleFactor = 1.0;
            [self.row4 setUserInteractionEnabled:NO];
            [self.row4 setLineBreakMode:NSLineBreakByClipping];
        }
        
        CGFloat font_size = DEFAULT_FONT_SIZE;
        NSString *font_type = DEFAULT_FONT;
        if ((self.rowData[r4_font] != nil) && ![self.rowData[r4_font] isEqualToString:@""])
        {
            font_size = [self.rowData[r4_font] floatValue]*SCALE_IPAD;
        }
        
        if ((self.rowData[r4_bold] != nil) && ![self.rowData[r4_bold] isEqualToString:@""])
        {
            font_type = DEFAULT_FONT_BOLD;
        }
        UIFont *font_ui = [UIFont fontWithName:font_type size:font_size];
        [self.row4 setFont:font_ui];
        
        CGFloat r4_width = self.frame_view.size.width;
        CGFloat r4_height = 0.0f;
        CGFloat r4_y = height;
        CGFloat r4_x = 0.0f;
        
        CGRect r4_frame = CGRectMake(r4_x, r4_y, r4_width, r4_height);
        [self.row4 setFrame:r4_frame];
        [self.row4 setText:self.rowData[r4]];
        [self.row4 sizeToFit];
        r4_height = self.row4.frame.size.height;
        
        if ((self.rowData[button] != nil) && ![self.rowData[button] isEqualToString:@""])
        {
            //Grow the button
            CGRect btn_frame = CGRectMake(self.btn.frame.origin.x, self.btn.frame.origin.y, self.btn.frame.size.width, self.btn.frame.size.height+r4_height+CELL_CONTENT_SPACING);
            [self.btn setFrame:btn_frame];
            
            self.rowData[r4_align] = @"1";
            self.rowData[r4_color] = @"2";
            
            height = self.btn.frame.size.height;
            
            //Adjust label to fit button nicely
            r4_x = CELL_CONTENT_SPACING;
            r4_y = r4_y + CELL_CONTENT_SPACING*2.0f;
            r4_width = r4_width - CELL_CONTENT_SPACING*2.0f;
        }
        
        r4_frame = CGRectMake(r4_x, r4_y, r4_width, r4_height);
        [self.row4 setFrame:r4_frame];
        
        //Grow the view to fit r4
        height = height + r4_height;
        [self setFrame:CGRectMake(self.frame_view.origin.x, self.frame_view.origin.y, self.frame_view.size.width, height)];
        
        if (self.rowData[r4_bkg] != nil && ![self.rowData[r4_bkg] isEqualToString:@""])
        {
            CGFloat bkg_x = r4_frame.origin.x;
            CGFloat bkg_y = r4_frame.origin.y;
            NSInteger bkg_width = r4_frame.size.width;
            NSInteger bkg_height = r4_frame.size.height;
            
            bkg_width = bkg_width & ~1;
            bkg_height = bkg_height & ~1;
            
            CGRect bkg_frame = CGRectMake(bkg_x, bkg_y, bkg_width, bkg_height);
            if (self.rowData[r4_bkg_expand] != nil && ![self.rowData[r4_bkg_expand] isEqualToString:@""])
            {
                CGFloat expand = [self.rowData[r4_bkg_expand] floatValue];
                bkg_frame = CGRectMake(bkg_x-SCALE_IPAD, bkg_y-SCALE_IPAD, bkg_width+expand*SCALE_IPAD, bkg_height+2.0f*SCALE_IPAD);
            }
            
            if (self.row4_bkg == nil)
            {
                self.row4_bkg = [[UIImageView alloc] initWithFrame:CGRectZero];
                self.row4_bkg.contentMode = UIViewContentModeScaleToFill;
            }
            UIImage *bkg_image = [UIManager.i dynamicImage:bkg_frame prefix:self.rowData[r4_bkg]];
            [self.row4_bkg setImage:bkg_image];
            [self.row4_bkg setFrame:bkg_frame];
            [self addSubview:self.row4_bkg];
        }
        else
        {
            [self.row4_bkg removeFromSuperview];
        }
        
        [self addSubview:self.row4];
        
        CGFloat text_width = [self textWidth:self.rowData[r4] font:font_ui];
        CGFloat icon_x = 0.0f;
        if ((self.rowData[r4_align] != nil) && ![self.rowData[r4_align] isEqualToString:@""])
        {
            if ([self.rowData[r4_align] isEqualToString:@"1"])
            {
                self.row4.textAlignment = NSTextAlignmentCenter;
                //Icon should be before text
                icon_x = frame.origin.x - (3.0f*SCALE_IPAD) - frame.size.height + (frame.size.width-text_width)/2.0f;
            }
            else if ([self.rowData[r4_align] isEqualToString:@"2"])
            {
                self.row4.textAlignment = NSTextAlignmentRight;
                //Icon should be before text
                icon_x = frame.origin.x - (3.0f*SCALE_IPAD) - frame.size.height + (frame.size.width-text_width);
            }
            else if ([self.rowData[r4_align] isEqualToString:@"3"])
            {
                self.row4.textAlignment = NSTextAlignmentLeft;
                //Icon should be after text
                icon_x = frame.origin.x + (3.0f*SCALE_IPAD) + text_width;
            }
        }
        else
        {
            self.row4.textAlignment = NSTextAlignmentLeft;
            //Icon should be after text
            icon_x = frame.origin.x + (3.0f*SCALE_IPAD) + text_width;
        }
        
        if (self.rowData[r4_icon] != nil && ![self.rowData[r4_icon] isEqualToString:@""])
        {
            if (icon_x > 0)
            {
                if (self.row4_icon == nil)
                {
                    self.row4_icon = [[UIImageView alloc] initWithFrame:CGRectZero];
                    self.row4_icon.contentMode = UIViewContentModeScaleToFill;
                }
                CGRect icon_frame = CGRectMake(icon_x, r4_frame.origin.y+(1.0f*SCALE_IPAD), r4_frame.size.height-(2.0f*SCALE_IPAD), r4_frame.size.height-(2.0f*SCALE_IPAD));
                UIImage *icon_image = [UIManager.i imageNamedCustom:self.rowData[r4_icon]];
                [self.row4_icon setImage:icon_image];
                [self.row4_icon setFrame:icon_frame];
                
                [self addSubview:self.row4_icon];
            }
        }
        else
        {
            [self.row4_icon removeFromSuperview];
        }
        
        if ((self.rowData[r4_color] != nil) && ![self.rowData[r4_color] isEqualToString:@""])
        {
            if ([self.rowData[r4_color] isEqualToString:@"0"])
            {
                [self.row4 setTextColor:[UIColor blackColor]];
            }
            else if ([self.rowData[r4_color] isEqualToString:@"1"])
            {
                [self.row4 setTextColor:[UIColor strawberryColor]];
            }
            else if ([self.rowData[r4_color] isEqualToString:@"2"])
            {
                [self.row4 setTextColor:[UIColor whiteColor]];
            }
            else if ([self.rowData[r4_color] isEqualToString:@"3"])
            {
                [self.row4 setTextColor:[UIColor blueColor]];
            }
            else if ([self.rowData[r4_color] isEqualToString:@"4"])
            {
                [self.row4 setTextColor:[UIColor cinnamonColor]];
            }
            else if ([self.rowData[r4_color] isEqualToString:@"5"])
            {
                [self.row4 setTextColor:[UIColor darkGrayColor]];
            }
            else if ([self.rowData[r4_color] isEqualToString:@"6"])
            {
                [self.row4 setTextColor:[UIColor hollyGreenColor]];
            }
        }
        else
        {
            [self.row4 setTextColor:[UIColor cinnamonColor]];
        }
    }
    else
    {
        [self.row4_icon removeFromSuperview];
        [self.row4_bkg removeFromSuperview];
        [self.row4 removeFromSuperview];
    }
    
    if ([self.rowData[border] isEqualToString:@"1"])
    {
        if (self.border == nil)
        {
            self.border = [[UIImageView alloc] initWithFrame:CGRectZero];
        }
        self.border.contentMode = UIViewContentModeScaleToFill;
        [self.border setImage:[UIManager.i imageNamedCustom:@"skin_border_cell"]];
        [self.border setFrame:CGRectMake(self.frame_view.size.width, 0.0f, 1.0f*SCALE_IPAD, height)];
        [self addSubview:self.border];
    }
    else
    {
        [self.border removeFromSuperview];
    }
    
    return height;
}

- (void)hideAll
{
    [self.btn removeFromSuperview];
    [self.border removeFromSuperview];
    
    [self.row1 removeFromSuperview];
    [self.row1_bkg removeFromSuperview];
    [self.row1_icon removeFromSuperview];
    
    [self.row2 removeFromSuperview];
    [self.row2_bkg removeFromSuperview];
    [self.row2_icon removeFromSuperview];
    
    [self setFrame:CGRectZero];
}

- (CGFloat)textWidth:(NSString *)text font:(UIFont*)font
{
    CGSize constraint = CGSizeMake(0.0f, CGFLOAT_MAX);
    CGRect size = [text boundingRectWithSize:constraint
                                     options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                  attributes:@{NSFontAttributeName:font}
                                     context:nil];
    
    return size.size.width;
}

@end
