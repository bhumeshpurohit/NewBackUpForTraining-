//
//  MyTreeViewCell.m
//  MyTreeViewPrototype
//


#import "MyTreeViewCell.h"

#define IMG_HEIGHT_WIDTH 20
#define CELL_HEIGHT 44
#define SCREEN_WIDTH 420    //280
#define LEVEL_INDENT 25
#define YOFFSET 12
#define XOFFSET 4

@interface MyTreeViewCell (Private)

- (UILabel *)newLabelWithPrimaryColor:(UIColor *)primaryColor 
						selectedColor:(UIColor *)selectedColor 
							 fontSize:(CGFloat)fontSize 
								 bold:(BOOL)bold;// limitedToNumberOfLines:(NSInteger)numberOfLines

@end

@implementation MyTreeViewCell

@synthesize valueLabel, arrowImage;
@synthesize level, expanded;

- (id)initWithStyle:(UITableViewCellStyle)style 
	reuseIdentifier:(NSString *)reuseIdentifier 
			  level:(NSUInteger)_level 
		   expanded:(BOOL)_expanded 
childran:(MyTreeNode *)childranNode nodeImage:(UIImage*) imgNode{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		self.level = _level;
		self.expanded = _expanded;
		
		UIView *content = self.contentView;
		
		self.valueLabel = 
        [self newLabelWithPrimaryColor:[UIColor darkGrayColor] 
							 selectedColor:[UIColor whiteColor] 
								  fontSize:15.0 bold:NO];
		self.valueLabel.textAlignment = NSTextAlignmentLeft;
		[content addSubview:self.valueLabel];
        self.arrowImage =  [[UIImageView alloc] initWithImage:imgNode];
		[content addSubview:self.arrowImage];
    }
      return self;
}
- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
              level:(NSUInteger)_level
           expanded:(BOOL)_expanded
         isSearched:(BOOL)_isSearched
           childran:(MyTreeNode *)childranNode nodeImage:(UIImage*) imgNode{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.level = _level;
        self.expanded = _expanded;
        
        UIView *content = self.contentView;
        
        self.valueLabel =
        [self newLabelWithPrimaryColor:[UIColor darkGrayColor]
                         selectedColor:[UIColor whiteColor]
                              fontSize:15.0 bold:NO];
        self.valueLabel.textAlignment = NSTextAlignmentLeft;
        [content addSubview:self.valueLabel];
        if(_isSearched)
        {
            UIFont *currentFont = self.valueLabel.font;
            UIFont *newFont = [UIFont fontWithName:[NSString stringWithFormat:@"%@-Bold",currentFont.fontName] size:currentFont.pointSize];
            self.valueLabel.font = newFont;
            [self newLabelWithPrimaryColor:[UIColor darkGrayColor]
                             selectedColor:[UIColor whiteColor]
                                  fontSize:15.0 bold:YES];
        }
        self.arrowImage =  [[UIImageView alloc] initWithImage:imgNode];
        [content addSubview:self.arrowImage];
    }
    return self;
}

#pragma mark -
#pragma mark Other overrides

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
	
    if (!self.editing) {
		
		// get the X pixel spot
        CGFloat boundsX = contentRect.origin.x;
		CGRect frame;
		frame = CGRectMake((boundsX + self.level + 1) * LEVEL_INDENT, 
						   0, 
						   SCREEN_WIDTH - (self.level * LEVEL_INDENT), 
						   CELL_HEIGHT);
		self.valueLabel.frame = frame;
		CGRect imgFrame;
		imgFrame = CGRectMake(((boundsX + self.level + 1) * LEVEL_INDENT) - (IMG_HEIGHT_WIDTH + XOFFSET), 
							  YOFFSET, 
							  IMG_HEIGHT_WIDTH, 
							  IMG_HEIGHT_WIDTH);
		self.arrowImage.frame = imgFrame;
	}
}

#pragma mark -
#pragma mark Private category

- (UILabel *)newLabelWithPrimaryColor:(UIColor *)primaryColor 
						selectedColor:(UIColor *)selectedColor 
							 fontSize:(CGFloat)fontSize 
								 bold:(BOOL)bold { //limitedToNumberOfLines:(NSInteger)numberOfLines
    UIFont *font;
    UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    if (bold) {
        UIFont *currentFont = newLabel.font;
        UIFont *newFont = [UIFont fontWithName:[NSString stringWithFormat:@"%@-Bold",currentFont.fontName] size:currentFont.pointSize];
        newLabel.font = newFont;

        //font = [UIFont boldSystemFontOfSize:fontSize];
    } else {
        font = [UIFont systemFontOfSize:fontSize];
    }
	
	newLabel.backgroundColor = [UIColor whiteColor];
	newLabel.opaque = YES;
	newLabel.textColor = primaryColor;
	newLabel.highlightedTextColor = selectedColor;
	newLabel.font = font;
    newLabel.lineBreakMode = UILineBreakModeWordWrap;
	newLabel.numberOfLines = 2;
	return newLabel;
}

@end