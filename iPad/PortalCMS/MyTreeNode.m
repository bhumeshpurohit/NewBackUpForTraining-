//
//  MyTreeNode.m
//  MyTreeViewPrototype


#import "MyTreeNode.h"

@implementation MyTreeNode

@synthesize nodeId, value, imgNode,docData,rootNodeId;
@synthesize parent, children;
@synthesize inclusive,isDocument;
@synthesize nodeIdString;
@synthesize nodeTitle;

#pragma mark -
#pragma mark Initializers

- (id)initWithValue:(NSString *)_value {
	self = [super init];
	if (self) {
		value = _value;
		inclusive = YES;
        _isSearched=false;
	}
	return self;
}

#pragma mark -
#pragma mark Custom Properties

- (NSMutableArray *)children {
	if (!children) {
		children = [[NSMutableArray alloc] initWithCapacity:1];
	}
	
	return children;
}

#pragma mark -
#pragma mark Methods

- (NSUInteger)descendantCount {
	NSUInteger cnt = 0;
    nodeId = 0;
	for (MyTreeNode *child in self.children) {
		if (self.inclusive) {
			cnt++;
            nodeId ++;
			if (child.children.count > 0) {
				cnt += [child descendantCount];
                nodeId += [child descendantCount];
			}
		}
	}
	return cnt;
    return nodeId;
}

- (NSArray *)flattenElements {
	return [self flattenElementsWithCacheRefresh:NO];
}

- (NSArray *)flattenElementsWithCacheRefresh:(BOOL)invalidate {
	if (!flattenedTreeCache || invalidate) {
		//if there was a previous cache and due for invalidate, release resources first
		if (flattenedTreeCache) {
			flattenedTreeCache = nil;
		}
        NSMutableArray *allElements = [[NSMutableArray alloc] initWithCapacity:[self descendantCount]];
		[allElements addObject:self];
		
		if (inclusive) {
			for (MyTreeNode *child in self.children) {
                [allElements addObjectsFromArray:[child flattenElementsWithCacheRefresh:invalidate]];
			}
		}
		  flattenedTreeCache = [[NSArray alloc] initWithArray:allElements];
	}
	 return flattenedTreeCache;
}

- (void)addChild:(MyTreeNode *)newChild {
	
    newChild.parent = self;
	[self.children addObject:newChild];
}

- (NSUInteger)levelDepth {
	if (!parent) return 0;
	
	NSUInteger cnt = 0;
    nodeId = 0;
	cnt++;
    nodeId ++;
	cnt += [parent levelDepth];
    nodeId += [parent levelDepth];
	return cnt;
}

- (BOOL)isRoot {
	return (!parent);
}

- (BOOL)hasChildren {
	return (self.children.count > 0);
}

@end

