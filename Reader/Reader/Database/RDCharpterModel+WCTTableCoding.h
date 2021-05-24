//
//  RDCharpterModel+WCTTableCoding.h
//  Reader
//
//  Created by 陈保瑞 on 2020/11/21.
//  Copyright © 2020 yuenov. All rights reserved.
//

#import "RDCharpterModel.h"
#import <WCDB/WCDB.h>

@interface RDCharpterModel (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(primaryId)
WCDB_PROPERTY(charpterId)
WCDB_PROPERTY(name)
WCDB_PROPERTY(content)
WCDB_PROPERTY(bookId)
WCDB_PROPERTY(bookName)
WCDB_PROPERTY(author)


@end
