def ceasars_crypt (palabra)
    resultado = ''
    palabra.each_char do |letra|
      for i in (0..2)
          letra = letra.next[0]
      end
        if letra.match(/[a-zA-Z]/)
          resultado << letra.upcase
        end
    end
    puts(resultado)
end


def palindrome? (palabra)
  i = 0;
  y = -1;
  palabra.each_char do
    if palabra [i] != palabra [y]
      puts ("La palabra no es palindrima")
      return
    end
      i = i + 1
      y = y - 1
  end
  puts ("La palabra es palindroma")
end

def sum_squares (numeros = [])
  resultado = 0
  numeros.each do |num|
    resultado = resultado + num**2
  end
  puts (resultado)
end

puts ceasars_crypt('hola Mundo233___')
puts ceasars_crypt('UBYNZHAQB')
puts ceasars_crypt('abcd')
puts ceasars_crypt('NOPQ')

puts palindrome?('abcdcba')
puts palindrome?('abcddcba')
puts palindrome?('nope')
puts sum_squares([1, 2, 3, 4])
puts sum_squares((1..10))
