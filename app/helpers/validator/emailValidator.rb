class EmailValidator
  def self.valid?(email)
    parser = Mail::RFC2822Parser.new
    parser.root = :addr_spec
    result = parser.parse(email)

    # Don't allow for a TLD by itself list (sam@localhost)
    # The Grammar is: (local_part "@" domain) / local_part ... discard latter
    result &&
       result.respond_to?(:domain) &&
       result.domain.dot_atom_text.elements.size > 1
  end
end
