require 'active_model'
require 'active-model-email-validator'

class ContactFormValidator
  include ActiveModel::Validations

  attr_reader :attributes

  validates(
      :email,
        :presence => {:message => 'Email requerido.'},
        :email    => {:message => 'Email no válido.'}
  )

  validates(
      :mki,
      :absence => {:message => 'Error. Mensaje no enviado.'}
  )

  validates(
      :message,
        :presence => {:message => 'Mensaje requerido.'}
  )

  def initialize(attributes = {})
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end

  def response
    if valid?
      response = {}
      response[:ok] = 'ok'
      response
    else
      errors.messages
    end
  end
end
