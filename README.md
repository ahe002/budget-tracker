# budget-tracker
Summary: UW-P / CSCI-324/IOS-based budget-tracker, separate from banking apps. Allows for separate budgets to be set to ensure enough to cover the bills for the day/week/month/year.

Versions:
home: Most final version of the app, only updated with functional features once they work without error.

function-test: Version of the app used for testing features, is updated to match home but has additional unfinished features.

Swift Files:
	ContentView:
The views for all of the pages (minus the detailed balance view, look at home for that)
Views:
	WelcomeScreen:
	Visuals and Styles for the first screen you see when the app is open
	Access buttons to the BudgetSelectionView and CreateBudgetView
CreateBudgetView:
	It has a finished visual appearance
	Allows users to choose a name and amount of money for a new budget
	No limits set for characters or money amount
	(function-test only) Able to save data created with a button press
BudgetSelectionView:
	Visuals are completed but not final
	Shows the created budgets two are generated at load, Weekly: Spending and 	Monthly: Rent
	(function-test only) Able to access the data from the custom budgets made 	with CreateBudgetView
	Budgets are not visible within the app but the data can be found
AddSubtractView:
		Completed visuals
		Accessed by the view when clicked on the button inside each 			budget’s individual detailed view
		Able to add and subtract from the selected budget and changes are 		reflected when inside the budget
		Changes do not show when outside of the budget’ specific  view
		They are not saved when the user comes back later so mods would have to be done again
ContentView:
How the app is accessed so it starts at WelcomeScreen
	home:
The only function inside a separate view for functional purposes
The detailed balance view:
Completed visual design
Access back to the selection view and the add/subtract functions are done with buttons
Clear where all the parts are located
Only the money amount is shown, the specific balance name is not shown for functionality’s sake
Variables to receive the correct data when selected from another view
	budget_trackerApp:
Sends the app to ContentView in ContentView which will bring the user to the home page when the app is loaded
budget_trackerTests: 
Unused, was going to be functional examples with different types of accounts) 

Other Notes:
Various protocols, classes, structs, and states are found within the project, these allow for the data to be accessed by multiple parts of the project
This is a very long file but the notes of the views match the order in which they are written in the file so if you are looking for a specific one just follow this order
These are written with a mobile format in mind so, emulation of it with one of those is preferred
The app is not live anywhere on any databases, like Firebase, so the code is needed to access all moving parts, this also means that any changes made will not be saved when the app is opened again
The progress charts are bare-bones but give a general idea as to what is working currently
Below is the most updated chart:
Budget Tracker Progress Chart
Key X = done, / = in progress, O = no work yet
Other:
GitHub - X (https://github.com/ahe002/budget-tracker)
Firebase (optional) - O
Application:
App Functions - /
Enter - X
Home - X
Budget - X
Calculator - X
Adding Separate Budgets - /
Background Aesthetics - X
Text Aesthetics - X
Documentation- O
Other Features (Not Final On What They Are) - /

