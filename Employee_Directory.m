% Initialize an empty cell array to store employee information
employeeDirectory = cell(0, 4);

while true
    % Display the menu
    fprintf('Employee Directory Menu:\n');
    fprintf('1. Add Employee\n');
    fprintf('2. Display All Employees\n');
    fprintf('3. Search for Employee\n');
    fprintf('4. Update Employee\n');
    fprintf('5. Delete Employee\n');
    fprintf('6. Exit\n');
    
    % Get the user's choice
    choice = input('Enter your choice (1/2/3/4/5/6): ');
    
    if choice == 1
        % Add Employee
        name = input('Enter employee name: ', 's');
        department = input('Enter employee department: ', 's');
        jobTitle = input('Enter employee job title: ', 's');
        contactDetails = input('Enter employee contact details: ', 's');
        
        % Create a cell array to store employee information
        employeeInfo = {name, department, jobTitle, contactDetails};
        
        % Add the employee to the directory
        employeeDirectory = [employeeDirectory; employeeInfo];
        
        fprintf('Employee added to the directory.\n');
    elseif choice == 2
        % Display All Employees
        if isempty(employeeDirectory)
            fprintf('The employee directory is empty.\n');
        else
            fprintf('Employee Directory:\n');
            for i = 1:size(employeeDirectory, 1)
                fprintf('Employee %d:\n', i);
                fprintf('Name: %s\n', employeeDirectory{i, 1});
                fprintf('Department: %s\n', employeeDirectory{i, 2});
                fprintf('Job Title: %s\n', employeeDirectory{i, 3});
                fprintf('Contact Details: %s\n', employeeDirectory{i, 4});
            end
        end
    elseif choice == 3
        % Search for Employee
        searchName = input('Enter the name to search for: ', 's');
        found = false;
        for i = 1:size(employeeDirectory, 1)
            if strcmpi(employeeDirectory{i, 1}, searchName)
                fprintf('Employee found:\n');
                fprintf('Name: %s\n', employeeDirectory{i, 1});
                fprintf('Department: %s\n', employeeDirectory{i, 2});
                fprintf('Job Title: %s\n', employeeDirectory{i, 3});
                fprintf('Contact Details: %s\n', employeeDirectory{i, 4});
                found = true;
                break;
            end
        end
        if ~found
            fprintf('Employee not found in the directory.\n');
        end
    elseif choice == 4
        % Update Employee
        if isempty(employeeDirectory)
            fprintf('The employee directory is empty. Nothing to update.\n');
        else
            searchName = input('Enter the name of the employee to update: ', 's');
            found = false;
            for i = 1:size(employeeDirectory, 1)
                if strcmpi(employeeDirectory{i, 1}, searchName)
                    fprintf('Employee found. Please update the information:\n');
                    name = input('Enter updated name: ', 's');
                    department = input('Enter updated department: ', 's');
                    jobTitle = input('Enter updated job title: ', 's');
                    contactDetails = input('Enter updated contact details: ', 's');
                    
                    % Update the employee's information
                    employeeDirectory{i, 1} = name;
                    employeeDirectory{i, 2} = department;
                    employeeDirectory{i, 3} = jobTitle;
                    employeeDirectory{i, 4} = contactDetails;
                    
                    fprintf('Employee information updated.\n');
                    found = true;
                    break;
                end
            end
            if ~found
                fprintf('Employee not found in the directory. No employee updated.\n');
            end
        end
    elseif choice == 5
        % Delete Employee
        if isempty(employeeDirectory)
            fprintf('The employee directory is empty. Nothing to delete.\n');
        else
            searchName = input('Enter the name of the employee to delete: ', 's');
            found = false;
            for i = 1:size(employeeDirectory, 1)
                if strcmpi(employeeDirectory{i, 1}, searchName)
                    employeeDirectory(i, :) = []; % Delete the employee
                    fprintf('Employee deleted from the directory.\n');
                    found = true;
                    break;
                end
            end
            if ~found
                fprintf('Employee not found in the directory. No employee deleted.\n');
            end
        end
    elseif choice == 6
        % Exit the program
        fprintf('Exiting the Employee Directory program.\n');
        break;
    else
        fprintf('Invalid choice. Please enter 1, 2, 3, 4, 5, or 6.\n');
    end
end
