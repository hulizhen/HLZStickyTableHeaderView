HLZStickyTableHeaderView
------------------------
This library provides a category for UITableView with support for adding a sticky and stretchable header view on top of table view.

![hlzstickytableheaderview](https://cloud.githubusercontent.com/assets/2831422/16030760/18302ba0-3227-11e6-8105-7f25132a2bc4.gif)

How To Use
----------
Copy the interface and implementation files of the category into your project and include the `UITableView+HLZStickyHeader.h`.

```objective-c
#import "UITableView+HLZStickyHeader.h"

...

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.image = [UIImage imageNamed:@"TableHeader"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.tableView.stickyHeaderView = imageView;
}
```

Check out the demo project to see the details.
