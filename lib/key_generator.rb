class KeyGenerator
  attr_reader :mac_address

  def initialize
    @mac_address = get_mac_address_from_shell
  end

  def get_mac_address_from_shell
    `ifconfig en0 | grep -e "ether" | cut -d ' ' -f 2 | tr -d ':'`
  end

  def convert_hex_to_decimal(num_string)
    num_string = mac_address.to_i(16)
  end

  def get_first_five(num)
    num = mac_address.to_s[0..4].to_i
  end

  # def determine_if_comp_is_mac
  # end
  #
  # def
  # end
end
