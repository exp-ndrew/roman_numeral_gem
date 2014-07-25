def roman_numeral input
  if input.class == String
    roman_numeral_to_number input
    puts roman_numeral_to_number input
  elsif input.class == Fixnum
    number_to_roman_numeral input
    puts number_to_roman_numeral input
  end
end

def roman_numeral_to_number numeral

  if (/^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/).match(numeral) == nil
    final_number = "That was not a valid input."

  else

    numeral = numeral.split('')
    final_number = 0

    numerals = {
    "M" => 1000,
    "D" => 500,
    "C" => 100,
    "L" => 50,
    "X" => 10,
    "V" => 5,
    "I" => 1
  }

    numeral.each_with_index do |letter, i|
      if numeral[i] == "C"
        if numeral[i+1] == "M"
          final_number -= 100
        elsif numeral[i+1] == "D"
          final_number -= 100
        else
          final_number += 100
        end

      elsif numeral[i] == "X"
        if numeral[i+1] == "C"
          final_number -= 10
        elsif numeral[i+1] == "L"
          final_number -= 10
        else
          final_number += 10
        end

      elsif numeral[i] == "I"
        if numeral[i+1] == "X"
          final_number -= 1
        elsif numeral[i+1] == "V"
          final_number -= 1
        else
          final_number += 1
        end

      elsif numeral[i] == "M"
        final_number += 1000

      elsif numeral[i] == "D"
        final_number += 500

      elsif numeral[i] == "L"
        final_number += 50

      elsif numeral[i] == "V"
        final_number += 5
      end

    end

      final_number
  end

end


def number_to_roman_numeral (input)
  if input > 3999
    "That is not a valid input."
  else

    input_array = input.to_s.split('')
    numeral_array = []
    input_array2 = []

    numerals = {
      "M"   => 1000,
      "CM" => 900,
      "D" => 500,
      "CD" => 400,
      "C" => 100,
      "XC" => 90,
      "L" => 50,
      "XL" => 40,
      "X" => 10,
      "IX" => 9,
      "V" => 5,
      "IV" => 4,
      "I" => 1
    }

    input_array.map! {|i| i.to_i}

      if input_array.length == 4
        input_array2 << (input_array[0] * 1000)
        input_array2 << (input_array[1] * 100)
        input_array2 << (input_array[2] * 10)
        input_array2 << input_array[3]
      elsif input_array.length == 3
        input_array2 << (input_array[0] * 100)
        input_array2 << (input_array[1] * 10)
        input_array2 << input_array[2]
      elsif input_array.length == 2
        input_array2 << (input_array[0] * 10)
        input_array2 << input_array[1]
      else
        input_array2 << input_array[0]
      end

    numerals.each do |letter, number|
      if number <= input
        numeral_array.push(letter)
        input -= number
        redo
      end
    end

  numeral_array.join

  end

end


