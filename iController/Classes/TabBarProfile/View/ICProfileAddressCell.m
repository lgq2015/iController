//
//  ICProfileAddressCell.m
//  iController
//
//  Created by 吴双 on 16/1/31.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICProfileAddressCell.h"

@interface ICProfileAddressCell	()

@end

@implementation ICProfileAddressCell

- (instancetype)init {
	self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"address"];
	if (self) {
		self.textLabel.text = @"服务器地址";
		self.textLabel.textColor = Const_Color_Title;
		self.detailTextLabel.textColor = Const_Color_Subtitle;
	}
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	self.textLabel.midX += 10;
	self.detailTextLabel.midX -= 10;
}

- (void)setAddress:(NSString *)address {
	self.detailTextLabel.text = [address copy];
}

- (NSString *)address {
	return self.detailTextLabel.text;
}

@end
