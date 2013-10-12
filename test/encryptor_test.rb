require 'minitest/autorun'

require_relative '../lib/encryptor'

class EncryptorTest < Minitest::Test
  def setup
    @encryptor = Encryptor.new
  end

  def test_encrypt_one_letter
    assert_equal 'z', @encryptor.encrypt('m')
  end

  def test_encrypt_upcase_letter
    assert_equal 'z', @encryptor.encrypt('M')
  end

  def test_encrypt_string
    assert_equal 'uryyb', @encryptor.encrypt('Hello')
  end

  def test_decrypt_string
    assert_equal 'secrets', @encryptor.decrypt('frpergf')
  end
end
