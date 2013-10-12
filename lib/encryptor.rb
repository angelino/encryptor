class Encryptor
  def encrypt(text)
    letters = text.split('')

    encrypted_letters = letters.collect do |letter|
      encrypt_letter(letter)
    end

    encrypted_letters.join
  end

  def decrypt(text)
    letters = text.split('')

    decrypted_letters = letters.collect do |letter|
      decrypt_letter(letter)
    end

    decrypted_letters.join
  end

  private

  def encrypt_letter(letter)
    lowercase_letter = letter.downcase
    cipher[lowercase_letter]
  end

  def decrypt_letter(letter)
    lowercase_letter = letter.downcase
    cipher[lowercase_letter]
  end

  def cipher
    {
      'a' => 'n', 'b' => 'o', 'c' => 'p', 'd' => 'q',
      'e' => 'r', 'f' => 's', 'g' => 't', 'h' => 'u',
      'i' => 'v', 'j' => 'w', 'k' => 'x', 'l' => 'y',
      'm' => 'z', 'n' => 'a', 'o' => 'b', 'p' => 'c',
      'q' => 'd', 'r' => 'e', 's' => 'f', 't' => 'g',
      'u' => 'h', 'v' => 'i', 'w' => 'j', 'x' => 'k',
      'y' => 'l', 'z' => 'm'
    }
  end
end
