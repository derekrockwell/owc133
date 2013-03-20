// Use this to customize the wymeditor boot process
// Just mirror the options specified in boot_wym.js with the new options here.
// This will completely override anything specified in boot_wym.js for that key.
// e.g. skin: 'something_else'
if (typeof(custom_wymeditor_boot_options) == "undefined") { custom_wymeditor_boot_options = {
    classesItems: [
    {name: 'text-align', rules:['left', 'center', 'right', 'justify'], join: '-'}
    , {name: 'image-align', rules:['left', 'right'], join: '-'}
    , {name: 'font-size', rules:['small', 'normal', 'large'], join: '-'}
    , {name: 'btn btn-primary'}
    , {name: 'btn btn-large'}
    ]
}; }

