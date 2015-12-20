//
//  CoreDataHelper.h
//  HiPlayer
//
//  Created by Rex on 12/19/15.
//  Copyright © 2015 Sandeep Mukherjee. All rights reserved.
//

#ifndef CoreDataHelper_h
#define CoreDataHelper_h

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataHelper :NSObject

@property (nonatomic, readonly) NSManagedObjectContext       *context;
@property (nonatomic, readonly) NSManagedObjectModel         *model;
@property (nonatomic, readonly) NSPersistentStoreCoordinator *coordinator;
@property (nonatomic, readonly) NSPersistentStore            *store;

- (void) setupCoreData;
- (void) saveContext;

@end


#endif /* CoreDataHelper_h */
