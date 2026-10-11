/*
	Table Header
*/
	const header = ['ID','Item','Annotation','Example','Translation'];


/*
	Highlighted Column
*/
	// Default Highlighted Column Index
	const defaultHighlightedColumn = null;
	// null or 0,1,2...

	// Current Highlighted Column Index
	let highlightedColumn = defaultHighlightedColumn;


/*
	Page
*/
	// Number of Rows For Per Page
	const rowsPerPage = 500;

	// Default Page Number
	let currentPage = 1;

/*
	Functions
*/
createTableHeaders();
displayTable(currentPage);