#!/usr/bin/env ruby
# frozen_string_literal: true

require 'drawille'

canvas = Drawille::Canvas.new

$stdin.each_line.with_index do |line, line_index|
  line.chomp.each_char.with_index do |char, char_index|
    canvas.set(char_index, line_index) unless char == ' '
  end
end

puts canvas.frame
