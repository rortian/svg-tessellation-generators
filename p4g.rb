#!/usr/bin/env ruby

require 'nokogiri'

require 'pry'

html = Nokogiri::XML::Builder.new do 

  html do
    head do
      title "p4g"
    end
    body do
      svg do
        defs do
          g :id => "eighth" do
            path :fill => "rgb(68,77,97)", :d => "m 126.1428,120.49645 c 24.33282,-21.547397 -3.80798,-25.762047 0.25254,0.63135"
            path :fill => "rgb(121,66,52)", :d => "m 123.11234,109.38478 c 4.53816,-7.08998 -7.78567,-11.362871 0,0 z"
            path :fill => "rgb(85,98,112)", :d => "M 123.23861,123.52691 C 128.48507,95.929003 79.636302,111.28806 122.8598,122.7693"
            path :fill => "rgb(121,80,33)", :d => "m 121.97592,125.16841 c -24.716086,35.20691 -26.811944,-2.88744 0,0 z"
          end
          g :id => "quarter" do
            use :"xlink:href" => "#eighth"
            use :"xlink:href" => "#eighth", :transform => "translate(125,125) matrix(0,-1,-1,0,0,0) translate(-125,-125)"
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
        ((-2)..15).each do |m|
          ((-2)..15).each do |n|
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
