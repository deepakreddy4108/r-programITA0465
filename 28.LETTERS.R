set.seed(123)

random_letters <- sample(LETTERS, size = 20, replace = TRUE)

letters_factor <- factor(random_letters)

five_levels <- levels(letters_factor)[1:5]

print(five_levels)
