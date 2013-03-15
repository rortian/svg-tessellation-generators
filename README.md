# SVG Tessellation Generators

These are the ruby generators of the tessellations that appeared in
in the book SVG Tessellation. It is easy to run these on the 
(cloud 9 ide)[https://c9.io]. Just run

    bundle install
    
and then you can generate a tessellation by running its corresponding
ruby file

    ./p6m.rb
    
which will produce a 'output.html' file.  There is not currently a gem
or cli options, these files just match the code in the book using a
sparse number of ruby features. Expect a better api soon.


### jruby

Should be resolved soon but these do not run under jruby's native
(Xerces) nokogiri. The gem version of this library will centainly 
support jruby. 