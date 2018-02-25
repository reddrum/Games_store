jQuery ->
  Stripe.setPublishableKey('pk_test_euex08dR6VzyTou3Nncrri1C')

  form = document.getElementById('payment-form')
	form.addEventListener 'submit', (event) ->
	  event.preventDefault()
	  stripe.createToken(card).then (result) ->
	    if result.error
	      # Inform the customer that there was an error.
	      errorElement = document.getElementById('card-errors')
	      errorElement.textContent = result.error.message
	    else
	      # Send the token to your server.
	      stripeTokenHandler result.token
	    return
	  return

	stripeTokenHandler = (token) ->
	  # Insert the token ID into the form so it gets submitted to the server
	  form = document.getElementById('payment-form')
	  hiddenInput = document.createElement('input')
	  hiddenInput.setAttribute 'type', 'hidden'
	  hiddenInput.setAttribute 'name', 'stripeToken'
	  hiddenInput.setAttribute 'value', token.id
	  form.appendChild hiddenInput
	  # Submit the form
	  form.submit()
	  return  

