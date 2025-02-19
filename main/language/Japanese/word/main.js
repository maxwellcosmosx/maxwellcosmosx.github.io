// Table header list
const header = ['ID','Item','Pronunciation','Class'];

// Default selected column index (0-based)
// null / 0 ...
const defaultHighlightedColumn = 2;

// Number of rows per page
const rowsPerPage = 300;

// Current page number
let currentPage = 1;

// Currently selected category for filtering
// null / 1 ...
let currentCategory = 1;

// Category
// true / false 
let noCategory = false;

// Currently highlighted column index
let highlightedColumn = defaultHighlightedColumn;

// Index of the column to add hyperlink (0-based)
const hyperlinkColumnIndex = 1;

// URL for the hyperlink
const hyperlinkURL = 'https://www.weblio.jp/content/';

// Search query
let searchQuery = '';

// Initialize category buttons, table headers, and table
createCategoryButtons();
createTableHeaders();
displayTable(currentPage);