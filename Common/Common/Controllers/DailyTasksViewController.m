//
//  DailyTasksViewController.m
//  Example
//
//  Created by Emil Wojtaszek on 10.03.2013.
//  Copyright (c) 2013 AppUnite.com. All rights reserved.
//

//Controllers
#import "DailyTasksViewController.h"

//Cells
#import "DailyTaksCell.h"

//Views
#import "DailyTasksView.h"

@interface DailyTasksViewController ()
- (void)previousDayAction:(id)sender;
- (void)subsequentDayAction:(id)sender;
@end

@implementation DailyTasksViewController {
    // Views
    __weak DailyTasksView* _dailyTasksView;
    
    //Others
    NSDateFormatter* _dateFormatter;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"h:mm a"];
    }
    return self;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadView {
    // get app frame
    CGRect rect = [[UIScreen mainScreen] applicationFrame];

    // create and assign view
    DailyTasksView* view = [[DailyTasksView alloc] initWithFrame:rect];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.view = view;
    
    // save weak referance
    _dailyTasksView = view;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (UITableView *)tableView {
    return _dailyTasksView.tableView;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];

    // set default date
    [self setDate:[NSDate date]];
    
    // setup tabel view
    [_dailyTasksView.tableView setDelegate:self];
    [_dailyTasksView.tableView setDataSource:self];

    // add buttons actions
    [_dailyTasksView.previousDayButton addTarget:self
                                          action:@selector(previousDayAction:)
                                forControlEvents:UIControlEventTouchUpInside];
    [_dailyTasksView.subsequentDayButton addTarget:self
                                          action:@selector(subsequentDayAction:)
                                forControlEvents:UIControlEventTouchUpInside];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidUnload {
    [super viewDidUnload];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)shouldAutorotate {
    return YES;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSUInteger)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskAll);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)createDataLoaders {
    // create and add (to self.dataLoadsers dictionary) your own data loaders
    
    /**  
     
    Example implementation
     
    // add local data laoder
    AULocalDataLoader* local = [[AULocalDataLoader alloc] initWithDelegate:self];
    [local setFetchRequest:[<#(Class *)#> fetchRequest]];
    [local setSortDescriptor:[NSSortDescriptor sortDescriptorWithKey:<#(NSString *)#> ascending:YES]];
    [self addBasicLocalDataLoader:local];
     
    */
}


#pragma mark - UITableView DataSource

////////////////////////////////////////////////////////////////////////////////////////////////////
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier  = @"Cell";
    DailyTaksCell *cell = (DailyTaksCell *)[tableView dequeueReusableCellWithIdentifier: CellIdentifier];
    
    if (cell == nil) {
        cell = [[DailyTaksCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    // configure cell
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)configureCell:(DailyTaksCell *)cell atIndexPath:(NSIndexPath *)indexPath {
//    // get managed object from store
//    <#(NSManagedObject *)#> object = [[self basicLocalDataLoader] objectAtIndexPath:indexPath];
//    
//    // configurate cell
    
    // setters
    [cell setTaskText:@"Wash the dishes"];
    [cell setParticipantsText:@"John Smith, Barack Obama & 2 others invited"];

    NSString* startDate = [_dateFormatter stringFromDate:[NSDate date]];
    NSString* endDate = [_dateFormatter stringFromDate:[NSDate date]];
    [cell setTaskDateText:[NSString stringWithFormat:@"%@ - %@", startDate, endDate]];
}


#pragma mark - UITableView Delegate

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - Actions

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)previousDayAction:(id)sender {
    // add ane day to current date
    NSDateComponents* components = [[NSDateComponents alloc] init];
    [components setDay: -1];
    
    // set new date
    self.date = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:_date options:0];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)subsequentDayAction:(id)sender {

    // add ane day to current date
    NSDateComponents* components = [[NSDateComponents alloc] init];
    [components setDay: 1];

    // set new date
    self.date = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:_date options:0];
}


#pragma mark - Setters

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setDate:(NSDate *)date {
    if (![_date isEqualToDate:date]) {
        // save new date
        _date = date;
        
        // update view
        [_dailyTasksView setDate:date];
    }
}





#pragma mark - Temp

////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

@end
