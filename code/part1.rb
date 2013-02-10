def palindrome?(str)
    str=str.upcase.gsub(/\W/,'')
    str==str.reverse
end

def count_words(str)
    h=Hash.new
    str=str.downcase
    str.split(/\W+/).each do |word|
        if h.has_key? word  
            h[word]+=1 
        else
            h[word]=1
        end
    end
    return h
end
