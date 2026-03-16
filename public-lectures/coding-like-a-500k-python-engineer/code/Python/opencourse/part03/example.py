"""Simple poker deck example."""
import enum
import random


@enum.unique
class Suite(enum.Enum):
    """Card suit."""
    SPADE, HEART, CLUB, DIAMOND = range(4)


class Card:
    """Playing card."""

    def __init__(self, suite, face):
        self.suite = suite
        self.face = face

    def __repr__(self):
        suites = '♠♥♣♦'
        faces = ['', 'A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
        return f'{suites[self.suite.value]}{faces[self.face]}'


class Poker:
    """Deck of cards."""

    def __init__(self):
        self.cards = [Card(suite, face) for suite in Suite
                      for face in range(1, 14)]
        self.current = 0

    def shuffle(self):
        """Shuffle the deck."""
        self.current = 0
        random.shuffle(self.cards)

    def deal(self):
        """Deal one card."""
        card = self.cards[self.current]
        self.current += 1
        return card

    @property
    def has_next(self):
        """Whether there are cards left to deal."""
        return self.current < len(self.cards)


def main():
    """Program entry point."""
    poker = Poker()
    poker.shuffle()
    print(poker.cards)


if __name__ == '__main__':
    main()
