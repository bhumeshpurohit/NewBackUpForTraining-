/******************************** HEAD_BEG ************************************
 * Project					: Xml2Obj
 * Module                   : Demo
 * Responsible for module	: I.Iordanov
 *
 * Filename					: XMLTreeParser.h
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

@class XMLTreeNode;

@interface XMLTreeParser : NSObject <NSXMLParserDelegate>{
	XMLTreeNode* root;
	NSMutableArray* stack;
}

@property (nonatomic,retain) XMLTreeNode* root;
@property (nonatomic,retain) NSMutableArray* stack;

- (XMLTreeParser*) init;
- (void) dealloc;

// start parsing, return root
- (XMLTreeNode*) parse:(NSData*) data;

@end
