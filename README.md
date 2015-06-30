APLTableViewModel	
=================
A table view model which can inform a delegate about changes. Instantiate the table view model with a number of sections and add whatever rows to the respective sections in the model. Get informed about insertions or deletions of rows react accordingly by updating the corresponding table view.

## Installation
Install via cocoapods by adding this to your Podfile:

	pod 'APLTableViewModel', '0.0.1'

## Usage
Import header file:

	#import "APLTableViewModel.h"
	
Use APLTableViewModel like this:
	
	...
	APLTableViewModel *tableViewModel = [[APLTableViewModel alloc] initWithNumberOfSections:1];
	
	tableViewModel.delegate = ...;
	
	[tableViewModel appendItem:... inSection:0]
	...
	