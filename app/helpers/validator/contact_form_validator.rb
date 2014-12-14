require 'active_model'
require 'email_validator'

class ContactFormValidator
  include ActiveModel::Validations

  attr_reader :attributes

  validates(
      :email,
        :presence => {message: 'Email requerido.'},
        :email    => {message: 'Email no válido.'}
  )

  validates(
      :mki,
      :absence => {message: 'Error. Mensaje no enviado.'}
  )

  validates(
      :message,
        :presence => {message: 'Mensaje requerido.'}
  )

  def initialize(attributes = {})
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end

  def response
    valid? ? valid_response : invalid_response
  end

  private

  def valid_response
    response = {}
    response[:ok] = 'ok'
    response
  end

  def invalid_response
    errors.messages
  end

end
