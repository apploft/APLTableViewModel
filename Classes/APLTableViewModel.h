//
//  APLTableViewModel.h
//
//  Created by Tino Rachui on 18.02.15.
//  Copyright (c) 2015 apploft GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APLTableViewModel;

@protocol APLTableViewModelDelegate <NSObject>
@optional
/**
 *  Will be called in response to appending an item to a section.
 *
 *  @param model the instance
 *  @param item the item which has been appended
 *  @param indexPath the index path of the newly appended item
 */
-(void)tableViewModel:(APLTableViewModel*)model  didAppenItem:(id)item  atIndexPath:(NSIndexPath*)indexPath;
/**
 *  Will be called in response to inserting an item at a specified location
 *
 *  @param model the instance
 *  @param item the item which has been inserted
 *  @param indexPath the index path of the newly inserted item
 */
-(void)tableViewModel:(APLTableViewModel*)model didInsertItem:(id)item atIndexPath:(NSIndexPath*)indexPath;
/**
 *  Will be called in response to removing an item to a section.
 *
 *  @param model the instance
 *  @param item which has been removed
 *  @param indexPath the index path of the removed item before it has been removed
 */
-(void)tableViewModel:(APLTableViewModel*)model didRemoveItem:(id)item atIndexPath:(NSIndexPath*)indexPath;

@end

/**
 *  A table view model which can inform a delegate about changes to its content.
 */
@interface APLTableViewModel : NSObject
// a delegate to be informed about changes to the content of the table view model
@property (nonatomic, weak) id<APLTableViewModelDelegate> delegate;

/**
 *  The designated initializer
 *
 *  @param numberOfSections this model consists of
 *
 *  @return an instance
 */
-(instancetype)initWithNumberOfSections:(NSUInteger)numberOfSections;
/**
 *  Append an item to the model
 *
 *  @param item    the item to append
 *  @param section the section the item should belong to
 */
-(void)appendItem:(id)item inSection:(NSUInteger)section;
/**
 *  Insert an item at a specific index path.
 *
 *  @param item      the item to insert
 *  @param indexPath specifying the location where to add the item
 */
-(void)insertItem:(id)item atIndexPath:(NSIndexPath*)indexPath;
/**
 *  Remove an item.
 *
 *  @param indexPath specifying the location where to remove the item
 */
-(void)removeItemAtIndexPath:(NSIndexPath*)indexPath;
/**
 *  Retriev the item at the specified location. Invalid locations will
 *  lead to crashes.
 *
 *  @param indexPath the location of the item to retrieve
 *
 *  @return the item
 */
-(id)itemAtIndexPath:(NSIndexPath*)indexPath;
/**
 *  Retrieve the number of rows for the specified section.
 *
 *  @param section the section
 *
 *  @return the number of rows of the specified section.
 */
-(NSUInteger)numberOfRowsInSection:(NSUInteger)section;
/**
 *  Retrieve the number of sections of this table view model
 *
 *  @return the number of sections
 */
-(NSUInteger)numberOfSections;

@end
