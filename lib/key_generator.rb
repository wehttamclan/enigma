class KeyGenerator

  def get_mac_address_from_shell
    mac_address = `ifconfig en0 | grep -e "ether" | cut -d ' ' -f 2 | tr -d ':'`
  end

  def convert_hex_to_decimal(mac_address)
    # mac_address =
  end

  # def determine_if_comp_is_mac
  # end
  #
  # def
  # end
end
