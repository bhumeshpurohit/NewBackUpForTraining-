//
//  MyTreeViewCell.h
//  MyTreeViewPrototype
//


#import <Foundation/Foundation.h>
#import "MyTreeNode.h"


@interface MyTreeViewCell : UITableViewCell {
	UILabel *valueLabel;
	UIImageView *arrowImage;
	int level;
	BOOL expanded;
    BOOL isSearched;
}

@property (nonatomic, retain) UILabel *valueLabel;
@property (nonatomic, retain) UIImageView *arrowImage;
@property (nonatomic) int level;
@property (nonatomic) BOOL expanded;

- (id)initWithStyle:(UITableViewCellStyle)style 
	reuseIdentifier:(NSString *)reuseIdentifier 
			  level:(NSUInteger)_level 
		   expanded:(BOOL)_expanded
         isSearched:(BOOL)_isSearched
           childran:(MyTreeNode *)childranNode nodeImage:(UIImage*) imgNode;
- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
              level:(NSUInteger)_level
           expanded:(BOOL)_expanded
           childran:(MyTreeNode *)childranNode nodeImage:(UIImage*) imgNode;
@end
