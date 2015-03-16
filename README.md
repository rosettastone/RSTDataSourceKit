# RSTDataSourceKit
*Data source objects that keep your view controllers light*

## About

We believe in [lighter view controllers](http://www.objc.io/issue-1/) and less boilerplate code. This library aims to address these issues, specifically regarding the data source objects associated with `UITableView` and `UICollectionView`, while maintaing a focus on [SOLID](http://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) design principles and unit-testable code.

## Requirements

* iOS 8.0+
* ARC
* Xcode 6+

## Getting Started

#### Example

The following illustrates a simple example of how to setup a simple data source with a table view.

````objective-c
NSString *cellId = @"tableViewCell";

// register cells
[self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil] forCellReuseIdentifier:cellId];

// create view models to display in table view
NSArray *viewModels = [NSArray new]; /* an array of view models */

// create the cell factory
RSTTableViewCellFactory *cellFactory = [[RSTTableViewCellFactory alloc] initWithCellDequeuingBlock:^UITableViewCell *(UITableView *tableView, id item, NSIndexPath *indexPath) {
    return [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
}];

// create the data source object
self.dataSource = [[RSTTableViewArrayDataSource alloc] initWithItems:viewModels
                                                         cellFactory:cellFactory
                                              cellConfigurationBlock:^(UITableView *tableView, UITableViewCell *cell, id item, NSIndexPath *indexPath) {
                                                  // configure cell with the view model
                                                  ViewModel *viewModel = (ViewModel *)item;
                                                  TableViewCell *customCell = (TableViewCell *)cell;

                                                  customCell.textLabel.text = viewModel.title;
                                                  customCell.detailTextLabel.text = viewModel.subtitle;
                                              }];

// hook up data source to table view
self.tableView.dataSource = self.dataSource;
````

#### Demo project

````bash
# Running the demo project
$ git clone https://github.com/rosettastone/RSTDataSourceKit.git
$ cd RSTDataSourceKit
$ ./podinstall.sh
$ open RSTDataSourceKit.xcworkspace
````

## Contributing

See `CONTRIBUTING.md`.

## License

`RSTDataSourceKit` is released under the [BSD 3.0 License][bsdLink]. See `LICENSE` for details.

>**Copyright &copy; 2015 Rosetta Stone.**

[bsdLink]:http://opensource.org/licenses/BSD-3-Clause
