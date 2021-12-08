IMPORT INTO AOL_SCHEMA.NDCDIM
       FROM LOCAL CSV FILE 'D:\\msc-ds\\course-resource\\business-intelligence\\Project-A\\semicolon-seperated-ndcdim.csv'
        COLUMN SEPARATOR = ';';