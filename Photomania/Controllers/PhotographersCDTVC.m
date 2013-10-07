//
//  PhotographersCDTVC.m
//  Photomania
//
//  Created by Nate Armstrong on 10/1/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "PhotographersCDTVC.h"
#import "Photographer.h"

@implementation PhotographersCDTVC

- (void)setContext:(NSManagedObjectContext *)context {
    _context = context;
    if (context) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photographer"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                  ascending:YES
                                                                   selector:@selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = nil; // all photographers
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    } else {
        self.fetchedResultsController = nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Photographer"];
    
    Photographer *photographer = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = photographer.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d photos", [photographer.photos count]];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = nil;
    
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        indexPath = [self.tableView indexPathForCell:sender];
    }
    
    if (indexPath) {
        if ([segue.identifier isEqualToString:@"setPhotographer:"]) {
            if ([segue.destinationViewController respondsToSelector:@selector(setPhotographer:)]) {
                Photographer *photographer = [self.fetchedResultsController objectAtIndexPath:indexPath];
                [segue.destinationViewController performSelector:@selector(setPhotographer:) withObject:photographer];
            }
        }
    }
}

@end
