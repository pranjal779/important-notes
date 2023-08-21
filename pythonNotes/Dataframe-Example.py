'''
Data frames are a two-dimensional data structure that is similar to a table. They are often used to store and manipulate tabular data. Data frames are typically created using the pandas library.

To create a data frame, you can use the DataFrame() constructor. The syntax is:
'''

import pandas as pd
df = pd.DataFrame({'Name': ['John', 'Mary'], 'Age': [25, 27]})

'''
where:

Name is the name of the column
Age is the name of the column
['John', 'Mary'] is the list of values for the Name column
[25, 27] is the list of values for the Age column
Once you have created a data frame, you can access its columns and rows using the square bracket notation. For example, to access the value of the Name column for the first row, you would use:
'''

df['Name'][0]

# You can also use the loc and iloc accessors to access specific rows and columns. For example, to access the value of the Age column for the second row, you would use:

df.loc[1, 'Age']

# and to access the third row and the first column, you would use:

df.iloc[2, 0]

# Data frames are a powerful tool for storing and manipulating tabular data. They are often used in data science and machine learning applications.
