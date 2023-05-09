import pandas as pd

file1 = pd.read_excel('appversion_A.xlsx')
file2 = pd.read_excel('reference.xlsx')
comparison_values = file1.values == file2.values
comparison_df = pd.DataFrame(comparison_values)
comparison_df.to_excel('comparison.xlsx', index=False)
