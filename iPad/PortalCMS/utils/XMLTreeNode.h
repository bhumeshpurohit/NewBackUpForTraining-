/******************************** HEAD_BEG ************************************
 * Project					: Xml2Obj
 * Module                   : Demo
 * Responsible for module	: I.Iordanov
 *
 * Filename					: XMLTreeNode.h
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
 * HISTORY:
 * --- 02/15/2009 -- John Stump -- Created by John Stump on 
 * --- 03/23/2010 -- I.Iordanov -- Integrated by I.Iordanov 
 *
 ********************************* HEAD_END ************************************/


#import <Foundation/Foundation.h>


@interface XMLTreeNode : NSObject {
	XMLTreeNode* parent;
	NSString* name;	// element name ("pages", "belongings", etc)
	NSMutableDictionary* attributes;
	NSMutableString* text;	// from foundCharacters()
	NSMutableDictionary* children;	// key is child's element name, value is NSMutableArray of tree nodes
}

@property (nonatomic,retain) XMLTreeNode* parent;
@property (nonatomic,retain) NSString* name;
@property (nonatomic,retain) NSMutableDictionary* attributes;
@property (nonatomic,retain) NSMutableString* text;
@property (nonatomic,retain) NSMutableDictionary* children;

- (XMLTreeNode*) init;
- (void) dealloc;

// this will return an array of children matching the given element name
- (NSArray*) findChildren:(NSString*) name;

// this will return the child node with the given name 
// (will return the 1st occurrence if there are more)
- (XMLTreeNode*) findChild:(NSString*) name;

// this will return the nth child with the given name
- (XMLTreeNode*) findChild:(NSString*) name at:(NSInteger) position;

- (NSString*) description;

@end
