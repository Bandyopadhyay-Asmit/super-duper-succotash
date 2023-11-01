% Initialize an empty cell array to store inventory data
inventory = {};

% Menu-driven program
while true
    disp('Inventory Management Menu:');
    disp('1. Add Product');
    disp('2. Update Product');
    disp('3. Remove Product');
    disp('4. Display Inventory');
    disp('5. Exit');
    
    choice = input('Enter your choice (1-5): ');
    
    switch choice
        case 1  % Add Product
            product = struct('Name', '', 'Price', 0, 'Quantity', 0);
            product.Name = input('Enter product name: ', 's');
            product.Price = input('Enter product price: ');
            product.Quantity = input('Enter product quantity: ');
            inventory = [inventory; product];
            disp('Product added to inventory.');
        
        case 2  % Update Product
            if isempty(inventory)
                disp('Inventory is empty. Please add products first.');
            else
                displayInventory(inventory);
                item = input('Enter the index of the product to update: ');
                if item >= 1 && item <= numel(inventory)
                    inventory{item}.Name = input('Enter updated product name: ', 's');
                    inventory{item}.Price = input('Enter updated product price: ');
                    inventory{item}.Quantity = input('Enter updated product quantity: ');
                    disp('Product updated.');
                else
                    disp('Invalid index. Please enter a valid index.');
                end
            end
        
        case 3  % Remove Product
            if isempty(inventory)
                disp('Inventory is empty. Nothing to remove.');
            else
                displayInventory(inventory);
                item = input('Enter the index of the product to remove: ');
                if item >= 1 && item <= numel(inventory)
                    inventory(item) = [];
                    disp('Product removed from inventory.');
                else
                    disp('Invalid index. Please enter a valid index.');
                end
            end
        
        case 4  % Display Inventory
            if isempty(inventory)
                disp('Inventory is empty.');
            else
                displayInventory(inventory);
            end
        
        case 5  % Exit
            disp('Exiting the program.');
            break;
        
        otherwise
            disp('Invalid choice. Please enter a valid option (1-5).');
    end
end

% Function to display the inventory
function displayInventory(inventory)
    fprintf('\n%-5s %-20s %-10s %-10s\n', 'Index', 'Product Name', 'Price', 'Quantity');
    for i = 1:numel(inventory)
        fprintf('%-5d %-20s %-10.2f %-10d\n', i, inventory{i}.Name, inventory{i}.Price, inventory{i}.Quantity);
    end
    fprintf('\n');
end
