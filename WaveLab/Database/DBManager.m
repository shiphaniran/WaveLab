//
//  DBManager.m
//  TaskTest
//
//  Created by Hải Nguyễn on 15/08/2021.
//

#import "DBManager.h"
static DBManager *sharedInstance = nil;
static sqlite3 *database = nil;
static sqlite3_stmt *statement = nil;

@implementation DBManager

+(DBManager*)getSharedInstance {
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance createDB];
    }
    return sharedInstance;
}

-(BOOL)createDB {
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString:
                    [docsDir stringByAppendingPathComponent: @"user.db"]];
    BOOL isSuccess = YES;
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: databasePath ] == NO) {
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
            char *errMsg;
            const char *sql_stmt1 =
            "create table if not exists userAccount (email text primary key, fname text, lname text, password text, membership text, address text, mobile text)";
            
            if (sqlite3_exec(database, sql_stmt1, NULL, NULL, &errMsg) != SQLITE_OK) {
                isSuccess = NO;
                NSLog(@"Failed to create table userAccount");
            } else {
                NSLog(@"Success to create table userAccount");
            }
            
            const char *sql_stmt2 =
            "create table if not exists userData (imagePath text, latitude text, longitude text, time text)";
            
            if (sqlite3_exec(database, sql_stmt2, NULL, NULL, &errMsg) != SQLITE_OK) {
                isSuccess = NO;
                NSLog(@"Failed to create table userData");
            } else {
                NSLog(@"Success to create table userData");
            }
            
            sqlite3_close(database);
            return isSuccess;
        } else {
            isSuccess = NO;
            NSLog(@"Failed to open/create database");
        }
    }
    return isSuccess;
}

- (BOOL) saveUser:(NSString*)email
            fname:(NSString*)fname
            lname:(NSString*)lname
         password:(NSString*)password
       membership:(NSString*)membership
          address:(NSString*)address
           mobile:(NSString*)mobile {
    const char *dbpath = [databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into userAccount values(\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")",
                               email, fname, lname, password, membership, address, mobile];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
        
        if (sqlite3_step(statement) == SQLITE_DONE) {
            return YES;
        } else {
            return NO;
        }
    }
    return NO;
}

- (BOOL) saveData:(NSString*)imgName
         latitude:(NSString*)latitude
        longitude:(NSString*)longitude
             time:(NSString*)time {
    const char *dbpath = [databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into userData values(\"%@\", \"%@\", \"%@\", \"%@\")",
                               imgName, latitude, longitude, time];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
        
        sqlite3_reset(statement);
        if (sqlite3_step(statement) == SQLITE_DONE) {
            return YES;
        } else {
            return NO;
        }
    }
    return NO;
}

-(NSMutableArray*) getAllUser {
    const char *dbpath = [databasePath UTF8String];
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        NSString *querySQL = [NSString stringWithFormat:
                              @"select * from userAccount"];
        
        sqlite3_stmt *query_stmt = NULL;
        sqlite3_prepare_v2(database, [querySQL UTF8String], -1, &statement, NULL);
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            
            NSString *email = [[NSString alloc] initWithUTF8String:
                               (const char *) sqlite3_column_text(statement, 0)];
            
            NSString *pwd = [[NSString alloc] initWithUTF8String:
                             (const char *) sqlite3_column_text(statement, 3)];
            
            [dic setObject:email forKey:@"email"];
            [dic setObject:pwd forKey:@"password"];
            
            [resultArray addObject:dic];
        }
        
        sqlite3_finalize(query_stmt);
    }
    return resultArray;
}

-(NSMutableArray*) getAllData {
    const char *dbpath = [databasePath UTF8String];
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        NSString *querySQL = [NSString stringWithFormat:
                              @"select * from userData"];
        
        sqlite3_stmt *query_stmt = NULL;
        sqlite3_prepare_v2(database, [querySQL UTF8String], -1, &statement, NULL);
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            
            NSString *imageName = [[NSString alloc] initWithUTF8String:
                                   (const char *) sqlite3_column_text(statement, 0)];
            
            NSString *latitude = [[NSString alloc] initWithUTF8String:
                                  (const char *) sqlite3_column_text(statement, 1)];
            
            NSString *longitude = [[NSString alloc] initWithUTF8String:
                                   (const char *) sqlite3_column_text(statement, 2)];
            
            NSString *time = [[NSString alloc] initWithUTF8String:
                              (const char *) sqlite3_column_text(statement, 3)];
            
            [dic setObject:imageName forKey:@"imageName"];
            [dic setObject:latitude forKey:@"latitude"];
            [dic setObject:longitude forKey:@"longitude"];
            [dic setObject:time forKey:@"time"];
            
            [resultArray addObject:dic];
        }
        
        sqlite3_finalize(query_stmt);
    }
    return resultArray;
}

@end
