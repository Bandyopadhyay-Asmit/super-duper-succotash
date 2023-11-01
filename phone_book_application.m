% Initialize an empty cell array to store contact information
contacts = cell(0, 3);

% Display a menu and handle user input
while true
    disp('Phone Booth Application');
    disp('1. Add Contact');
    disp('2. Delete Contact');
    disp('3. Search Contact');
    disp('4. Display All Contacts');
    disp('5. Exit');
    
    choice = input('Enter your choice: ');

    switch choice
        case 1 % Add Contact
            name = input('Enter name: ', 's');
            phone = input('Enter phone number: ', 's');
            email = input('Enter email: ', 's');
            contact = {name, phone, email};
            contacts = [contacts; contact];
            disp('Contact added successfully.');
        
        case 2 % Delete Contact
            name = input('Enter name to delete: ', 's');
            indices = find(contains(contacts(:, 1), name));
            if ~isempty(indices)
                contacts(indices, :) = [];
                disp('Contact deleted successfully.');
            else
                disp('Contact not found.');
            end
        
        case 3 % Search Contact
            name = input('Enter name to search: ', 's');
            indices = find(contains(contacts(:, 1), name));
            if ~isempty(indices)
                disp('Search Results:');
                disp(contacts(indices, :));
            else
                disp('Contact not found.');
            end
        
        case 4 % Display All Contacts
            if isempty(contacts)
                disp('No contacts to display.');
            else
                disp('All Contacts:');
                disp(contacts);
            end

        case 5 % Exit
            disp('Exiting Phone Booth Application.');
            break;
            
        otherwise
            disp('Invalid choice. Please try again.');
    end
end
