#!/usr/bin/env ruby

require 'nokogiri'

require 'pry'

html = Nokogiri::XML::Builder.new do 

  html do
    head do
      title "p4m"
    end
    body do
      svg do
        defs do
          g :id => "eighth" do
            path :d => "m 109.60155,102.06117 c 0.44437,0.57916 0.38803,5.2222 1.01015,5.42957 2.7823,0.92743 8.81101,2.21719 6.43973,-2.52538 -1.00095,-2.00189 -5.29056,1.95429 -7.44988,-2.90419 z", :fill => "rgb(243,243,134)"
            path :d => "m 124.62757,121.00153 c -0.37321,-2.91177 -4.97217,-16.70681 -1.01015,-18.68782 5.09656,-2.548284 -0.36914,6.31345 6.9448,6.31345 5.71811,0 16.16244,-10.819674 16.16244,-2.52538 0,0.81476 0.4156,16.41498 0,16.41498 -5.03566,0 -1.91487,-19.02497 -4.16688,-14.52094 -15.38879,30.77757 -6.78898,-6.59555 -17.17259,3.78807 -2.31933,2.31933 0.17233,6.91012 -1.51523,9.72272", :fill => "rgb(80,102,110)"
            path :d => "m 135.86552,131.60813 c -1.84245,-1.83476 -10.65437,-11.31644 -7.95495,-14.01586 0.42134,-0.42135 3.29844,7.59159 7.70241,11.99556 1.18893,1.18893 11.19269,-4.05012 12.12183,-1.26269 1.57875,4.73626 -2.22709,1.65491 -5.93465,2.27284 -4.29333,0.71556 6.34927,8.33376 4.16688,8.33376 -2.9227,0 -8.41105,-6.0088 -10.10152,-7.32361 z", :fill =>"rgb(34,61,74)"
          end
          g :id => "quarter" do
            use :"xlink:href" => "#eighth"
            use :"xlink:href" => "#eighth", :transform => "matrix(0,1,1,0,0,0)"
          end
          g :id => "tile" do
            use :"xlink:href" => "#quarter"
            use :"xlink:href" => "#quarter", :transform => "rotate(90,150,150)"
            use :"xlink:href" => "#quarter", :transform => "rotate(180,150,150)"
            use :"xlink:href" => "#quarter", :transform => "rotate(270,150,150)"
          end
        end
        x1, y1 =  100,0
        x2, y2 =  0,100
        ((-2)..2).each do |m|
          ((-2)..2).each do |n|
            x_delta = m*x1 + n*x2
            y_delta = m*y1 + n*y2
            use :"xlink:href" => "#tile",:transform => "translate(#{x_delta},#{y_delta})"
          end
        end
      end
    end
  end

end

out = File.new('output.html','w')
out.puts html.doc.to_html
out.close
