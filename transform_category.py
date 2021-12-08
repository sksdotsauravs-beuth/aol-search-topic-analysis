import re

input_file_path = r'C:\excel-generated.csv'
output_file_path = r'C:\semicolon-separated.csv'

pattern = r'(\d{1,2})(,)(.*)(,)(\d{0,2})(,)("?)([^"]*)("?)'
replacement = r'\1;\3;\5;\8'

with open(input_file_path, 'r') as input_file:
    with open(output_file_path, 'w') as output_file:
        skip_line = 3;
        current_line = 0;
        if current_line < skip_line:
            while current_line < skip_line:
                input_file.readline()
                current_line += 1
            for line in input_file:
                output_file.write(re.sub(pattern, replacement, line.rstrip('\n')) + '\n')