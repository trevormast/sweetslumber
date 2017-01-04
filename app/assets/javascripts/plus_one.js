document.addEventListener('turbolinks:load',function() {
  $('#plusOneButton').on('click', function(e) {
    e.preventDefault();
    var plusOnePriceString = $('meta[name="plus-one-price"]').attr('content');
    var priceString = $('meta[name="price"]').attr('content');
    var plusOneField = $('#plusOneField');
    
    if (plusOneField.val() == 'false') {
      addPlusOne(priceString, plusOnePriceString);
    }
    else if (plusOneField.val() =='true') {
      removePlusOne(priceString);
    }
    else {
      console.log('No value');
    }
    
  })

  function addPlusOne(priceString, plusOnePriceString) {
    $('#plusOneField').val('true');
    $('#plusOnePrice').text(stringToMoney(plusOnePriceString));

    price = convertMoneyToNum(priceString);
    plusOnePrice = convertMoneyToNum(plusOnePriceString);
    var newTotalString = addPlusOneToTotal(price, plusOnePrice);

    var button = $('#plusOneButton');
    button.removeClass('btn-primary');
    button.addClass('btn-warning');
    button.text('Remove Adult');

    $('#totalPrice').text(newTotalString);
  }

  function removePlusOne(priceString) {
    $('#plusOneField').val('false');
    $('#plusOnePrice').text("$0.00");

    var button = $('#plusOneButton');
    button.removeClass('btn-warning');
    button.addClass('btn-primary');
    button.text('Add Adult');

    $('#totalPrice').text(stringToMoney(priceString));
  }

  function convertMoneyToNum(money) {
    money = money.replace('$', '');
    money = money.replace('.', ''); 
    return parseInt(money);
  }

  function addPlusOneToTotal(price, plusOnePrice) {
    var totalDollars = ((price + plusOnePrice) / 100).toFixed(2);
    return '$' + totalDollars;
  }

  function stringToMoney(string) {
    return "$" + (parseInt(string)/100).toFixed(2);
  }

})