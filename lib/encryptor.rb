class Encryptor
  attr_reader :rotation

  def initialize(rotation)
    @rotation = rotation
  end

  def encrypt(text)
    letters = letters_of(text)

    encrypted_letters = letters.collect do |letter|
      encrypt_letter(letter)
    end

    text_of(encrypted_letters)
  end

  def decrypt(text)
    letters = letters_of(text)

    decrypted_letters = letters.collect do |letter|
      decrypt_letter(letter)
    end

    text_of(decrypted_letters)
  end

  private

  def letters_of(text)
    text.split('')
  end

  def text_of(letters)
    letters.join
  end

  def encrypt_letter(letter)
    encrypt_cipher[letter]
  end

  def decrypt_letter(letter)
    decrypt_cipher[letter]
  end

  def encrypt_cipher
    pairs = suported_characters.zip(rotated_characters)
    Hash[pairs]
  end

  def decrypt_cipher
    pairs = rotated_characters.zip(suported_characters)
    Hash[pairs]
  end

  def suported_characters
    (' '..'z').to_a
  end

  def rotated_characters
    suported_characters.rotate(rotation)
  end
end
