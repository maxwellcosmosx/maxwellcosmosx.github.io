/*
	Table Header
*/
	const header = ['ID','Item','Explanation','Noun'];


/*
	Highlighted Column
*/
	// Default Highlighted Column Index
	const defaultHighlightedColumn = 0;
	// null or 0,1,2...

	// Current Highlighted Column Index
	let highlightedColumn = defaultHighlightedColumn;


/*
	Page
*/
	// Number of Rows For Per Page
	const rowsPerPage = 2500;

	// Default Page Number
	let currentPage = 1;


/*
	Category
*/
	// Default Selected Category
	let currentCategory = null;
	// null or 0,1,2...

	// Category Function
	let noCategory = true;
	// true or false 


/*
	Hyperlink
*/
	// The Column With Hyperlink
	const hyperlinkColumnIndex = 1;
	// null or 0,1,2...

	// URL for the hyperlink
	const hyperlinkURL = 'https://www.ldoceonline.com/dictionary/';


/*
	Search
*/
	// Default Search Query
	let searchQuery = '';


/*
	Functions
*/
createCategoryButtons();
createTableHeaders();
displayTable(currentPage);