def combine_anagrams(words)
    out=[]
    words.each do |word|
        sword = sort_word word
        added = false
        for i in 0..(out.length-1)
            if sort_word(out[i][0]) == sword
                out[i]<<word 
                added = true
            end
        end
        out<<[word] if added == false
    end
    return out
end

def sort_word(word)
    word.downcase.chars.sort.join
end


