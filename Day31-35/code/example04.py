"""
Greedy method: always make the locally best choice.
It may not be globally optimal, but it often finds a good answer quickly.
"""
class Thing(object):
    """Item."""

    def __init__(self, name, price, weight):
        self.name = name
        self.price = price
        self.weight = weight

    @property
    def value(self):
        """Price-to-weight ratio."""
        return self.price / self.weight


def input_thing():
    """Read one item from standard input."""
    name_str, price_str, weight_str = input().split()
    return name_str, int(price_str), int(weight_str)


def main():
    """Program entry point."""
    max_weight, num_of_things = map(int, input().split())
    all_things = []
    for _ in range(num_of_things):
        all_things.append(Thing(*input_thing()))
    all_things.sort(key=lambda x: x.value, reverse=True)
    total_weight = 0
    total_price = 0
    for thing in all_things:
        if total_weight + thing.weight <= max_weight:
            print(f'The thief takes {thing.name}')
            total_weight += thing.weight
            total_price += thing.price
    print(f'Total value: ${total_price}')


if __name__ == '__main__':
    main()
