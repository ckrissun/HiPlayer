//
//  BaseClient.h
//  HiPlayer
//
//  Created by Paqin on 1/5/16.
//  Copyright © 2016 Sandeep Mukherjee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"

@interface BaseClient : NSObject

@property(nonatomic,retain) AFHTTPSessionManager* manager;
@property(nonatomic,retain) NSString* baseUrl;

-(NSString*) GetSMSVerificationCodeForMobile: (NSString *)mobileNumber;
-(NSString*) Register: (NSString *) role
            mobNumber: (NSString *) number
     verficiationCode:  (NSString *) code
          registeType: (NSString *) type;

-(NSString *) login : (NSString *) mobNum
              passed: (NSString *) passwd
         registeType: (NSString *) type;

-(NSString *) getSubjectForUserId: (NSString *) userId
                     subjectLimit: (NSInteger *) subjectLimit
                        noteLimit: (NSInteger *) noteLimit
                     commentLimit: (NSInteger *) commentLimit
                            since: (NSDate *) since
                           before: (NSDate*) before;

-(NSString *) getSubjectById: (NSString *) subjectId
                   noteLimit: (NSInteger *) noteLimit
                commentLimit: (NSInteger *) commentLimit;

-(NSString *) createSubjectById: (NSString *) name
                         userId: (NSInteger *) userId
                      subjectId:(NSString *) subjectId;




@end
