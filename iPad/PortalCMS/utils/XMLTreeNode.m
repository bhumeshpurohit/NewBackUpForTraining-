/******************************** HEAD_BEG ************************************
 * Project					: Xml2Obj
 * Module                   : Demo
 * Responsible for module	: I.Iordanov
 *
 * Filename					: XMLTreeNode.m
 *
 * Database System			: No
 * Created from             : I.Iordanov
 * Date Creation			: 23/03/2010
 *------------------------------------------------------------------------------
 *                        Description
 *------------------------------------------------------------------------------
 * XMLTreeParser, XMLTreeNode classes extends NSXMLParser functionality to acheave 
 * similar to DOM model parcer for a simple and not big XML. Use the parser to build
 * a tree first, then your application can access the tree afterwards. The tree that 
 * is built uses nodes of type XMLTreeNode.
 *
 * Copyright 2010 MentorMate LLC. All rights reserved.
 *------------------------------------------------------------------------------
 *                        History
 *------------------------------------------------------------------------------
 * HISTORY: see header file
 *
 ********************************* HEAD_END ************************************/

#import "XMLTreeNode.h"


@implementation XMLTreeNode

@synthesize parent;
@synthesize name;
@synthesize attributes;
@synthesize text;
@synthesize children;

- (XMLTreeNode*) init
{
	if((self = [super init])) {
	}
	
	return self;
}

- (void) dealloc
{
	self.parent = nil;
	self.name = nil;
	self.attributes = nil;
	self.text = nil;
	self.children = nil;
	
	[super dealloc];
}


- (NSArray*) findChildren:(NSString *) elementname
{
	return [self.children valueForKey:elementname];
}

- (XMLTreeNode*) findChild:(NSString *) elementname
{
	// for convenience, the element name could have separators in it to infer a hierarchy
	NSArray* tokens = [elementname componentsSeparatedByString:@"/"];
	XMLTreeNode* n = self;
	
	for(NSString* tok in tokens) {
		NSInteger position = 0;
		
		// token could have a position in the format [?]
		NSRange pos = [tok rangeOfString:@"["];
		if(pos.location != NSNotFound) {
			// now pull the substring out
			NSString* index = [tok substringWithRange:NSMakeRange(pos.location+1, [tok length] - pos.location - 2)];
			// get the new position
			position = [index integerValue];
			// take out the index from the token
			tok = [tok substringToIndex:pos.location];
		}
		
		n = [n findChild:tok at:position];
	}
	
	return n;
}

- (XMLTreeNode*) findChild:(NSString*) elementname at:(NSInteger) position
{
	NSArray* f = [self findChildren:elementname];
	if(f)
		return [f objectAtIndex:position];
	else
		return nil;
}

- (NSString*) description
{
	NSMutableString* ret = [[NSMutableString alloc] init];
	
	if(name) {
		[ret appendFormat:@"<%@ ", name];
	}
	
	// get the attributes
	for(id key in attributes) {
		NSString* val = [attributes objectForKey:key];
		[ret appendFormat:@"%@=\"%@\" ", key, val];
	}
	
	// if we have no text and no children, go ahead and terminate the tag now
	if([children count] == 0 && [text length] == 0) {
		[ret appendString:@"/>\n"];
		return [ret autorelease];
	}
	
	if(name) {
		[ret appendString:@">\n"];
	}
	
	// put in any text
	if([text length]) {
		[ret appendFormat:@"%@\n", text];
	}
	
	// get the children data
	for(id key in children) {
		NSArray* list = [children objectForKey:key];
		for(XMLTreeNode* n in list) {
			[ret appendFormat:@"%@", n];
		}
	}
	
	// stick on the end element
	if(name) {
		[ret appendFormat:@"</%@>\n", name];
	}
	
	return [ret autorelease];
}

@end
