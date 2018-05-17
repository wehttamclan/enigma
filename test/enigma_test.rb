require 'MiniTest/autorun'
require 'MiniTest/pride'
require './lib/enigma'
require 'MiniTest/mock'
require './lib/key_generator'

class EnigmaTest < Minitest::Test
  def test_total_shift
    e = Enigma.new
    key = 41521
    date = 150518           # May 15, 2018
    offsets = [8, 3, 2, 4]  # last four ditits of date**2
    a = 41 + 8
    b = 15 + 3
    c = 52 + 2
    d = 21 + 4
    expected = [a, b, c, d]
    output = e.total_shift(key)
    assert_equal expected, output
  end

  def test_encrpyt_one_letter
    e = Enigma.new
    key = 41521
    date = 150518           # May 15, 2018
    offset = [8, 3, 2, 4]   # last four ditits of date**2
    my_message = 'b'        # position is 1.
    total_shift = 41 + 8    # first two digits of key plus A shift

    output = e.encrypt(my_message, key, date)
    expected = e.char_map[50]  # (1 + 41 + 8) % 85
    assert_equal expected, output
  end

  def test_encrypt_four_letters
    e = Enigma.new
    key = 41521
    date = 150518           # May 15, 2018
    offsets = [8, 3, 2, 4]  # last four ditits of date**2
    my_message = 'bird'     # char positions are 1, 8, 17, 3.
    # total shift is first and second digits of key plus offset.
    # b's total shift = 41 + 8 = 49
    # i's total shift = 15 + 3 = 18
    # r's total shift = 52 + 2 = 54
    # d's total shift = 21 + 4 = 25

    output = e.encrypt(my_message, key, date)
    b_expected = e.char_map[50]  # 50 = (1 + 49) % 85
    i_expected = e.char_map[26]  # 26 = (8 + 18) % 85
    r_expected = e.char_map[71]  # 71 = (17 + 54) % 85
    d_expected = e.char_map[28]  # 28 = (3 + 25) % 85
    assert_equal b_expected, output[0]
    assert_equal i_expected, output[1]
    assert_equal r_expected, output[2]
    assert_equal d_expected, output[3]
  end

  def test_encrypt_words_longer_than_four
    e = Enigma.new
    key = "41521"
    date = 150518           # May 15, 2018
    my_message = 'birdbird'  # "bird" is known to enrpyt to "YA(C"
    output = e.encrypt(my_message, key, date)
    expected = "YA(CYA(C"
    assert_equal expected, output
  end

  def test_encrypt_numbers_and_characters
    e = Enigma.new
    key = 41521
    date = 150518           # May 15, 2018
    offsets = [8, 3, 2, 4]  # last four ditits of date**2
    my_message = '9/?'      # char positions are 61, 81, 82.
    # total shift is first and second digits of key plus offset.
    # 9's total shift = 41 + 8 = 49
    # /'s total shift = 15 + 3 = 18
    # ?'s total shift = 52 + 2 = 54
    output = e.encrypt(my_message, key, date)
    nine_expected = e.char_map[25]  # 25 = (61 + 49) % 85
    slash_expected = e.char_map[14]  # 14 = (81 + 18) % 85
    question_mark_expected = e.char_map[51]  # 51 = (82 + 54) % 85

    assert_equal nine_expected, output[0]
    assert_equal slash_expected, output[1]
    assert_equal question_mark_expected, output[2]
  end

  def test_decrypt_with_known_ciphertext_known_key
    e = Enigma.new
    key = 41521
    original_message = "bird"
    ciphertext = "YA(C"
    decrypted_text = e.decrypt(ciphertext, key)
    assert_equal original_message, decrypted_text
  end

  def test_encrypt_decrypt_with_random_key
    e = Enigma.new
    key = e.keygen.key
    original_message = "this 1s 5o secret? ..end.."
    ciphertext = e.encrypt(original_message, key)
    decrypted_text = e.decrypt(ciphertext, key)
    assert_equal original_message, decrypted_text
  end

  def test_cipher_shifts_known_plaintext
    e = Enigma.new
    plaintext = "bird"
    shift = [49, 18, 54, 25]  # using key 41521 and date 150518
    expected_ciphertext = "YA(C"
    ciphertext = e.cipher(plaintext, shift, 1)
    assert_equal expected_ciphertext, ciphertext
  end

  def test_cipher_shifts_known_ciphertext
    e = Enigma.new
    expected_plaintext = "bird"
    shift = [49, 18, 54, 25]  # using key 41521 and date 150518
    known_ciphertext = "YA(C"
    ciphertext = e.cipher(known_ciphertext, shift, -1)
    assert_equal expected_plaintext, ciphertext
  end
end
