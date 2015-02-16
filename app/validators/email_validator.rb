require 'mail'

# taken from https://github.com/hengwoon/valid_email/blob/mail-2.6.1/lib/valid_email/validate_email.rb
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    begin
      m = Mail::Address.new(value)
      valid = valid_email?(m, value)
    rescue StandardError
      valid = false
    end
    record.errors[attribute] << (options[:message] || 'is invalid') unless valid
  end

  private

  def valid_email?(email, value)
    # We must check that value contains a domain and that value is an email address
    looks_valid = email.domain && email.address == value

    domain_dot_elements = email.domain.split(/\./)
    looks_valid && domain_dot_elements.none?(&:blank?) && domain_dot_elements.size > 1
  end
end
