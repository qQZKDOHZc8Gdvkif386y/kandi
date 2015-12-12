Rails.configuration.stripe = {
    :publishable_key => ENV['pk_test_1CYVqU25ZMTNUwFuGmkPlRYz'],
    :secret_key      => ENV['sk_test_Widu46M8PLwx1D7Z8qNJehg0']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]