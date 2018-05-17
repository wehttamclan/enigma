require './lib/enigma'
require './lib/key_generator'
require 'Date'
require 'minitest/autorun'
require 'minitest/pride'

class EnigmaTest < Minitest::Test
  def test_total_shift
    # binding.pry
    e = Enigma.new
    key = 41521
    a = 49
    b = 18
    c = 54
    d = 25
    expected = [a, b, c, d]
    output = e.total_shift(key)
    assert_equal expected, output
  end

  def test_encrpyt_one_letter
    e = Enigma.new

    output = e.encrypt('b', 41521, 150518)
    expected = e.char_map[50] # (1 + 41 + 8) % 85
    assert_equal expected, output
  end

  def test_encrypt_four_letters
    e = Enigma.new
    # total shift is first and second digits of key plus offset.
    output = e.encrypt('bird', 41521, 150518)
    expected = 'YA(C'
    assert_equal expected, output
  end

  def test_encrypt_words_longer_than_four
    e = Enigma.new
    output = e.encrypt('birdbird', 41521, 150518) # 'bird' encrpyted is 'YA(C'
    expected = 'YA(CYA(C'
    assert_equal expected, output
  end

  def test_encrypt_numbers_and_characters
    e = Enigma.new
    output = e.encrypt('9/?', 41521, 150518)
    expected = 'zoZ' # calculated by hand
    assert_equal expected, output
  end

  def test_decrypt_with_known_ciphertext_known_key
    e = Enigma.new
    key = 41521
    original_message = 'bird'
    ciphertext = 'YA(C'
    decrypted_text = e.decrypt(ciphertext, key)
    assert_equal original_message, decrypted_text
  end

  def test_encrypt_decrypt_with_random_key
    e = Enigma.new
    key = e.keygen.key
    original_message = 'this 1s 5o secret? ..end..'
    ciphertext = e.encrypt(original_message, key)
    decrypted_text = e.decrypt(ciphertext, key)
    assert_equal original_message, decrypted_text
  end

  def test_cipher_shifts_known_plaintext
    e = Enigma.new
    plaintext = 'bird'
    shift = [49, 18, 54, 25] # using key 41521 and date 150518
    expected_ciphertext = 'YA(C'
    ciphertext = e.cipher(plaintext, shift, 1)
    assert_equal expected_ciphertext, ciphertext
  end

  def test_cipher_shifts_known_ciphertext
    e = Enigma.new
    expected_plaintext = 'bird'
    shift = [49, 18, 54, 25] # using key 41521 and date 150518
    known_ciphertext = 'YA(C'
    ciphertext = e.cipher(known_ciphertext, shift, -1)
    assert_equal expected_plaintext, ciphertext
  end
end
