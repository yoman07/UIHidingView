//
//  ViewController.m
//  UIHidingView
//
//  Created by Roman Barzyczak on 20.07.2013.
//  Copyright (c) 2013 yoman. All rights reserved.
//

#import "ViewController.h"
#import "UIView+HidingView.h"
@interface ViewController ()

@property (nonatomic, strong) NSArray *tableData;
@property (weak, nonatomic) IBOutlet UIView *hidingView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
	self.tableData = [NSArray arrayWithObjects:@"Cracow",@"Sucha Beskidzka",@"Bielsko-Biala",@"Bialystok",@"Bydgoszcz",@"Czestochowa",@"Elblag",@"Gdansk",@"Gdynia",@"Gliwice",@"Gorzow Wielkopolski",@"Grudziadz",@"Kalisz",@"Katowice",@"Kielce",@"Koszalin",@"Legnica",@"Lublin",@"Olsztyn",@"Opole",@"Radom",@"Plock",@"Rzeszow",@"Sosnowiec",@"Warszawa",@"Wroclaw",@"Torun",@"Tarnow",@"Cracow",@"Sucha Beskidzka",@"Bielsko-Biala",@"Bialystok",@"Bydgoszcz",@"Czestochowa",@"Elblag",@"Gdansk",@"Gdynia",@"Gliwice",@"Gorzow Wielkopolski",@"Grudziadz",@"Kalisz",@"Katowice",@"Kielce",@"Koszalin",@"Legnica",@"Lublin",@"Olsztyn",@"Opole",@"Radom",@"Plock",@"Rzeszow",@"Sosnowiec",@"Warszawa",@"Wroclaw",@"Torun",@"Tarnow", nil];

}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [self.tableData objectAtIndex:indexPath.row];
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.hidingView scrollViewWillBeginDragging:scrollView];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.hidingView scrollViewDidScroll:scrollView];
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}
@end








