//
//  DBManager.h
//  TaskTest
//
//  Created by Hải Nguyễn on 15/08/2021.
//

#ifndef DBManager_h
#define DBManager_h

#import <Foundation/Foundation.h>
#import <sqlite3.h>


@interface DBManager : NSObject {
    NSString *databasePath;
}

+(DBManager*) getSharedInstance;
-(BOOL) createDB;

-(BOOL) saveUser:(NSString*)email
           fname:(NSString*)fname
           lname:(NSString*)lname
        password:(NSString*)password
      membership:(NSString*)membership
         address:(NSString*)address
          mobile:(NSString*)mobile;

-(BOOL) saveData:(NSString*)imgName
        latitude:(NSString*)latitude
       longitude:(NSString*)longitude
            time:(NSString*)time;

-(NSMutableArray*) getAllUser;
-(NSMutableArray*) getAllData;

@end

#endif /* DBManager_h */
