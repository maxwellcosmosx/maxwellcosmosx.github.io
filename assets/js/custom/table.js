// Function to create table headers
function createTableHeaders() {
    const tableHeaders = document.querySelector('#table-header');
    const columnSelect = document.getElementById('column-select');
    columnSelect.innerHTML = ''; // Clear existing options
    tableHeaders.innerHTML = ''; // Clear existing headers

    header.forEach((headerText, index) => {
        // Create table header
        const createHeaderCell = (text) => {
            const th = document.createElement('th');
            th.textContent = text;
            return th;
        };

        tableHeaders.appendChild(createHeaderCell(headerText));

        // Create column selection options
        const option = document.createElement('option');
        option.value = index;
        option.textContent = `Column ${index + 1}`;
        columnSelect.appendChild(option);
    });

    // Set default selected column
    columnSelect.value = defaultHighlightedColumn;
    document.getElementById('items').textContent = list.length;
}

// Function to display table data
function displayTable(page) {
    const tableBody = document.querySelector('#data-table tbody');
    tableBody.innerHTML = ''; // Clear the table content

    // Calculate start and end index for pagination
    const start = (page - 1) * rowsPerPage;
    const end = start + rowsPerPage;
    const paginatedItems = list.slice(start, end);

    // Populate the table with data
    paginatedItems.forEach(row => {
        const tr = document.createElement('tr');

        row.forEach((cell, index) => {
            const td = document.createElement('td');
            td.innerHTML = cell; // Use innerHTML to allow HTML tags

            // Handle highlighted column logic: apply red text style and hover effects
            if (index === highlightedColumn) {
                td.classList.add('colorful-text');
                td.onmouseover = () => td.classList.add('highlighted');
                td.onmouseout = () => td.classList.remove('highlighted');
            }

            tr.appendChild(td); // Append the cell to the row
        });

        tableBody.appendChild(tr); // Append the row to the table
    });

    // Update the pagination info
    const totalPages = Math.ceil(list.length / rowsPerPage);
    document.getElementById('page-info').textContent = `${page} of ${totalPages}`;
}


// Function to navigate to previous page
function prevPage() {
    if (currentPage > 1) {
        currentPage--;
        displayTable(currentPage);
    }
}

// Function to navigate to next page
function nextPage() {
    if (currentPage < Math.ceil(list.length / rowsPerPage)) {
        currentPage++;
        displayTable(currentPage);
    }
}

// Function to highlight selected column
function highlightColumn() {
    highlightedColumn = parseInt(document.getElementById('column-select').value);
    displayTable(currentPage);
}
