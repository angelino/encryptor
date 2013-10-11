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
    skip
    assert_equal '', @encryptor.encrypt('Hello')
  end
end
