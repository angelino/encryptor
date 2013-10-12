require 'minitest/autorun'

require_relative '../lib/encryptor'

class EncryptorTest < Minitest::Test
  def setup
    @encryptor = Encryptor.new(13)
  end

  def test_encrypt_one_letter
    assert_equal 'z', @encryptor.encrypt('m')
  end

  def test_encrypt_upcase_letter
    assert_equal 'Z', @encryptor.encrypt('M')
  end

  def test_encrypt_word
    assert_equal 'Uryy!', @encryptor.encrypt('Hello')
  end

  def test_decrypt_word
    assert_equal 'secrets', @encryptor.decrypt('%rp$r&%')
  end

  def test_encrypt_text
    assert_equal 'Uryy!-`rp$r&%', @encryptor.encrypt('Hello Secrets')
  end

  def test_decrypt_text
    assert_equal 'hello secrets', @encryptor.decrypt('uryy!-%rp$r&%')
  end

  def test_encrypt_text_with_special_chars
    assert_equal "u't'v u!;\"n&!M\"n&!\"!yv%;p!z", @encryptor.encrypt('huguinho.pato@patopolis.com')
  end

  def test_encrypt_text_with_other_rotation
    e = Encryptor.new(2)
    assert_equal "cdef\"ghij\"klm\"&B%", e.encrypt('abcd efgh ijk $@#')
  end
end
