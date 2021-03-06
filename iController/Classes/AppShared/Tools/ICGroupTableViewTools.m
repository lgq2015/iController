//
//  ICGroupTableViewTools.m
//  iController
//
//  Created by 吴双 on 16/1/31.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICGroupTableViewTools.h"

@implementation ICGroupTableViewTools

+ (UIImage *)tableView:(UITableView *)tableView deselectRowBackgroundImageForIndexPath:(NSIndexPath *)indexPath {
	ICGroupTableViewRowType type = [self tableView:tableView rowTypeForIndexPath:indexPath];
	NSString *imageName = [self imageNameForTableViewRowType:type selected:NO];
	return [UIImage imageNamed:imageName];
}

+ (UIImage *)tableView:(UITableView *)tableView selectRowBackgroundImageForIndexPath:(NSIndexPath *)indexPath {
	ICGroupTableViewRowType type = [self tableView:tableView rowTypeForIndexPath:indexPath];
	NSString *imageName = [self imageNameForTableViewRowType:type selected:YES];
	return [UIImage imageNamed:imageName];
}

+ (NSString *)imageNameForTableViewRowType:(ICGroupTableViewRowType)type selected:(BOOL)selected {
	NSString *name = [NSString stringWithFormat:@"list_item4_%lu", (unsigned long)type];
	if (selected) {
		name = [name stringByAppendingString:@"_down"];
	}
	return name;
}

+ (ICGroupTableViewRowType)tableView:(UITableView *)tableView rowTypeForIndexPath:(NSIndexPath *)indexPath {
	NSUInteger numberOfRows = [tableView numberOfRowsInSection:indexPath.section];
	if (numberOfRows <= 1) {
		return ICGroupTableViewRowTypeSingle;
	} else if (indexPath.row == 0) {
		return ICGroupTableViewRowTypeTop;
	} else if (indexPath.row == numberOfRows - 1) {
		return ICGroupTableViewRowTypeButtom;
	} else {
		return ICGroupTableViewRowTypeMiddle;
	}
}

@end


@implementation ICTableViewCell (BackgroundView)

- (void)setBackgroundViewForTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
	UIImage *backgroundImage = [ICGroupTableViewTools tableView:tableView deselectRowBackgroundImageForIndexPath:indexPath];
	UIImage *selectedImage = [ICGroupTableViewTools tableView:tableView selectRowBackgroundImageForIndexPath:indexPath];
	UIImageView *backgroundView = [[UIImageView alloc] initWithImage:backgroundImage];
	UIImageView *selectedView = [[UIImageView alloc] initWithImage:selectedImage];
	self.backgroundView = backgroundView;
	self.selectedBackgroundView = selectedView;
	[self setValue:@([ICGroupTableViewTools tableView:tableView rowTypeForIndexPath:indexPath]) forKey:@"_rowType"];
}

@end
