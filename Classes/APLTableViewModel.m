//
//  APLTableViewModel.m
//
//  Created by Tino Rachui on 18.02.15.
//  Copyright (c) 2015 apploft GmbH. All rights reserved.
//

#import "APLTableViewModel.h"

@interface APLTableViewModel ()
@property (nonatomic, strong) NSArray *sectionArray;
@end

@implementation APLTableViewModel

-(instancetype)initWithNumberOfSections:(NSUInteger)numberOfSections {
    self = [super init];
    
    if (self) {
        NSMutableArray *sectionArray = [[NSMutableArray alloc] init];
        
        for (NSUInteger i = 0; i < numberOfSections; i++) {
            [sectionArray addObject:[NSMutableArray new]];
        }
        
        _sectionArray = sectionArray;
    }
    return self;
}

-(void)appendItem:(id)item inSection:(NSUInteger)section {
    NSParameterAssert(section < [self.sectionArray count]);
    
    [self.sectionArray[section] addObject:item];
    
    if ([self.delegate respondsToSelector:@selector(tableViewModel:didAppenItem:atIndexPath:)]) {
        NSUInteger insertRow = [self.sectionArray[section] count] - 1;
        [self.delegate tableViewModel:self didAppenItem:item atIndexPath:[NSIndexPath indexPathForRow:insertRow inSection:section]];
    }
}

-(void)insertItem:(id)item atIndexPath:(NSIndexPath *)indexPath {
    NSParameterAssert(indexPath.section < [self.sectionArray count]);
    
    NSMutableArray *rowsAtSection = self.sectionArray[indexPath.section];
    [rowsAtSection insertObject:item atIndex:indexPath.row];
    
    if ([self.delegate respondsToSelector:@selector(tableViewModel:didInsertItem:atIndexPath:)]) {
        [self.delegate tableViewModel:self didInsertItem:item atIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
    }
}

-(void)removeItemAtIndexPath:(NSIndexPath *)indexPath {
    NSParameterAssert(indexPath.section < [self.sectionArray count]);
    
    NSMutableArray *rowsAtSection = self.sectionArray[indexPath.section];
    
    NSParameterAssert(indexPath.row < [rowsAtSection count]);
    
    id item = [self itemAtIndexPath:indexPath];
    
    [rowsAtSection removeObjectAtIndex:indexPath.row];
    
    if ([self.delegate respondsToSelector:@selector(tableViewModel:didRemoveItem:atIndexPath:)]) {
        [self.delegate tableViewModel:self didRemoveItem:item atIndexPath:indexPath];
    }
}

-(id)itemAtIndexPath:(NSIndexPath *)indexPath {
    NSParameterAssert(indexPath.section < [self.sectionArray count]);
    
    NSMutableArray *rowsAtSection = self.sectionArray[indexPath.section];
    
    NSParameterAssert(indexPath.row < [rowsAtSection count]);
    
    return rowsAtSection[indexPath.row];
}

-(NSUInteger)numberOfRowsInSection:(NSUInteger)section {
    NSParameterAssert(section < [self.sectionArray count]);
    
    NSMutableArray *rowsAtSection = self.sectionArray[section];
    return [rowsAtSection count];
}

-(NSUInteger)numberOfSections {
    return [self.sectionArray count];
}

@end

