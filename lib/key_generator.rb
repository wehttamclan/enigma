class KeyGenerator

  def key
    mac_address = get_mac_address_from_shell
    hex = convert_hex_to_decimal(mac_address)
    first_five = get_first_five(mac_address)
  end

  def get_mac_address_from_shell
    `ifconfig en0 | grep -e "ether" | cut -d ' ' -f 2 | tr -d ':'`
  end

  def convert_hex_to_decimal(mac_address)
    mac_address = mac_address.to_i(16)
  end

  def get_first_five(mac_address)
    mac_address = mac_address.to_s[0..4].to_i
  end

  def calc_offset(date)
    if date > 0
      (date**2).to_s[-4..-1].chars.map { |digit| digit.to_i }
    else
      000000
    end
  end
end
