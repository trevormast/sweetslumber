document.addEventListener('turbolinks:load',function() {

  $('#plusOneButton').on('click', function(e) {
    e.preventDefault();
    var plusOneField = $('#plusOneField')
    
    if (plusOneField.val() == 'false') {
      $('#plusOneField').val('true');
      $('#plusOnePrice').text('$20.00');
      var plusOnePriceString = $('#plusOnePrice').text();
      var priceString = $('#totalPrice').text();

      price = convertPriceToNum(priceString);
      plusOnePrice = convertPriceToNum(plusOnePriceString);
      var newTotalString = addPlusOneToTotal(price, plusOnePrice);


      $('#totalPrice').text(newTotalString);
    }
    else {
      console.log('already added plus one');
    }
    
  })

  function convertPriceToNum(priceString) {
    priceString = priceString.replace('$', '');
    priceString = priceString.replace('.', ''); 
    return parseInt(priceString);
  }

  function addPlusOneToTotal(price, plusOnePrice) {
    var totalDollars = ((price + plusOnePrice) / 100).toFixed(2);
    return '$' + totalDollars;
  }

})