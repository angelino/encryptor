class Encryptor
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
    lowercase_letter = letter.downcase
    cipher[lowercase_letter]
  end

  def decrypt_letter(letter)
    lowercase_letter = letter.downcase
    cipher[lowercase_letter]
  end

  def cipher(rotate = 13)
    characters = ('a'..'z').to_a
    rotate_characters = characters.rotate(rotate)
    pairs = characters.zip(rotate_characters)
    Hash[pairs]
  end
end
