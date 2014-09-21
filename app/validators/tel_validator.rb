class TelValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return true unless value.present?

    unless value =~ /\A\d{9,11}\z/
      record.errors[attribute] << (options[:message] || I18n.t('errors.messages.invalid'))
    end
  end
end
