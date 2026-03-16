from random import randint, sample

# Build the pool of red balls.
red_balls = [x for x in range(1, 34)]
# Select six red balls.
selected_balls = sample(red_balls, 6)
# Sort the red balls.
selected_balls.sort()
# Add one blue ball.
selected_balls.append(randint(1, 16))
# Print the generated numbers.
for index, ball in enumerate(selected_balls):
    print('%02d' % ball, end=' ')
    if index == len(selected_balls) - 2:
        print('|', end=' ')
print()
