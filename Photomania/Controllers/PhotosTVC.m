//
//  PhotosTVC.m
//  Photomania
//
//  Created by Nate Armstrong on 10/7/13.
//  Copyright (c) 2013 CustomBit. All rights reserved.
//

#import "PhotosTVC.h"
#import "Photo.h"

@interface PhotosTVC ()

@end

@implementation PhotosTVC

- (void)setPhotographer:(Photographer *)photographer {
    _photographer = photographer;
    [self setupFetchedResultsController];
    self.navigationController.title = _photographer.name;
}

- (void)setupFetchedResultsController {
    if (_photographer.managedObjectContext) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = [NSPredicate predicateWithFormat:@"photographer = %@", _photographer];
        
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                            managedObjectContext:_photographer.managedObjectContext
                                                                              sectionNameKeyPath:nil cacheName:nil];
    } else {
        self.fetchedResultsController = nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Photo"];
    
    Photo *photo = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = photo.title;
    cell.detailTextLabel.text = photo.subtitle;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"setImageURL:"]) {
        if ([segue.destinationViewController respondsToSelector:@selector(setImageURL:)]) {
            NSString *url = [[self.fetchedResultsController objectAtIndexPath:[self.tableView indexPathForCell:(UITableViewCell *)sender]] valueForKey:@"imageURL"];
            [segue.destinationViewController performSelector:@selector(setImageURL:) withObject:url];
        }
    }
}

@end
