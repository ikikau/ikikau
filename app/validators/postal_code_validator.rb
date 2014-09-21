class PostalCodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return true unless value.present?

    unless value =~ /\A\d{7}\z/
      record.errors[attribute] << (options[:message] || I18n.t('errors.validators.postal_code'))
    end
  end
end
