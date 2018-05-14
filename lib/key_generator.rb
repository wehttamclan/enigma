class KeyGenerator

  def get_mac_address_from_shell
    `ifconfig en0 | grep -e "ether" | cut -d ' ' -f 2 | tr -d ':'`
  end

  def convert_hex_to_decimal
    get_mac_address_from_shell.to_i(16)
  end

  def get_first_five
    convert_hex_to_decimal.to_s[0..4].to_i
  end
end
