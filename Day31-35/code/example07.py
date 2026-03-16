"""
Hash digests, digital signatures, and one-way hash functions.

Applications:
1. Storing sensitive data as digests
2. Signing data to detect tampering
3. Deduplication in cloud storage
"""


class StreamHasher():
    """Digest generator."""

    def __init__(self, algorithm='md5', size=4096):
        """Initializer.
        @params:
            algorithm - hashing algorithm
            size - read chunk size
        """
        self.size = size
        cls = getattr(__import__('hashlib'), algorithm.lower())
        self.hasher = cls()
    

    def digest(self, file_stream):
        """Generate a hexadecimal digest string."""
        # data = file_stream.read(self.size)
        # while data:
        #     self.hasher.update(data)
        #     data = file_stream.read(self.size)
        for data in iter(lambda: file_stream.read(self.size), b''):
            self.hasher.update(data)
        return self.hasher.hexdigest()

    def __call__(self, file_stream):
        return self.digest(file_stream)


def main():
    """Program entry point."""
    hasher1 = StreamHasher()
    hasher2 = StreamHasher('sha1')
    hasher3 = StreamHasher('sha256')
    with open('Python-3.7.2.tar.xz', 'rb') as file_stream:
        print(hasher1.digest(file_stream))
        file_stream.seek(0, 0)
        print(hasher2.digest(file_stream))
        file_stream.seek(0, 0)
        print(hasher3(file_stream))


if __name__ == '__main__':
    main()
