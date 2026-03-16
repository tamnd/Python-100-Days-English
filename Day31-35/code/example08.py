"""
Encryption and decryption.
Symmetric encryption uses the same key for encryption and decryption.
Asymmetric encryption uses different keys, such as RSA.
pip install pycrypto
"""
import base64

from hashlib import md5

from Crypto.Cipher import AES
from Crypto import Random
from Crypto.PublicKey import RSA

# # AES key (32 bytes)
# key = md5(b'1qaz2wsx').hexdigest()
# # AES initialization vector
# iv = Random.new().read(AES.block_size)


def main():
    """Program entry point."""
    # Generate a key pair.
    key_pair = RSA.generate(1024)
    # Import the public key.
    pub_key = RSA.importKey(key_pair.publickey().exportKey())
    # Import the private key.
    pri_key = RSA.importKey(key_pair.exportKey())
    message1 = 'hello, world!'
    # Encrypt data.
    data = pub_key.encrypt(message1.encode(), None)
    # BASE64-encode the encrypted data.
    message2 = base64.b64encode(data[0])
    print(message2)
    # BASE64-decode the encrypted data.
    data = base64.b64decode(message2)
    # Decrypt the data.
    message3 = pri_key.decrypt(data)
    print(message3.decode())
    # # AES - symmetric encryption
    # str1 = 'I love you all!'
    # cipher = AES.new(key, AES.MODE_CFB, iv)
    # # Encrypt
    # str2 = cipher.encrypt(str1)
    # print(str2)
    # # Decrypt
    # cipher = AES.new(key, AES.MODE_CFB, iv)
    # str3 = cipher.decrypt(str2)
    # print(str3.decode())


if __name__ == '__main__':
    main()
