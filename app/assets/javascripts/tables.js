document.addEventListener('turbolinks:load',function() {
    var table = $('.datatable').DataTable( {
        responsive: true,
        bPaginate: false,
        bFilter: false,
        ordering: false
    } );
} );
