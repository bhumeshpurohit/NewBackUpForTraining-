//
//  MyTreeNode.h
//  MyTreeViewPrototype
//


#import <Foundation/Foundation.h>
#import "MyTreeNode.h"
#import "WebService.h"
#import "WikiChildClass.h"
#import "WikiSearchClass.h"

@interface MyTreeNode : NSObject {
	int nodeId;
    NSString *nodeIdString;
    NSString *rootNodeId;
    NSString *docData;
	NSString *value;
	MyTreeNode *parent;
	NSMutableArray *children;
	BOOL inclusive;
	NSArray *flattenedTreeCache;
    BOOL isDocument;
    NSString *nodeTitle;
}
@property (nonatomic) int nodeId;
@property (nonatomic, retain) NSString *value;
@property (nonatomic, retain) NSString *nodeIdString,*rootNodeId;
@property (nonatomic, retain) NSString *docData;
@property (nonatomic, retain) NSString *nodeTitle;
@property (nonatomic, retain) MyTreeNode *parent;
@property (nonatomic, retain, readonly) NSMutableArray *children;
@property (nonatomic) BOOL inclusive,isDocument;
@property (nonatomic, retain) UIImage *imgNode;
@property (nonatomic) BOOL isSearched;

- (id)initWithValue:(NSString *)_value;
- (void)addChild:(MyTreeNode *)newChild;
- (NSUInteger)descendantCount;
- (NSUInteger)levelDepth;
- (NSArray *)flattenElements;
- (NSArray *)flattenElementsWithCacheRefresh:(BOOL)invalidate;
- (BOOL)isRoot;
- (BOOL)hasChildren;

@end
