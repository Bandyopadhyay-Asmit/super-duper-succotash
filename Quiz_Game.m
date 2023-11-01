% Define the cell array to store questions and answers
quizData = {
    'What is the capital of France?', {'A. London', 'B. Berlin', 'C. Paris', 'D. Madrid'}, 'C';
    'Which planet is known as the Red Planet?', {'A. Venus', 'B. Mars', 'C. Jupiter', 'D. Saturn'}, 'B';
    'What is the largest mammal on Earth?', {'A. Elephant', 'B. Giraffe', 'C. Blue Whale', 'D. Cheetah'}, 'C';
    'How many continents are there in the world?', {'A. 5', 'B. 6', 'C. 7', 'D. 8'}, 'B';
};

% Shuffle the questions for randomness
shuffledData = quizData(randperm(size(quizData, 1)), :);

% Initialize variables
score = 0;
totalQuestions = size(shuffledData, 1);

% Main game loop
for currentIndex = 1:totalQuestions
    fprintf('Welcome to the Quiz Game!\n');
    fprintf('Question %d of %d:\n', currentIndex, totalQuestions);
    fprintf('%s\n', shuffledData{currentIndex, 1}); % Display the question
    
    % Display shuffled multiple-choice options
    randomizedOptions = shuffledData{currentIndex, 2}(randperm(length(shuffledData{currentIndex, 2})));
    for i = 1:length(randomizedOptions)
        fprintf('%s\n', randomizedOptions{i});
    end
    
    % Prompt the user for their answer
    userAnswer = input('Enter your answer (A/B/C/D): ', 's');
    
    % Check the answer
    correctAnswer = shuffledData{currentIndex, 3};
    
    if strcmpi(userAnswer, correctAnswer)
        fprintf('Correct!\n');
        score = score + 1;
    else
        fprintf('Wrong! The correct answer is %s.\n', correctAnswer);
    end
    
    % Wait for a moment before the next question (optional)
    pause(2);
end

% Display final score
fprintf('Quiz completed! Your final score is %d out of %d.\n', score, totalQuestions);

% Thank the user for playing
fprintf('Thank you for playing the Quiz Game!\n');
