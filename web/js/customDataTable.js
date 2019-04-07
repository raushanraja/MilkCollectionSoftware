$(document).ready(function () {

    // CLearing data from fields
    $("#farmer_id").val("");
    $("#qty").val("");
    $("#fat").val("");
    $("#snf").val("");

    // Setting focus to id field
    $(function(){
        $("#farmer_id").focus();
    });

    $('#dtBasicExample').DataTable( {
        lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],  // lengths of cloumn shown to choose  
        "scrollY": "45vh",  // Enabeling scroll Vertically with height of 50vh
        "scrollCollapse": true, 
        "order": [[ 0, "desc" ]],   // ordered by column number in descending order. 0: column number. "asc" ascendindg
    
    
        /* DOM Options
            l - length changing input control
            f - filtering input
            t - The table!
            i - Table information summary
            p - pagination control
            r - processing display element
            B - Buttons
            S - Select 
        */
    
    
        /* STYLING
    
            < and > - div element
            <"class" and > - div with a class
            <"#id" and > - div with an ID
            <"#id.class" and > - div with an ID and a class
    
            eg: "<'row'<'col-sm-6'l><'col-sm-6'f>>" // f for filtering output
    
        */
    
        dom:"<'row'<'col-sm-12 col-md-6'l>"+        // l for showing the number of rows to display
            "<'col-sm-12 col-md-6'f>>" +            // f for search bar, filtering output
            "<'row'<'col-sm-12'tr>>" +              // t: for main table and r: for proccessing row 
            "<'row'<'col-sm-12 col-md-5'i>"+       // Table inforamtion summary
            "<'col-sm-12 col-md-7' p>>"+              // p for pagination 
            "<'row z-depth-3 bg-white'<'m-auto col-sm-4'B>>",         // Buttons
        buttons: [
    
            { extend: 'copy', className: ' btn   btn-deep-orange glyphicon glyphicon-duplicate' },
            { extend: 'csv', className:  ' btn   btn-deep-orange glyphicon glyphicon-save-file' },
            { extend: 'excel', className:' btn   btn-deep-orange glyphicon glyphicon-list-alt' },
            { extend: 'pdf', className: '  btn   btn-deep-orange glyphicon glyphicon-file',
                exportOptions: {
                    columns: ':visible'
                },
                customize: function (doc) {
                    doc.content[1].table.widths =
                        Array(doc.content[1].table.body[0].length + 1).join('*').split('');
                }},
            { extend: 'print', className: 'btn btn-deep-orange glyphicon glyphicon-print',
            }
        ]
    } );
    
});