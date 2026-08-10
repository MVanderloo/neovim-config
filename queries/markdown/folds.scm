; NOTE: `(#trim!)` is used to prevent empty lines at the end of the section from being folded.
((section
    (atx_heading)) @fold
    (#trim! @fold))
