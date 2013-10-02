//
//  Photographer+Create.h
//  Photomania
//
//  Created by Nate Armstrong on 10/1/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "Photographer.h"

@interface Photographer (Create)

+(Photographer *)photographerWithName:(NSString *)name inManagedObjectContext:(NSManagedObjectContext *)context;

@end
