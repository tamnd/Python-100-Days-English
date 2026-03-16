"""
A rooster costs 5, a hen costs 3, and three chicks cost 1.
Find all ways to buy 100 chickens with 100 coins.
"""
for x in range(21):
    for y in range(34):
        z = 100 - x - y
        if z % 3 == 0 and 5 * x + 3 * y + z // 3 == 100:
            print(x, y, z)
