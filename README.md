Import Excel API
================

This is a Ruby on Rails API project that importing data from excel file and return it as JSON. The idea here is to get the base64 encoded string of a file and save it as Temp file with its extension. Then create another object of ActionDispatch::Http::UploadedFile type that uses the Temp file and Then pass it to roo gem methods to process it.

It has one action called import which require a parameter called file.


Best Regards
Ahmed Bahaggag
ROR Developer at Clickapps.co