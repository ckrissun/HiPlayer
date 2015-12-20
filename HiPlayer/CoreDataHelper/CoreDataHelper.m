//
//  CoreDataHelper.m
//  HiPlayer
//
//  Created by Rex on 12/19/15.
//  Copyright © 2015 Sandeep Mukherjee. All rights reserved.
//

#import "CoreDataHelper.h"

@implementation CoreDataHelper

#define debug 1

#pragma mark - sqlite's file name
NSString *storeFileName = @"db.sqlite";

#pragma mark - store paths
- (NSString *) applicationDocumentDirectory {
    if (debug > 0) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    
    NSArray<NSString *> *directories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [directories lastObject];
}

- (NSURL *) applicationStoreDirectory {
    if (debug > 0) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    
    NSURL *documentDirectoryURL = [NSURL fileURLWithPath:[self applicationDocumentDirectory]];
    NSURL *storeDiretoryURL = [documentDirectoryURL URLByAppendingPathComponent:@"HiPlayer"];
    
    NSFileManager *fileManger = [NSFileManager defaultManager];
    BOOL isStoreDirecotyExist = [fileManger fileExistsAtPath:[storeDiretoryURL path]];
    if (!isStoreDirecotyExist) {
        NSError *error = nil;
        BOOL isCreateSucessful = [fileManger createDirectoryAtURL:storeDiretoryURL
                                      withIntermediateDirectories:YES
                                                       attributes:nil
                                                            error:&error];
        if (isCreateSucessful) {
            if (debug > 1) {
                NSLog(@"Successful to create the store directory");
            }
        } else {
            NSLog(@"Failed to create the store directory");
        }
    }
    return storeDiretoryURL;
}

- (NSURL *) storeURL {
    if (debug > 0) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    return [[self applicationStoreDirectory] URLByAppendingPathComponent:storeFileName];
}

#pragma mark - some setup
- (id) init {
    if (debug > 0) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _model = [NSManagedObjectModel mergedModelFromBundles:nil];
    _coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
    _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_context setPersistentStoreCoordinator:_coordinator];
    return self;
}

- (void) loadStore {
    if (debug > 0) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    
    if (_store) {
        return;
    }
    
    NSError *error = nil;
    _store = [_coordinator addPersistentStoreWithType:NSSQLiteStoreType
                                        configuration:nil
                                                  URL:[self storeURL]
                                              options:nil
                                                error:&error];
    if (_store) {
        if (debug > 0) {
            NSLog(@"Successful to add store: %@", _store);
        }
    } else {
        NSLog(@"Failed to add store, Error: %@", error);
        abort();
    }
}

- (void) setupCoreData {
    if (debug > 0) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    [self loadStore];
}

#pragma mark - data save
- (void) saveContext {
    if (debug > 0) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    
    if ([_context hasChanges]) {
        NSError *error = nil;
        if ([_context save:&error]) {
            if (debug > 0) {
                NSLog(@"_context has saved changes to the persistent store");
            }
        } else {
            NSLog(@"Failed to save _context's changes, Error: %@", error);
        }
    } else {
        NSLog(@"no changes, just skip _context save");
    }
    
}

@end
