% Initialize a cell array to store imported data
dataCellArray = {};

while true
    % Display a menu for file type selection
    fprintf('Select a file type to import data:\n');
    fprintf('1. CSV\n');
    fprintf('2. TXT\n');
    fprintf('3. XLSX\n');
    fprintf('4. Exit\n');
    
    choice = input('Enter your choice: ');
    
    switch choice
        case 1
            % Import data from CSV
            filename = input('Enter the CSV file name: ', 's');
            data = readcell(filename); 
            dataCellArray{end+1} = data;
        case 2
            % Import data from TXT
            filename = input('Enter the TXT file name: ', 's');
            data = readcell(filename);
            dataCellArray{end+1} = data;
        case 3
            % Import data from XLSX
            filename = input('Enter the XLSX file name: ', 's');
            data = readcell(filename);
            dataCellArray{end+1} = data;
        case 4
            % Exit the program
            fprintf('Exiting the program.\n');
            break;
        otherwise
            fprintf('Invalid choice. Please select a valid option.\n');
    end
end

% Display the imported data
for i = 1:numel(dataCellArray)
    fprintf('Data from File %d:\n', i);
    disp(dataCellArray{i});
end

