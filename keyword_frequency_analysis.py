from nltk import word_tokenize
from nltk.corpus import stopwords
from nltk.probability import FreqDist
from operator import itemgetter

additional_stop_word_set = set(
    [
        '.','\'s','http','new','&','www','com','york','.com','ny','ca','san','pa','-','nj','\'','fl',';','de','nc',
        '2','20','get','la','st','--','...','va','st.','tx','las','1','3','4','ga','co','4','b','nyc','ct','go','md',
        'tn','sc','c','il','e','5','r','el','n','n\'t','10','mi','u','az','8','mo','j','al','rv','ky','6','x','7',
        'set','k','mn','w','nh','g','wa','ms','12','vs','9','h','p','im','mt','v','f','20','wi','50','l','lee','n',
        '\'m','wv','ii','en','11'
    ]
)

english_stop_word_set = set(stopwords.words('english')).union(additional_stop_word_set)
aol_raw_query_file_path = 'E:\\query-qc.txt'

word_frequency_dictionary = dict()

def freq_dist(file_path, start_line, end_line, stop_words):
    from_line = 1
    with open(file_path, 'r') as file:
        if start_line > 1:
            while from_line < start_line:
                file.readline()
                from_line += 1
        token_list = []
        
        for line in file:
            if from_line > end_line:
                break;
            else:
                token_list += [word for word in set(item for item in word_tokenize(line.rstrip('\n'))) if word not in stop_words]
                from_line += 1
    
    freq_dist_list = FreqDist(token_list)
    most_common_list = freq_dist_list.most_common(len(freq_dist_list))
    return most_common_list

def merge_in_dictionary(freq_dist_list, frequency_dictionary):
    for word, count in freq_dist_list:
        frequency_dictionary[word] = (frequency_dictionary.get(word) if word in frequency_dictionary else 0) + count


line_limit = 1000000
for time in range(0, 11):
    start_line = int(time * line_limit) + 1
    end_line = int((time + 1) * line_limit)
    merge_in_dictionary(freq_dist(aol_raw_query_file_path, start_line, end_line, english_stop_word_set), word_frequency_dictionary)

sorted_dict = sorted(word_frequency_dictionary.items(), key=itemgetter(1), reverse=True)
with open('E:\\frequency.txt', 'w') as handle:
    for w, c in sorted_dict:
        if word_frequency_dictionary[w] >= 50:
            handle.write(f'{w} = {word_frequency_dictionary[w]}\n')