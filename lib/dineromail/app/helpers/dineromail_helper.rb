module DineromailHelper
  def dineromail_button(item_name,amount,options = {})
    options = options.symbolize_keys
    button_image_url = options.delete(:button_image_url) || Dineromail.configuration.button_image_url
    payment_url = options.delete(:payment_url) || Dineromail.configuration.payment_url
    form_options = options.delete(:form) || {}
    button_class = options.delete(:button_class)
    form_options[:action] = payment_url
    form_options[:method] = "post"
    content_tag(:form, form_options) do
      ''.html_safe.tap do |html|
        html << dineromail_inputs(item_name,amount,options)
        # html << content_tag(:input,nil, :type => 'image', :src => button_image_url, :border => '0', :name=> 'submit', :alt=>'Pagar con Dineromail' )
        html << content_tag(:button, "Pagar con Dineromail", :type => :submit, :class => button_class)
      end
    end
  end
  
  
  def dineromail_inputs(item_name,amount,options = {})
    options = options.symbolize_keys
    logo_url =  options[:logo_url] || Dineromail.configuration.logo_url
    return_url =  options[:return_url] || Dineromail.configuration.return_url
    error_url =  options[:error_url] || Dineromail.configuration.error_url
    pending_url = options[:pending_url] || Dineromail.configuration.pending_url
    message =  options[:message] ? 1 : 0
    account_number =  options[:account_number] || Dineromail.configuration.account_number
    pay_methods = options[:pay_methods] || Dineromail.configuration.pay_methods
    currency = options[:currency] || Dineromail.configuration.currency
    transaction_id = options[:transaction_id]
    item_number = options[:item_number]
    seller_name = options[:seller_name]
    item_code = options[:item_code]
    
    ''.html_safe.tap do |html|
      # html << content_tag(:input,nil, :type => 'hidden', :name => 'NombreItem', :value =>item_name)
      # html << content_tag(:input,nil, :type => 'hidden', :name => 'TipoMoneda', :value =>currency)
      # html << content_tag(:input,nil, :type => 'hidden', :name => 'PrecioItem', :value =>amount)
      # html << content_tag(:input,nil, :type => 'hidden', :name => 'E_Comercio', :value =>account_number)
      # html << content_tag(:input,nil, :type => 'hidden', :name => 'image_url', :value =>logo_url)
      # html << content_tag(:input,nil, :type => 'hidden', :name => 'DireccionExito', :value => return_url)
      # html << content_tag(:input,nil, :type => 'hidden', :name => 'DireccionFracaso', :value => error_url)
      # html << content_tag(:input,nil, :type => 'hidden', :name => 'Mensaje', :value => message)
      # html << content_tag(:input,nil, :type => 'hidden', :name => 'MediosPago', :value => pay_methods)
      # html << content_tag(:input,nil, :type => 'hidden', :name => 'NroItem', :value => item_number) if item_number
      # html << content_tag(:input,nil, :type => 'hidden', :name => 'TRX_ID', :value => transaction_id) if transaction_id
      html << content_tag(:input, nil, :type => 'hidden', :name => 'tool', :value => 'cart')
      html << content_tag(:input, nil, :type => 'hidden', :name => 'merchant', :value => account_number)
      html << content_tag(:input, nil, :type => 'hidden', :name => 'country_id', :value => '3')
      html << content_tag(:input, nil, :type => 'hidden', :name => 'seller_name', :value => seller_name) if seller_name
      html << content_tag(:input, nil, :type => 'hidden', :name => 'language', :value => 'es')
      html << content_tag(:input, nil, :type => 'hidden', :name => 'transaction_id', :value => transaction_id) if transaction_id
      html << content_tag(:input, nil, :type => 'hidden', :name => 'currency', :value => currency)
      html << content_tag(:input, nil, :type => 'hidden', :name => 'ok_url', :value => return_url)
      html << content_tag(:input, nil, :type => 'hidden', :name => 'error_url', :value => error_url)
      html << content_tag(:input, nil, :type => 'hidden', :name => 'pending_url', :value => pending_url)
      html << content_tag(:input, nil, :type => 'hidden', :name => 'payment_method_available', :value => pay_methods)
      html << content_tag(:input, nil, :type => 'hidden', :name => 'change_quantity', :value => '0')
      
      # The one product (this is a cart)
      html << content_tag(:input, nil, :type => 'hidden', :name => 'item_code_1', :value => item_code)
      html << content_tag(:input, nil, :type => 'hidden', :name => 'item_name_1', :value => item_name)
      html << content_tag(:input, nil, :type => 'hidden', :name => 'item_ammount_1', :value => amount)
      html << content_tag(:input, nil, :type => 'hidden', :name => 'item_quantity_1', :value => '1')
      html << content_tag(:input, nil, :type => 'hidden', :name => 'item_currency_1', :value => 'CLP')
    end
  end  
  
  
end


